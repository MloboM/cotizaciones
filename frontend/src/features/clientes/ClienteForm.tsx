import { useEffect, useState } from "react"
import { useForm } from "react-hook-form"
import { zodResolver } from "@hookform/resolvers/zod"
import * as z from "zod"
import { supabase } from "@/services/supabase/client"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Loader2, Building2, MapPin, Contact, CreditCard, Search } from "lucide-react"

import ubicacionesCR from "@/data/ubicaciones_cr.json"

const formSchema = z.object({
    tipo_identificacion_codigo: z.string().min(2, { message: "Requerido." }),
    identificacion: z.string().min(9, { message: "Inválida." }),
    razon_social: z.string().min(3, { message: "Mínimo 3 caracteres." }),
    codigo_actividad_cr: z.string().optional(),
    estado_comercial: z.enum(["prospecto", "activo", "inactivo", "perdido"]),
    moneda_preferida_codigo: z.string().min(3),
    condicion_pago: z.string().min(1, { message: "Requerido." }),
    dias_credito: z.coerce.number().min(0),
    limite_credito: z.coerce.number().min(0),
    descuento_maximo_permitido: z.coerce.number().min(0).max(100),
    contacto_nombre: z.string().min(2, { message: "Requerido." }),
    contacto_cargo: z.string().optional(),
    contacto_email: z.string().email({ message: "Inválido." }),
    contacto_telefono: z.string().optional(),
    provincia: z.string().optional(),
    canton: z.string().optional(),
    distrito: z.string().optional(),
    senas: z.string().optional(),
})

type ClienteFormValues = z.infer<typeof formSchema>
interface ClienteFormProps {
    clienteToEdit?: any | null; // Recibe los datos si estamos en modo edición
    onSuccess?: () => void;
    onCancel?: () => void;
}

export function ClienteForm({ clienteToEdit, onSuccess, onCancel }: ClienteFormProps) {
    const [tiposIdentificacion, setTiposIdentificacion] = useState<{ codigo: string; nombre: string }[]>([])
    const [isFetchingCatalogs, setIsFetchingCatalogs] = useState(true)
    const [isSubmitting, setIsSubmitting] = useState(false)

    // ESTADO PARA LA API DE HACIENDA
    const [isSearchingHacienda, setIsSearchingHacienda] = useState(false)

    const form = useForm({
        resolver: zodResolver(formSchema),
        defaultValues: {
            tipo_identificacion_codigo: clienteToEdit?.tipo_identificacion_codigo || "",
            identificacion: clienteToEdit?.numero_identificacion || "",
            razon_social: clienteToEdit?.razon_social || "",
            codigo_actividad_cr: clienteToEdit?.metadata?.cr?.codigo_actividad || "",

            estado_comercial: clienteToEdit?.estado_comercial || "prospecto",
            moneda_preferida_codigo: clienteToEdit?.moneda_preferida_codigo || "CRC",
            condicion_pago: clienteToEdit?.condicion_pago || "contado",
            dias_credito: clienteToEdit?.dias_credito || 0,
            limite_credito: clienteToEdit?.limite_credito || 0,
            descuento_maximo_permitido: clienteToEdit?.descuento_maximo_permitido || 0,

            contacto_nombre: clienteToEdit?.contactos_cliente?.[0]?.nombre_completo || "",
            contacto_cargo: clienteToEdit?.metadata?.contacto?.cargo || "",
            contacto_email: clienteToEdit?.contactos_cliente?.[0]?.email || "",
            contacto_telefono: clienteToEdit?.metadata?.contacto?.telefono || "",

            provincia: clienteToEdit?.metadata?.cr?.ubicacion?.provincia_id || "",
            canton: clienteToEdit?.metadata?.cr?.ubicacion?.canton_id || "",
            distrito: clienteToEdit?.metadata?.cr?.ubicacion?.distrito_id || "",
            senas: clienteToEdit?.metadata?.cr?.ubicacion?.senas || ""
        },
    })

    // OBSERVADORES REACTIVOS
    const watchProvincia = form.watch("provincia")
    const watchCanton = form.watch("canton")
    const watchTipoId = form.watch("tipo_identificacion_codigo")
    const watchIdentificacion = form.watch("identificacion")

    const cantonesDisponibles = ubicacionesCR.provincias.find(p => p.id === watchProvincia)?.cantones || []
    const distritosDisponibles = cantonesDisponibles.find(c => c.id === watchCanton)?.distritos || []

    // CARGA DE CATÁLOGOS INICIALES
    useEffect(() => {
        async function loadCatalogs() {
            try {
                const { data } = await supabase.from('tipos_identificacion').select('codigo, nombre').order('codigo')
                if (data) setTiposIdentificacion(data)
            } finally { setIsFetchingCatalogs(false) }
        }
        loadCatalogs()
    }, [])

    // =======================================================================
    // MAGIA HACIENDA: Función para consultar la API de Costa Rica
    // =======================================================================
    useEffect(() => {
        async function fetchDatosHacienda(identificacion: string) {
            setIsSearchingHacienda(true)
            try {
                const response = await fetch(`https://api.hacienda.go.cr/fe/ae?identificacion=${identificacion}`)
                if (response.ok) {
                    const data = await response.json()

                    // 1. Autocompletar Razón Social
                    if (data.nombre) {
                        form.setValue("razon_social", data.nombre, { shouldValidate: true })
                    }

                    // 2. Autocompletar Código de Actividad (Toma el primero principal)
                    if (data.actividades && data.actividades.length > 0) {
                        form.setValue("codigo_actividad_cr", data.actividades[0].codigo, { shouldValidate: true })
                    }
                }
            } catch (error) {
                console.warn("Fallo al consultar Hacienda (Posible CORS o API caída). Degradación elegante activa.")
            } finally {
                setIsSearchingHacienda(false)
            }
        }

        if (!watchTipoId || !watchIdentificacion) return

        // REGLAS DE DISPARO AUTOMÁTICO SEGÚN LONGITUD
        const isFisicaLlenada = watchTipoId === "01" && watchIdentificacion.length === 9
        const isJuridicaONiteLlenada = (watchTipoId === "02" || watchTipoId === "04") && watchIdentificacion.length === 10
        const isDimexLlenada = watchTipoId === "03" && (watchIdentificacion.length === 11 || watchIdentificacion.length === 12)

        if (isFisicaLlenada || isJuridicaONiteLlenada || isDimexLlenada) {
            fetchDatosHacienda(watchIdentificacion)
        }
    }, [watchIdentificacion, watchTipoId, form])

    // =======================================================================
    // MAGIA SUPABASE: El Conector Real (INSERT doble)
    // =======================================================================
    async function onSubmit(values: ClienteFormValues) {
        setIsSubmitting(true)
        try {
            // 0. OBTENER EL TENANT (EMPRESA_ID)
            const { data: { user } } = await supabase.auth.getUser()
            const { data: perfil } = await supabase
                .from('perfiles')
                .select('empresa_id')
                .eq('id', user?.id)
                .single()

            if (!perfil?.empresa_id) throw new Error("No se pudo identificar la empresa del usuario actual.")
            const empresaId = perfil.empresa_id

            // 1. Preparamos el payload exacto (sirve tanto para INSERT como para UPDATE)
            const payloadCliente = {
                empresa_id: empresaId,
                tipo_identificacion_codigo: values.tipo_identificacion_codigo,
                numero_identificacion: values.identificacion,
                nombre_comercial: values.razon_social,
                razon_social: values.razon_social,
                estado_comercial: values.estado_comercial,
                moneda_preferida_codigo: values.moneda_preferida_codigo,
                condicion_pago: values.condicion_pago,
                dias_credito: values.dias_credito,
                limite_credito: values.limite_credito,
                descuento_maximo_permitido: values.descuento_maximo_permitido,
                metadata: {
                    contacto: {
                        telefono: values.contacto_telefono,
                        cargo: values.contacto_cargo
                    },
                    cr: {
                        codigo_actividad: values.codigo_actividad_cr,
                        ubicacion: {
                            provincia_id: values.provincia,
                            canton_id: values.canton,
                            distrito_id: values.distrito,
                            senas: values.senas
                        }
                    }
                }
            }

            // 2. EVALUAMOS SI ESTAMOS EDITANDO O CREANDO
            if (clienteToEdit) {
                // 🟡 MODO EDICIÓN (UPDATE)
                console.log("Actualizando Cliente...", payloadCliente)

                // A. Actualizamos la tabla principal de clientes
                const { error: errorUpdate } = await supabase
                    .from('clientes')
                    .update(payloadCliente)
                    .eq('id', clienteToEdit.id) // 🟢 Condición vital para no sobreescribir toda la tabla

                if (errorUpdate) throw errorUpdate

                // B. Actualizamos el contacto (si el cliente ya tenía uno)
                const contactoExistente = clienteToEdit.contactos_cliente?.[0]
                if (contactoExistente?.id) {
                    const { error: errorContacto } = await supabase
                        .from('contactos_cliente')
                        .update({
                            nombre_completo: values.contacto_nombre,
                            email: values.contacto_email
                        })
                        .eq('id', contactoExistente.id) // 🟢 Actualizamos por el ID del contacto

                    if (errorContacto) throw errorContacto
                }

                alert("¡Cliente actualizado correctamente!")

            } else {
                // 🟢 MODO CREACIÓN (INSERT)
                console.log("Insertando Cliente...", payloadCliente)

                // A. Insertamos el nuevo cliente
                const { data: clienteInsertado, error: errorCliente } = await supabase
                    .from('clientes')
                    .insert(payloadCliente)
                    .select()
                    .single()

                if (errorCliente) throw errorCliente

                // B. Insertamos su contacto principal con el nuevo ID generado
                if (clienteInsertado) {
                    const payloadContacto = {
                        empresa_id: empresaId,
                        cliente_id: clienteInsertado.id,
                        nombre_completo: values.contacto_nombre,
                        email: values.contacto_email,
                        es_principal: true
                    }

                    console.log("Insertando Contacto...", payloadContacto)

                    const { error: errorContacto } = await supabase
                        .from('contactos_cliente')
                        .insert(payloadContacto)

                    if (errorContacto) throw errorContacto
                }

                alert("¡Cliente creado exitosamente!")
            }

            // Éxito total: Cerramos el formulario y recargamos la tabla
            if (onSuccess) onSuccess()

        } catch (error: any) {
            console.error("❌ Error de Base de Datos:", error)
            alert(`Hubo un error al guardar: ${error.message || 'Revisa la consola'}`)
        } finally {
            setIsSubmitting(false)
        }
    }

    // =======================================================================
    // MAGIA HACIENDA: Determinar límite de caracteres según el tipo de ID
    // =======================================================================
    const getMaxLength = (tipo: string) => {
        switch (tipo) {
            case "01": return 9   // Física
            case "02": return 10  // Jurídica
            case "04": return 10  // NITE
            case "03": return 12  // DIMEX
            default: return 12
        }
    }

    if (isFetchingCatalogs) {
        return (
            <div className="flex flex-col items-center justify-center h-48 space-y-3">
                <Loader2 className="h-6 w-6 animate-spin text-emerald-600" />
                <p className="text-sm font-medium text-zinc-500">Cargando catálogos...</p>
            </div>
        )
    }

    return (
        <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8 flex flex-col h-full">

                <Tabs defaultValue="fiscal" className="w-full flex-1">
                    <div className="overflow-x-auto pb-2 sm:pb-0">
                        <TabsList className="flex flex-col sm:grid sm:grid-cols-2 lg:grid-cols-4 w-full h-auto p-1 gap-1 bg-zinc-200/50 rounded-lg">
                            <TabsTrigger value="fiscal" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <Building2 className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Fiscal y General</span>
                            </TabsTrigger>
                            <TabsTrigger value="contactos" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <Contact className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Contacto Principal</span>
                            </TabsTrigger>
                            <TabsTrigger value="comercial" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <CreditCard className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Términos Comerciales</span>
                            </TabsTrigger>
                            <TabsTrigger value="ubicacion" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <MapPin className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Ubicación</span>
                            </TabsTrigger>
                        </TabsList>
                    </div>

                    <TabsContent value="fiscal" className="mt-6 focus-visible:outline-none">
                        <div className="p-5 sm:p-6 bg-white border border-zinc-200 shadow-sm rounded-xl space-y-6">
                            <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Información Fiscal y General</h3></div>
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">

                                <FormField control={form.control} name="tipo_identificacion_codigo" render={({ field }) => (
                                    <FormItem>
                                        <FormLabel className="text-[13px] font-medium text-zinc-500">Tipo de Identificación</FormLabel>
                                        <Select
                                            onValueChange={(val) => {
                                                field.onChange(val)
                                                form.setValue('identificacion', '') // Limpiamos la cédula si cambia el tipo
                                                form.setValue('razon_social', '')
                                            }}
                                            value={field.value}
                                        >
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-emerald-500/20 focus:border-emerald-500 rounded-md shadow-sm h-9"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200 opacity-100 shadow-md z-[100] rounded-md">
                                                {tiposIdentificacion.map((t) => (<SelectItem key={t.codigo} value={t.codigo} className="text-sm">{t.codigo} - {t.nombre}</SelectItem>))}
                                            </SelectContent>
                                        </Select>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                {/* MAGIA HACIENDA: Campo validado */}
                                <FormField control={form.control} name="identificacion" render={({ field }) => (
                                    <FormItem>
                                        <FormLabel className="text-[13px] font-medium text-zinc-500">Número de Identificación</FormLabel>
                                        <FormControl>
                                            <div className="relative">
                                                <Input
                                                    disabled={!watchTipoId}
                                                    placeholder={watchTipoId === "02" ? "Ej. 3101123456" : "Ej. 101230456"}
                                                    className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm"
                                                    maxLength={getMaxLength(watchTipoId)}
                                                    value={field.value}
                                                    onChange={(e) => {
                                                        // Filtro estricto: Solo permitimos que se escriban números
                                                        const soloNumeros = e.target.value.replace(/\D/g, '')
                                                        field.onChange(soloNumeros)
                                                    }}
                                                />
                                                {/* Icono indicador visual */}
                                                {isSearchingHacienda && (
                                                    <div className="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                                                        <Loader2 className="h-4 w-4 animate-spin text-emerald-500" />
                                                    </div>
                                                )}
                                            </div>
                                        </FormControl>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="razon_social" render={({ field }) => (
                                    <FormItem className="md:col-span-2">
                                        <FormLabel className="text-[13px] font-medium text-zinc-500">Razón Social Legal</FormLabel>
                                        <FormControl>
                                            <Input
                                                placeholder={isSearchingHacienda ? "Consultando Registro Nacional..." : "Ej. Corporación ABC S.A."}
                                                className={`bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm transition-colors ${isSearchingHacienda ? 'bg-zinc-50 text-emerald-700 font-medium border-emerald-200' : ''}`}
                                                {...field}
                                                readOnly={isSearchingHacienda} // Bloqueamos tipeo mientras busca
                                            />
                                        </FormControl>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="codigo_actividad_cr" render={({ field }) => (
                                    <FormItem className="md:col-span-2">
                                        <FormLabel className="text-[13px] font-medium text-zinc-500">Código Actividad Económica (Hacienda CR)</FormLabel>
                                        <FormControl>
                                            <Input
                                                placeholder={isSearchingHacienda ? "Consultando..." : "Ej. 620101"}
                                                className={`bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm transition-colors ${isSearchingHacienda ? 'bg-zinc-50 text-emerald-700 font-medium border-emerald-200' : ''}`}
                                                {...field}
                                                value={field.value || ''}
                                                readOnly={isSearchingHacienda}
                                            />
                                        </FormControl>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />
                            </div>
                        </div>
                    </TabsContent>

                    <TabsContent value="contactos" className="mt-6 focus-visible:outline-none">
                        <div className="p-5 sm:p-6 bg-white border border-zinc-200 shadow-sm rounded-xl space-y-6">
                            <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Contacto Principal</h3></div>
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                                <FormField control={form.control} name="contacto_nombre" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Nombre Completo</FormLabel>
                                        <FormControl><Input className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm" {...field} /></FormControl>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="contacto_cargo" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Cargo</FormLabel>
                                        <FormControl><Input className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm" {...field} value={field.value || ''} /></FormControl>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="contacto_email" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Correo Electrónico</FormLabel>
                                        <FormControl><Input type="email" className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm" {...field} /></FormControl>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="contacto_telefono" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Teléfono</FormLabel>
                                        <FormControl><Input className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm" {...field} value={field.value || ''} /></FormControl>
                                    </FormItem>
                                )} />
                            </div>
                        </div>
                    </TabsContent>

                    <TabsContent value="comercial" className="mt-6 focus-visible:outline-none">
                        <div className="p-5 sm:p-6 bg-white border border-zinc-200 shadow-sm rounded-xl space-y-6">
                            <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Términos Comerciales y Pagos</h3></div>

                            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                                <FormField control={form.control} name="estado_comercial" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Estado en CRM</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-emerald-500/20 focus:border-emerald-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                <SelectItem value="prospecto">Prospecto</SelectItem>
                                                <SelectItem value="activo">Cliente Activo</SelectItem>
                                                <SelectItem value="inactivo">Inactivo</SelectItem>
                                                <SelectItem value="perdido">Perdido</SelectItem>
                                            </SelectContent>
                                        </Select>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="moneda_preferida_codigo" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Moneda Preferida</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-emerald-500/20 focus:border-emerald-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                <SelectItem value="CRC">Colones (CRC)</SelectItem>
                                                <SelectItem value="USD">Dólares (USD)</SelectItem>
                                            </SelectContent>
                                        </Select>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="condicion_pago" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Condición de Pago</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-emerald-500/20 focus:border-emerald-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                <SelectItem value="contado">Contado</SelectItem>
                                                <SelectItem value="credito">Crédito</SelectItem>
                                            </SelectContent>
                                        </Select>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="dias_credito" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Días de Plazo</FormLabel>
                                        <FormControl>
                                            <Input
                                                type="number"
                                                min="0"
                                                className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm"
                                                {...field}
                                                value={field.value !== undefined ? String(field.value) : ""}
                                                onChange={(e) => field.onChange(e.target.value ? Number(e.target.value) : 0)}
                                                disabled={form.watch('condicion_pago') === 'contado'}
                                            />
                                        </FormControl>
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="limite_credito" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Límite de Crédito Aprobado</FormLabel>
                                        <FormControl>
                                            <Input
                                                type="number"
                                                min="0"
                                                className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm"
                                                {...field}
                                                value={field.value !== undefined ? String(field.value) : ""}
                                                onChange={(e) => field.onChange(e.target.value ? Number(e.target.value) : 0)}
                                                disabled={form.watch('condicion_pago') === 'contado'}
                                            />
                                        </FormControl>
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="descuento_maximo_permitido" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Descuento Máx. Permitido (%)</FormLabel>
                                        <FormControl>
                                            <Input
                                                type="number"
                                                min="0"
                                                max="100"
                                                className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm"
                                                {...field}
                                                value={field.value !== undefined ? String(field.value) : ""}
                                                onChange={(e) => field.onChange(e.target.value ? Number(e.target.value) : 0)}
                                            />
                                        </FormControl>
                                    </FormItem>
                                )} />
                            </div>
                        </div>
                    </TabsContent>

                    <TabsContent value="ubicacion" className="mt-6 focus-visible:outline-none">
                        <div className="p-5 sm:p-6 bg-white border border-zinc-200 shadow-sm rounded-xl space-y-6">
                            <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Ubicación Geográfica (Costa Rica)</h3></div>
                            <div className="grid grid-cols-1 md:grid-cols-3 gap-5">
                                <FormField control={form.control} name="provincia" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Provincia</FormLabel>
                                        <Select onValueChange={(val) => { field.onChange(val); form.setValue('canton', ''); form.setValue('distrito', '') }} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-emerald-500/20 focus:border-emerald-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200 opacity-100 shadow-md z-[100] rounded-md">
                                                {ubicacionesCR.provincias.map(p => (<SelectItem key={p.id} value={p.id} className="text-sm">{p.nombre}</SelectItem>))}
                                            </SelectContent>
                                        </Select>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="canton" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Cantón</FormLabel>
                                        <Select onValueChange={(val) => { field.onChange(val); form.setValue('distrito', '') }} value={field.value} disabled={!watchProvincia}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-emerald-500/20 focus:border-emerald-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200 opacity-100 shadow-md z-[100] rounded-md">
                                                {cantonesDisponibles.map(c => (<SelectItem key={c.id} value={c.id} className="text-sm">{c.nombre}</SelectItem>))}
                                            </SelectContent>
                                        </Select>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="distrito" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Distrito</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value} disabled={!watchCanton}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-emerald-500/20 focus:border-emerald-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200 opacity-100 shadow-md z-[100] rounded-md">
                                                {distritosDisponibles.map(d => (<SelectItem key={d.id} value={d.id} className="text-sm">{d.nombre}</SelectItem>))}
                                            </SelectContent>
                                        </Select>
                                    </FormItem>
                                )} />
                                <FormField control={form.control} name="senas" render={({ field }) => (
                                    <FormItem className="md:col-span-3"><FormLabel className="text-[13px] font-medium text-zinc-500">Dirección Exacta (Señas)</FormLabel>
                                        <FormControl><Input placeholder="Ej. 100m sur de la iglesia..." className="bg-white border-zinc-300 focus-visible:ring-emerald-500/20 focus-visible:border-emerald-500 rounded-md shadow-sm h-9 text-sm" {...field} value={field.value || ''} /></FormControl>
                                    </FormItem>
                                )} />
                            </div>
                        </div>
                    </TabsContent>
                </Tabs>

                <div className="sticky bottom-0 bg-[#f8f9fa]/90 backdrop-blur-md pt-4 pb-6 border-t border-zinc-200 flex flex-col-reverse sm:flex-row justify-end gap-3 z-50">
                    <Button type="button" variant="outline" onClick={onCancel} disabled={isSubmitting} className="w-full sm:w-auto px-6 border-zinc-300 text-zinc-700 hover:bg-zinc-100 rounded-md h-9 text-sm shadow-sm">Cancelar</Button>
                    <Button type="submit" disabled={isSubmitting} className="w-full sm:w-auto bg-emerald-600 text-white hover:bg-emerald-700 px-8 rounded-md h-9 text-sm font-medium shadow-sm transition-colors">
                        {isSubmitting ? <><Loader2 className="mr-2 h-4 w-4 animate-spin" /> Procesando...</> : 'Guardar Cliente Completo'}
                    </Button>
                </div>

            </form>
        </Form>
    )
}