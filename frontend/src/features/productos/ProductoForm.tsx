import { useState, useEffect } from "react"
import { useForm, useFieldArray } from "react-hook-form"
import { zodResolver } from "@hookform/resolvers/zod"
import {
    Package, Calculator, Truck,
    Link as LinkIcon, Building2, Sparkles,
    Search, Info, TrendingUp, History,
    AlertTriangle, Plus, Star, UploadCloud,
    Image as ImageIcon, BrainCircuit, Trash2,
    Loader2
} from "lucide-react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Textarea } from "@/components/ui/textarea"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

import { productoSchema, type ProductoFormValues } from "./producto-schema"
import { supabase } from "@/services/supabase/client"

interface ProductoWorkspaceProps {
    productoToEdit?: any | null
    initialData?: any | null
    onSuccess?: () => void
    onCancel?: () => void
}

export function ProductoForm({ productoToEdit, initialData, onSuccess, onCancel }: ProductoWorkspaceProps) {
    const [isSubmitting, setIsSubmitting] = useState(false)
    const [activeTab, setActiveTab] = useState("general")

    // ESTADOS PARA GUARDAR LOS DATOS REALES DE LA BD
    const [catalogos, setCatalogos] = useState({
        categorias: [] as any[],
        marcas: [] as any[],
        unidades: [] as any[],
        gruposFiscales: [] as any[]
    })
    const [isFetchingCatalogs, setIsFetchingCatalogs] = useState(true)

    // FETCH DE DATOS REALES (SEEDS)
    useEffect(() => {
        async function cargarCatalogosBase() {
            try {
                const [resCat, resMar, resUom, resGf] = await Promise.all([
                    supabase.from('categorias_producto').select('id, nombre').order('nombre'),
                    supabase.from('marcas').select('id, nombre').order('nombre'),
                    supabase.from('unidades_medida').select('id, codigo, nombre').order('nombre'),
                    supabase.from('grupos_fiscales').select('id, codigo, nombre, porcentaje').order('porcentaje')
                ])

                setCatalogos({
                    categorias: resCat.data || [],
                    marcas: resMar.data || [],
                    unidades: resUom.data || [],
                    gruposFiscales: resGf.data || []
                })
            } catch (error) {
                console.error("Error cargando catálogos:", error)
            } finally {
                setIsFetchingCatalogs(false)
            }
        }
        cargarCatalogosBase()
    }, [])

    // 🚀 TRADUCCIÓN INVERSA DE ENUMS (Backend -> Frontend)
    const dbTipo = initialData?.tipo_producto || initialData?.tipo_item || productoToEdit?.tipo_producto || productoToEdit?.tipo_item;
    const tipoItemMapeado = dbTipo === 'fisico' ? 'producto_fisico' : (dbTipo || 'producto_fisico');

    const form = useForm<ProductoFormValues>({
        resolver: zodResolver(productoSchema as any),
        defaultValues: {
            tipo_item: tipoItemMapeado,

            // 🛑 Limpia códigos únicos al clonar. Si es edición, mantiene los reales.
            sku: initialData ? "" : (productoToEdit?.codigo_sku || productoToEdit?.sku || ""),
            codigo_fabricante: initialData?.codigo_fabricante || productoToEdit?.codigo_fabricante || "",
            codigo_barras: initialData ? "" : (productoToEdit?.codigo_barras || ""),

            // Textos comerciales
            nombre: initialData ? `Copia de ${initialData?.nombre}` : (productoToEdit?.nombre || ""),
            descripcion_corta: initialData?.descripcion_corta || productoToEdit?.descripcion_corta || "",
            descripcion_larga: initialData?.descripcion_larga || productoToEdit?.descripcion_larga || "",
            estado: initialData ? "activo" : (productoToEdit?.activo === false ? "inactivo" : (productoToEdit?.estado || "activo")),

            // 🚀 EL TRADUCTOR: Mapea los nombres de Supabase a los de tu Formulario 🚀

            // 1. Catálogos Maestros (Estos faltaban en tu archivo)
            categoria_id: initialData?.categoria_id || productoToEdit?.categoria_id || "",
            marca_id: initialData?.marca_id || productoToEdit?.marca_id || "",

            // 2. Moneda Base (Tolerancia a variaciones de nombre en DB)
            moneda_codigo: initialData?.moneda_codigo || productoToEdit?.moneda_codigo || productoToEdit?.moneda_id || "CRC",

            // 3. Costo Proveedor Base (Se mapea desde "costo_estandar" de Supabase)
            costo_proveedor_base: initialData?.costo_proveedor_base || initialData?.costo_estandar || productoToEdit?.costo_estandar || productoToEdit?.costo_proveedor_base || 0,

            // 4. Código CABYS y Grupo Fiscal
            codigo_cabys: initialData?.codigo_cabys || productoToEdit?.codigo_cabys || "",
            grupo_fiscal_id: initialData?.grupo_fiscal_id || productoToEdit?.grupo_fiscal_id || "",
            origen: initialData?.origen || productoToEdit?.origen || "nacional",

            // 5. Históricos Financieros (Los dejamos listos por si los agregas a la interfaz)
            // costo_promedio: initialData?.costo_promedio || productoToEdit?.costo_promedio || 0,
            // ultima_compra: initialData?.ultima_compra || productoToEdit?.ultima_compra || 0,

            // 🚀 FIN DEL TRADUCTOR 🚀

            es_vendible: initialData?.es_vendible ?? productoToEdit?.es_vendible ?? true,
            permite_descuento: initialData?.permite_descuento ?? productoToEdit?.permite_descuento ?? true,

            controla_inventario: initialData?.controla_inventario ?? productoToEdit?.controla_inventario ?? true,
            unidad_medida_id: initialData?.unidad_medida_id || productoToEdit?.unidad_medida_id || "",
            peso_kg: initialData?.peso_kg || productoToEdit?.peso_kg || 0,
            volumen_m3: initialData?.volumen_m3 || productoToEdit?.volumen_m3 || 0,
            stock_minimo: initialData?.stock_minimo || productoToEdit?.stock_minimo || 0,
            punto_reorden: initialData?.punto_reorden || productoToEdit?.punto_reorden || 0,

            componentes: initialData?.componentes || productoToEdit?.componentes || [],
            proveedores: initialData?.proveedores || productoToEdit?.proveedores || [],
            atributos_dinamicos: initialData?.atributos_dinamicos || productoToEdit?.atributos_dinamicos || []
        }
    })
    // =========================================================================
    // LÓGICA DE FILTRADO DINÁMICO
    // =========================================================================

    // 1. Zod nos garantiza que tipoItemActual SOLO puede ser uno de los 3 enums
    const tipoItemActual = form.watch("tipo_item");

    // 2. Filtramos el catálogo con reglas de negocio exactas
    const unidadesFiltradas = catalogos.unidades?.filter(u => {
        // Tomamos el código de la BD de forma segura
        const codigoUnidad = u.codigo || "";
        const unidadesTiempo = ['HR', 'DIA', 'MES'];

        // Mapeo exacto 1 a 1 basado en el Schema de Zod
        if (tipoItemActual === 'servicio' || tipoItemActual === 'suscripcion') {
            return unidadesTiempo.includes(codigoUnidad) || codigoUnidad === 'UN';
        }

        if (tipoItemActual === 'producto_fisico') {
            return !unidadesTiempo.includes(codigoUnidad) && codigoUnidad !== '';
        }

        return true; // Fallback de seguridad
    }) || [];

    // 3. Paracaídas de seguridad para la integridad de datos
    useEffect(() => {
        const unidadActualId = form.getValues("unidad_medida_id");
        if (!unidadActualId) return;

        const esValida = unidadesFiltradas.some(u => u.id === unidadActualId);
        if (!esValida) {
            form.setValue("unidad_medida_id", "");
        }
    }, [tipoItemActual, unidadesFiltradas, form]);

    const { fields: atributosFields, append: appendAtributo, remove: removeAtributo } = useFieldArray({
        control: form.control,
        name: "atributos_dinamicos"
    });

    const watchTipoItem = form.watch("tipo_item")
    const watchMoneda = form.watch("moneda_codigo")
    const watchCostoProveedor = form.watch("costo_proveedor_base") || 0

    const currencySymbols: Record<string, string> = { CRC: "₡", USD: "$", EUR: "€" }
    const currentSymbol = currencySymbols[watchMoneda] || "$"

    const colchonOperativo = 0.04
    const costoComercialEstimado = watchCostoProveedor * (1 + colchonOperativo)
    const costoPromedioPonderado = productoToEdit?.costo_promedio || 0.00;
    const costoUltimaCompra = productoToEdit?.costo_ultima_compra || 0.00;

    // Agrega esta función para atrapar los errores silenciosos
    function onInvalid(errores: any) {
        console.error("❌ Validaciones fallidas:", errores)
        alert("No se puede guardar: Faltan campos obligatorios. Por favor revisa las pestañas de Costos o Logística.")
    }

    async function onSubmit(values: ProductoFormValues) {
        setIsSubmitting(true)
        try {
            // 1. SEGURIDAD: Obtener el Tenant (empresa_id)
            const { data: { user } } = await supabase.auth.getUser()
            if (!user) throw new Error("No hay una sesión activa.")

            const { data: perfil } = await supabase
                .from('perfiles')
                .select('empresa_id')
                .eq('id', user.id)
                .single()

            if (!perfil?.empresa_id) throw new Error("No se pudo identificar la empresa del usuario.")
            const empresaId = perfil.empresa_id

            // 2. PAYLOAD PADRE: Traducción exacta a tu DDL SQL
            const payloadProducto = {
                empresa_id: empresaId,
                tipo_producto: values.tipo_item === 'producto_fisico' ? 'fisico' : values.tipo_item,
                codigo_sku: values.sku,
                codigo_fabricante: values.codigo_fabricante || null,
                codigo_barras: values.codigo_barras || null,
                nombre: values.nombre,
                descripcion_larga: values.descripcion_larga || null,
                categoria_id: values.categoria_id || null,
                marca_id: values.marca_id || null,
                grupo_fiscal_id: values.grupo_fiscal_id || null,
                unidad_medida_id: values.unidad_medida_id || null,
                codigo_cabys: values.codigo_cabys || null,
                costo_estandar: values.costo_proveedor_base,
                activo: values.estado === 'activo',
                deleted_at: values.estado === 'descontinuado' ? new Date().toISOString() : null,
                permite_descuento: values.permite_descuento,
                es_vendible: values.es_vendible,
                atributos_dinamicos: values.atributos_dinamicos || []
            }

            // 3. EJECUCIÓN (INSERCIÓN O ACTUALIZACIÓN)
            if (productoToEdit) {
                // 🟡 MODO EDICIÓN: Tabla Padre
                const { error: errorPadre } = await supabase
                    .from('productos')
                    .update(payloadProducto)
                    .eq('id', productoToEdit.id)
                    .eq('empresa_id', empresaId)

                if (errorPadre) throw errorPadre

                // 🟡 MODO EDICIÓN: Tabla Hija (Solo si es Físico)
                if (values.tipo_item === 'producto_fisico') {
                    const payloadFisico = {
                        producto_id: productoToEdit.id, // Requerido para el upsert
                        controla_inventario: values.controla_inventario,
                        peso_kg: values.peso_kg || 0,
                        volumen_m3: values.volumen_m3 || 0,
                        stock_minimo: values.stock_minimo || 0,
                        punto_reorden: values.punto_reorden || 0,
                    }
                    // 🚀 BLINDAJE TECH LEAD: Usamos upsert por si el ítem antes era un "Servicio"
                    await supabase.from('productos_fisicos').upsert(payloadFisico)
                }

                alert("¡Ficha del producto actualizada con éxito!")
            } else {
                // 🟢 MODO CREACIÓN / CLONACIÓN: Tabla Padre
                const { data: nuevoProducto, error: errorPadre } = await supabase
                    .from('productos')
                    .insert(payloadProducto)
                    .select()
                    .single()

                if (errorPadre) throw errorPadre

                // 🟢 MODO CREACIÓN / CLONACIÓN: Tabla Hija (Solo si es Físico)
                if (values.tipo_item === 'producto_fisico') {
                    const payloadFisico = {
                        producto_id: nuevoProducto.id,
                        controla_inventario: values.controla_inventario,
                        peso_kg: values.peso_kg || 0,
                        volumen_m3: values.volumen_m3 || 0,
                        stock_minimo: values.stock_minimo || 0,
                        punto_reorden: values.punto_reorden || 0,
                    }
                    const { error: errorFisico } = await supabase
                        .from('productos_fisicos')
                        .insert(payloadFisico)

                    if (errorFisico) console.error("Aviso: El producto se creó, pero falló la tabla física:", errorFisico)
                }

                alert("¡Producto guardado exitosamente en el catálogo!")
            }

            if (onSuccess) onSuccess()

        } catch (error: any) {
            console.error("❌ Error guardando el producto:", error)
            alert(`Error al guardar en base de datos: ${error.message || 'Revisa la consola'}`)
        } finally {
            setIsSubmitting(false)
        }
    }

    if (isFetchingCatalogs) {
        return (
            <div className="flex flex-col items-center justify-center h-48 space-y-3">
                <Loader2 className="h-6 w-6 animate-spin text-indigo-600" />
                <p className="text-sm font-medium text-zinc-500">Cargando catálogos y referencias...</p>
            </div>
        )
    }

    return (
        <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit, onInvalid)} className="space-y-8 flex flex-col h-full">
                {/* INDICADOR BCCR GLOBAL UBICADO COMO ENCABEZADO INDEPENDIENTE */}
                <div className="flex justify-end">
                    <div className="flex items-center gap-2 bg-white px-4 py-2 rounded-lg border border-blue-100 shadow-sm w-full sm:w-auto">
                        <Info className="h-4 w-4 text-blue-600 shrink-0" />
                        <span className="text-[12px] font-semibold text-blue-900 uppercase tracking-wider">Tipo Cambio BCCR:</span>
                        <span className="text-[13px] text-zinc-600 font-medium">C: ₡508.10 <span className="text-zinc-300 mx-2">|</span> V: ₡514.20</span>
                    </div>
                </div>

                <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full flex-1">

                    {/* MAQUETADO IDÉNTICO A CLIENTEFORM PARA LOS TABS */}
                    <div className="overflow-x-auto pb-2 sm:pb-0">
                        <TabsList className="flex flex-col sm:grid sm:grid-cols-3 lg:grid-cols-6 w-full h-auto p-1 gap-1 bg-zinc-200/50 rounded-lg">
                            <TabsTrigger value="general" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <Package className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">General</span>
                            </TabsTrigger>
                            <TabsTrigger value="costos" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <Calculator className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Costos</span>
                            </TabsTrigger>
                            <TabsTrigger value="logistica" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <Truck className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Logística</span>
                            </TabsTrigger>
                            <TabsTrigger value="proveedores" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <Building2 className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Proveedores</span>
                            </TabsTrigger>
                            <TabsTrigger value="bom" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <LinkIcon className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Ensambles</span>
                            </TabsTrigger>
                            <TabsTrigger value="ia" className="w-full py-2.5 justify-start sm:justify-center data-[state=active]:bg-white data-[state=active]:shadow-sm rounded-md transition-all text-sm font-medium text-zinc-600 data-[state=active]:text-zinc-900">
                                <Sparkles className="w-4 h-4 mr-2.5 sm:mr-2 shrink-0 text-zinc-400" /> <span className="truncate">Contexto & IA</span>
                            </TabsTrigger>
                        </TabsList>
                    </div>

                    {/* 🟢 PESTAÑA 1: GENERAL */}
                    <TabsContent value="general" className="mt-6 focus-visible:outline-none">
                        <div className="p-5 sm:p-6 bg-white border border-zinc-200 shadow-sm rounded-xl space-y-6">
                            <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Identificación del Ítem</h3></div>

                            <div className="grid grid-cols-1 md:grid-cols-4 gap-5">
                                {/* FILA 1: Identificadores core del producto */}
                                <FormField control={form.control} name="tipo_item" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Tipo de Ítem</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-indigo-500/20 focus:border-indigo-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                <SelectItem value="producto_fisico">Producto Físico</SelectItem>
                                                <SelectItem value="servicio">Servicio / Consultoría</SelectItem>
                                                <SelectItem value="suscripcion">Suscripción (SaaS)</SelectItem>
                                            </SelectContent>
                                        </Select>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="estado" render={({ field }) => (
                                    <FormItem>
                                        <FormLabel className="text-[13px] font-medium text-zinc-500">Estado del Producto</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value || "activo"}>
                                            <FormControl>
                                                <SelectTrigger className="bg-white border-zinc-300 focus:ring-indigo-500/20 focus:border-indigo-500 rounded-md shadow-sm h-9 text-sm">
                                                    <SelectValue placeholder="Seleccionar estado..." />
                                                </SelectTrigger>
                                            </FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                <SelectItem value="activo">
                                                    <div className="flex items-center gap-2"><div className="w-2 h-2 rounded-full bg-emerald-500"></div>Activo</div>
                                                </SelectItem>
                                                <SelectItem value="inactivo">
                                                    <div className="flex items-center gap-2"><div className="w-2 h-2 rounded-full bg-amber-500"></div>Inactivo (Pausado)</div>
                                                </SelectItem>
                                                <SelectItem value="descontinuado">
                                                    <div className="flex items-center gap-2"><div className="w-2 h-2 rounded-full bg-rose-500"></div>Descontinuado (Soft Delete)</div>
                                                </SelectItem>
                                            </SelectContent>
                                        </Select>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="sku" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">SKU Interno</FormLabel>
                                        <FormControl><Input placeholder="Ej: TOM-15A" className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...field} /></FormControl>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="codigo_fabricante" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Catálogo (Fabricante)</FormLabel>
                                        <FormControl><Input placeholder="Ej: 1110" className="bg-indigo-50/30 border-indigo-200 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...field} value={field.value || ''} /></FormControl>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                {/* FILA 2: Códigos adicionales y Clasificaciones Maestras */}
                                <FormField control={form.control} name="codigo_barras" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Código de Barras</FormLabel>
                                        <FormControl><Input placeholder="Opcional" className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...field} value={field.value || ''} /></FormControl>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="categoria_id" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Categoría Maestra</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-indigo-500/20 focus:border-indigo-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                {catalogos.categorias.map(cat => (
                                                    <SelectItem key={cat.id} value={cat.id}>{cat.nombre}</SelectItem>
                                                ))}
                                            </SelectContent>
                                        </Select>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="marca_id" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Marca Comercial</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-indigo-500/20 focus:border-indigo-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                {catalogos.marcas.map(marca => (
                                                    <SelectItem key={marca.id} value={marca.id}>{marca.nombre}</SelectItem>
                                                ))}
                                            </SelectContent>
                                        </Select>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                {/* Celda vacía para mantener el alineado de la cuadrícula perfecta en desktop */}
                                <div className="hidden md:block"></div>

                                {/* FILA 3 & 4: Textos y Prosas Descriptivas al Final */}
                                <FormField control={form.control} name="nombre" render={({ field }) => (
                                    <FormItem className="md:col-span-4"><FormLabel className="text-[13px] font-medium text-zinc-500">Nombre Corto</FormLabel>
                                        <FormControl><Input placeholder="Ej: Tomacorriente 15A 2P Eagle..." className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...field} /></FormControl>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="descripcion_larga" render={({ field }) => (
                                    <FormItem className="md:col-span-4"><FormLabel className="text-[13px] font-medium text-zinc-500">Descripción Larga (Comercial)</FormLabel>
                                        <FormControl>
                                            <Textarea placeholder="Escriba la prosa técnica que aparecerá en los PDFs de cotizaciones formales..." className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm min-h-[80px] text-sm resize-none" {...field} value={field.value || ''} />
                                        </FormControl>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />
                            </div>
                        </div>
                    </TabsContent>

                    {/* 🔵 PESTAÑA 2: COSTOS */}
                    <TabsContent value="costos" className="mt-6 focus-visible:outline-none">
                        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                            <div className="p-5 sm:p-6 bg-white border border-zinc-200 shadow-sm rounded-xl space-y-6">
                                <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Estructura de Costos y Fiscalidad</h3></div>

                                <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                                    <FormField control={form.control} name="grupo_fiscal_id" render={({ field }) => (
                                        <FormItem className="sm:col-span-2"><FormLabel className="text-[13px] font-medium text-zinc-500">Grupo de Impuestos (IVA) *</FormLabel>
                                            <Select onValueChange={field.onChange} value={field.value}>
                                                <FormControl><SelectTrigger className="bg-white border-l-4 border-l-red-500 border-zinc-300 focus:ring-red-500/20 focus:border-red-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar % IVA..." /></SelectTrigger></FormControl>
                                                <SelectContent className="bg-white border-zinc-200">
                                                    {catalogos.gruposFiscales.map(gf => (
                                                        <SelectItem key={gf.id} value={gf.id}>{gf.nombre}</SelectItem>
                                                    ))}
                                                </SelectContent>
                                            </Select>
                                            <FormMessage className="text-xs" />
                                        </FormItem>
                                    )} />

                                    {/* CAMPO CABYS AÑADIDO AQUÍ */}
                                    <FormField control={form.control} name="codigo_cabys" render={({ field }) => (
                                        <FormItem className="sm:col-span-2">
                                            <FormLabel className="text-[13px] font-medium text-zinc-500">Código CABYS (Hacienda)</FormLabel>
                                            <FormControl>
                                                <div className="space-y-2">
                                                    <Input
                                                        placeholder="Ej: 4690000000000"
                                                        className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm w-full sm:w-1/2"
                                                        {...field}
                                                        value={field.value || ''}
                                                    />
                                                    <Textarea
                                                        readOnly
                                                        placeholder="Descripción oficial del catálogo CABYS se mostrará aquí..."
                                                        className="bg-zinc-50/80 border-zinc-200 text-zinc-600 h-16 text-sm resize-none cursor-not-allowed"
                                                    />
                                                </div>
                                            </FormControl>
                                            <FormMessage className="text-xs" />
                                        </FormItem>
                                    )} />

                                    <FormField control={form.control} name="moneda_codigo" render={({ field }) => (
                                        <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Moneda Base</FormLabel>
                                            <Select onValueChange={field.onChange} value={field.value}>
                                                <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-indigo-500/20 focus:border-indigo-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                                <SelectContent className="bg-white border-zinc-200">
                                                    <SelectItem value="CRC">CRC</SelectItem>
                                                    <SelectItem value="USD">USD</SelectItem>
                                                    <SelectItem value="EUR">EUR</SelectItem>
                                                </SelectContent>
                                            </Select>
                                            <FormMessage className="text-xs" />
                                        </FormItem>
                                    )} />

                                    <FormField control={form.control} name="costo_proveedor_base" render={({ field }) => (
                                        <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Costo Proveedor Base (CPB)</FormLabel>
                                            <FormControl>
                                                <div className="relative">
                                                    <span className="absolute left-3 top-2.5 text-zinc-500 text-sm">{currentSymbol}</span>
                                                    <Input type="number" step="0.01" className="pl-7 bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...field} />
                                                </div>
                                            </FormControl>
                                            <p className="text-[11px] text-zinc-500 mt-1">Comercial Est.: {currentSymbol}{costoComercialEstimado.toFixed(2)}</p>
                                        </FormItem>
                                    )} />
                                </div>

                                <div className="space-y-3 pt-4 border-t border-zinc-100">
                                    <div className="bg-slate-50 border border-slate-200 rounded-lg p-3 flex justify-between items-center">
                                        <div className="flex items-center gap-2">
                                            <TrendingUp className="h-4 w-4 text-slate-400" />
                                            <p className="text-xs font-semibold text-slate-700">Costo Promedio (CPP)</p>
                                        </div>
                                        <p className="text-sm font-bold text-zinc-700">{currentSymbol}{costoPromedioPonderado.toFixed(2)}</p>
                                    </div>
                                    <div className="bg-slate-50 border border-slate-200 rounded-lg p-3 flex justify-between items-center">
                                        <div className="flex items-center gap-2">
                                            <History className="h-4 w-4 text-slate-400" />
                                            <p className="text-xs font-semibold text-slate-700">Última Compra</p>
                                        </div>
                                        <p className="text-sm font-bold text-zinc-700">{currentSymbol}{costoUltimaCompra.toFixed(2)}</p>
                                    </div>
                                    <p className="text-[10px] text-zinc-400 mt-2 italic text-center">Calculado automáticamente por Kardex de facturas.</p>
                                </div>
                            </div>
                        </div>
                    </TabsContent>

                    {/* 🟠 PESTAÑA 3: LOGÍSTICA */}
                    <TabsContent value="logistica" className="mt-6 focus-visible:outline-none">
                        <div className="p-5 sm:p-6 bg-white border border-zinc-200 shadow-sm rounded-xl space-y-6 mb-6">
                            <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Configuración Base Obligatoria</h3></div>

                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                                <FormField control={form.control} name="unidad_medida_id" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Unidad de Medida (UoM) *</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-l-4 border-l-red-500 border-zinc-300 focus:ring-red-500/20 focus:border-red-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar unidad..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                {unidadesFiltradas.map(uom => (
                                                    <SelectItem key={uom.id} value={uom.id}>
                                                        {uom.nombre} ({uom.codigo})
                                                    </SelectItem>
                                                ))}
                                            </SelectContent>
                                        </Select>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />

                                <FormField control={form.control} name="origen" render={({ field }) => (
                                    <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Origen de Compra</FormLabel>
                                        <Select onValueChange={field.onChange} value={field.value}>
                                            <FormControl><SelectTrigger className="bg-white border-zinc-300 focus:ring-indigo-500/20 focus:border-indigo-500 rounded-md shadow-sm h-9 text-sm"><SelectValue placeholder="Seleccionar..." /></SelectTrigger></FormControl>
                                            <SelectContent className="bg-white border-zinc-200">
                                                <SelectItem value="nacional">Compra Nacional (Local)</SelectItem>
                                                <SelectItem value="importado">Importación (Fletes/Aduanas)</SelectItem>
                                            </SelectContent>
                                        </Select>
                                        <FormMessage className="text-xs" />
                                    </FormItem>
                                )} />
                            </div>
                        </div>

                        {watchTipoItem === "producto_fisico" && (
                            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                                <div className="p-5 sm:p-6 bg-zinc-50 border border-zinc-200 shadow-sm rounded-xl space-y-6">
                                    <div className="border-b border-zinc-200 pb-3 flex items-center gap-2"><Truck className="h-4 w-4 text-zinc-700" /><h3 className="text-sm font-semibold text-zinc-900">Dimensiones WMS</h3></div>

                                    <FormField control={form.control} name="controla_inventario" render={({ field }) => (
                                        <FormItem className="flex flex-row items-center justify-between rounded-lg border border-zinc-200 bg-white p-4 shadow-sm">
                                            <div className="space-y-0.5">
                                                <FormLabel className="text-[13px] font-medium text-zinc-900">Activar Kardex</FormLabel>
                                                <p className="text-xs text-zinc-500">Apagar para insumos infinitos.</p>
                                            </div>
                                            <FormControl>
                                                <input type="checkbox" checked={field.value} onChange={field.onChange} className="h-4 w-4 rounded border-zinc-300 text-indigo-600 focus:ring-indigo-600" />
                                            </FormControl>
                                        </FormItem>
                                    )} />

                                    <div className="grid grid-cols-2 gap-5">
                                        <FormField control={form.control} name="peso_kg" render={({ field }) => (
                                            <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Peso (KG)</FormLabel>
                                                <FormControl><Input type="number" step="0.01" className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...field} /></FormControl>
                                            </FormItem>
                                        )} />
                                        <FormField control={form.control} name="volumen_m3" render={({ field }) => (
                                            <FormItem><FormLabel className="text-[13px] font-medium text-zinc-500">Volumen (m³)</FormLabel>
                                                <FormControl><Input type="number" step="0.0001" className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...field} /></FormControl>
                                            </FormItem>
                                        )} />
                                    </div>
                                </div>

                                <div className="p-5 sm:p-6 bg-orange-50 border border-orange-100 shadow-sm rounded-xl space-y-6">
                                    <div className="border-b border-orange-200 pb-3 flex items-center gap-2"><AlertTriangle className="h-4 w-4 text-orange-700" /><h3 className="text-sm font-semibold text-orange-900">Alertas de Reabastecimiento</h3></div>
                                    <div className="space-y-5">
                                        <FormField control={form.control} name="stock_minimo" render={({ field }) => (
                                            <FormItem><FormLabel className="text-[13px] font-medium text-orange-900">Stock Mínimo de Seguridad</FormLabel>
                                                <FormControl><Input type="number" step="1" className="bg-white border-orange-200 focus-visible:ring-orange-500/20 focus-visible:border-orange-500 rounded-md shadow-sm h-9 text-sm" {...field} /></FormControl>
                                            </FormItem>
                                        )} />
                                        <FormField control={form.control} name="punto_reorden" render={({ field }) => (
                                            <FormItem><FormLabel className="text-[13px] font-medium text-orange-900">Punto de Reorden (Sugerir Compra)</FormLabel>
                                                <FormControl><Input type="number" step="1" className="bg-white border-orange-200 focus-visible:ring-orange-500/20 focus-visible:border-orange-500 rounded-md shadow-sm h-9 text-sm" {...field} /></FormControl>
                                            </FormItem>
                                        )} />
                                    </div>
                                </div>
                            </div>
                        )}
                    </TabsContent>

                    {/* 🟤 PESTAÑA 4: PROVEEDORES */}
                    <TabsContent value="proveedores" className="mt-6 focus-visible:outline-none">
                        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">

                            {/* Tabla 1: Surtido Autorizado */}
                            <div className="bg-white p-0 rounded-xl border border-zinc-200 shadow-sm overflow-hidden h-fit">
                                <div className="p-5 border-b border-zinc-100 flex justify-between items-center bg-zinc-50/50">
                                    <div>
                                        <h3 className="text-sm font-semibold text-zinc-900">Surtido Autorizado</h3>
                                        <p className="text-xs text-zinc-500">Proveedores válidos para OC.</p>
                                    </div>
                                    <Button type="button" size="sm" className="bg-indigo-600 hover:bg-indigo-700 text-white h-8 text-xs gap-2">
                                        <Plus className="h-3.5 w-3.5" /> Añadir
                                    </Button>
                                </div>
                                <div className="overflow-x-auto">
                                    <table className="w-full text-sm text-left">
                                        <thead className="bg-zinc-50/50 text-zinc-500 text-xs uppercase font-semibold">
                                            <tr>
                                                <th className="px-5 py-3 border-b border-zinc-100">Proveedor</th>
                                                <th className="px-5 py-3 border-b border-zinc-100">SKU Prov.</th>
                                                <th className="px-5 py-3 border-b border-zinc-100 text-right">Costo Cat.</th>
                                            </tr>
                                        </thead>
                                        <tbody className="divide-y divide-zinc-100">
                                            <tr className="hover:bg-zinc-50/50 transition-colors">
                                                <td className="px-5 py-3 font-medium text-zinc-900 flex items-center gap-2">
                                                    IESA S.A. <span title="Proveedor Principal"><Star className="h-3 w-3 text-amber-400 fill-amber-400" /></span>
                                                </td>
                                                <td className="px-5 py-3 text-zinc-600 font-mono text-xs">A14549</td>
                                                <td className="px-5 py-3 text-right font-medium text-zinc-900">$1.05</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            {/* Tabla 2: Historial de Compras (Kardex) */}
                            <div className="bg-white p-0 rounded-xl border border-zinc-200 shadow-sm overflow-hidden h-fit">
                                <div className="p-5 border-b border-zinc-100 flex justify-between items-center bg-slate-50/80">
                                    <div className="flex items-center gap-3">
                                        <div className="bg-slate-200 p-2 rounded-lg"><History className="h-4 w-4 text-slate-700" /></div>
                                        <div>
                                            <h3 className="text-sm font-semibold text-slate-900">Historial de Compras</h3>
                                            <p className="text-xs text-slate-500">Últimas recepciones de bodega reales.</p>
                                        </div>
                                    </div>
                                </div>
                                <div className="overflow-x-auto">
                                    <table className="w-full text-sm text-left">
                                        <thead className="bg-slate-50 text-slate-500 text-[11px] uppercase font-semibold">
                                            <tr>
                                                <th className="px-4 py-3 border-b border-zinc-100">Fecha</th>
                                                <th className="px-4 py-3 border-b border-zinc-100">Proveedor</th>
                                                <th className="px-4 py-3 border-b border-zinc-100">Doc.</th>
                                                <th className="px-4 py-3 border-b border-zinc-100 text-right">Cant.</th>
                                                <th className="px-4 py-3 border-b border-zinc-100 text-right">Costo Unit.</th>
                                            </tr>
                                        </thead>
                                        <tbody className="divide-y divide-zinc-100">
                                            <tr className="hover:bg-slate-50/50 transition-colors">
                                                <td className="px-4 py-3 text-zinc-600 text-xs">12/05/2026</td>
                                                <td className="px-4 py-3 font-medium text-zinc-900 truncate max-w-[120px]">IESA S.A.</td>
                                                <td className="px-4 py-3 text-indigo-600 font-medium hover:underline cursor-pointer">REC-089</td>
                                                <td className="px-4 py-3 text-right text-zinc-600">100</td>
                                                <td className="px-4 py-3 text-right font-medium text-zinc-900">₡535.50</td>
                                            </tr>
                                            <tr className="hover:bg-slate-50/50 transition-colors">
                                                <td className="px-4 py-3 text-zinc-600 text-xs">03/04/2026</td>
                                                <td className="px-4 py-3 font-medium text-zinc-900 truncate max-w-[120px]">Sinsa Ferreterías</td>
                                                <td className="px-4 py-3 text-indigo-600 font-medium hover:underline cursor-pointer">REC-042</td>
                                                <td className="px-4 py-3 text-right text-zinc-600">50</td>
                                                <td className="px-4 py-3 text-right font-medium text-zinc-900">₡600.00</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </TabsContent>

                    {/* 🟣 PESTAÑA 5: BOM Y ENSAMBLES */}
                    <TabsContent value="bom" className="mt-6 focus-visible:outline-none">
                        <div className="bg-white p-0 rounded-xl border border-zinc-200 shadow-sm overflow-hidden">
                            <div className="p-5 border-b border-zinc-100 flex flex-col md:flex-row justify-between items-start md:items-center gap-4 bg-indigo-50/30">
                                <div className="flex items-start gap-3">
                                    <div className="bg-indigo-100 p-2 rounded-lg mt-0.5"><Package className="h-4 w-4 text-indigo-700" /></div>
                                    <div>
                                        <h3 className="text-sm font-semibold text-zinc-900">Creador de Kits y Ensambles (BOM)</h3>
                                        <p className="text-xs text-zinc-500 mt-1">Este producto es un Kit. Busque y agregue los insumos que se consumirán de la bodega al venderlo.</p>
                                    </div>
                                </div>
                                <div className="flex w-full md:w-auto gap-2">
                                    <div className="relative flex-1 md:w-64">
                                        <Search className="absolute left-3 top-2.5 h-4 w-4 text-zinc-400" />
                                        <Input placeholder="Buscar insumo..." className="pl-9 bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </TabsContent>

                    {/* 🧠 PESTAÑA 6: CONTEXTO & IA */}
                    <TabsContent value="ia" className="mt-6 focus-visible:outline-none space-y-6">
                        <div className="bg-indigo-50/80 border border-indigo-200 rounded-xl p-4 flex items-start gap-4 mb-2 shadow-sm">
                            <div className="bg-indigo-100 p-2 rounded-lg shrink-0 mt-0.5"><BrainCircuit className="h-5 w-5 text-indigo-700" /></div>
                            <div>
                                <h4 className="font-semibold text-sm text-indigo-900">Cerebro Vectorial (pgvector)</h4>
                                <p className="text-xs text-indigo-700/90 mt-1 leading-relaxed">
                                    Los documentos y atributos que ingrese aquí serán procesados automáticamente por la Inteligencia Artificial.
                                </p>
                            </div>
                        </div>

                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div className="space-y-6">
                                <div className="bg-white p-5 sm:p-6 rounded-xl border border-zinc-200 shadow-sm space-y-4">
                                    <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Fotografía Principal</h3></div>
                                    <div className="border-2 border-dashed border-zinc-200 rounded-lg p-8 flex flex-col items-center justify-center text-center bg-zinc-50 hover:bg-zinc-100 cursor-pointer group transition-colors">
                                        <div className="h-12 w-12 rounded-full bg-white border border-zinc-200 flex items-center justify-center mb-3 group-hover:border-indigo-300 transition-colors">
                                            <ImageIcon className="h-6 w-6 text-zinc-400 group-hover:text-indigo-600 transition-colors" />
                                        </div>
                                        <p className="text-sm font-medium text-zinc-700">Arrastre la imagen o haga clic</p>
                                    </div>
                                </div>
                                <div className="bg-white p-5 sm:p-6 rounded-xl border border-zinc-200 shadow-sm space-y-4">
                                    <div className="border-b border-zinc-100 pb-3"><h3 className="text-sm font-semibold text-zinc-900">Fichas Técnicas (PDF)</h3></div>
                                    <div className="border-2 border-dashed border-zinc-200 rounded-lg p-8 flex flex-col items-center justify-center text-center bg-zinc-50 hover:bg-zinc-100 cursor-pointer group transition-colors">
                                        <div className="h-12 w-12 rounded-full bg-white border border-zinc-200 flex items-center justify-center mb-3 group-hover:border-indigo-300 transition-colors">
                                            <UploadCloud className="h-6 w-6 text-zinc-400 group-hover:text-indigo-600 transition-colors" />
                                        </div>
                                        <p className="text-sm font-medium text-zinc-700">Subir documentos PDF</p>
                                    </div>
                                </div>
                            </div>

                            <div className="bg-white p-0 rounded-xl border border-zinc-200 shadow-sm overflow-hidden flex flex-col h-full min-h-[300px]">
                                <div className="p-5 border-b border-zinc-100 flex justify-between items-center bg-zinc-50/50">
                                    <div>
                                        <h3 className="text-sm font-semibold text-zinc-900">Atributos Dinámicos</h3>
                                    </div>
                                    <Button type="button" size="sm" variant="outline" className="h-8 text-xs gap-2 border-zinc-300 shadow-sm" onClick={() => appendAtributo({ clave: "", valor: "" })}>
                                        <Plus className="h-3.5 w-3.5" /> Atributo
                                    </Button>
                                </div>
                                <div className="p-5 flex-1 overflow-y-auto">
                                    {atributosFields.length === 0 ? (
                                        <div className="text-center py-12">
                                            <Sparkles className="h-8 w-8 text-zinc-300 mx-auto mb-3" />
                                            <p className="text-sm text-zinc-500">No hay atributos definidos.</p>
                                        </div>
                                    ) : (
                                        <div className="space-y-3">
                                            {atributosFields.map((field, index) => (
                                                <div key={field.id} className="flex gap-2 items-start">
                                                    <FormField control={form.control} name={`atributos_dinamicos.${index}.clave`} render={({ field: inputField }) => (
                                                        <FormItem className="flex-1 space-y-0">
                                                            <FormControl><Input placeholder="Clave (Ej: Color)" className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...inputField} /></FormControl>
                                                        </FormItem>
                                                    )} />
                                                    <FormField control={form.control} name={`atributos_dinamicos.${index}.valor`} render={({ field: inputField }) => (
                                                        <FormItem className="flex-1 space-y-0">
                                                            <FormControl><Input placeholder="Valor (Ej: Rojo Mate)" className="bg-white border-zinc-300 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500 rounded-md shadow-sm h-9 text-sm" {...inputField} /></FormControl>
                                                        </FormItem>
                                                    )} />
                                                    <Button type="button" variant="ghost" size="icon" className="h-9 w-9 text-red-500 hover:bg-red-50 hover:text-red-600 rounded-md" onClick={() => removeAtributo(index)}>
                                                        <Trash2 className="h-4 w-4" />
                                                    </Button>
                                                </div>
                                            ))}
                                        </div>
                                    )}
                                </div>
                            </div>
                        </div>
                    </TabsContent>
                </Tabs>

                {/* FOOTER 100% IDÉNTICO A CLIENTEFORM */}
                <div className="sticky bottom-0 bg-[#f8f9fa]/90 backdrop-blur-md pt-4 pb-6 border-t border-zinc-200 flex flex-col-reverse sm:flex-row justify-end gap-3 z-50">
                    <Button type="button" variant="outline" onClick={onCancel} disabled={isSubmitting} className="w-full sm:w-auto px-6 border-zinc-300 text-zinc-700 hover:bg-zinc-100 rounded-md h-9 text-sm shadow-sm">Cancelar</Button>
                    <Button type="submit" disabled={isSubmitting} className="w-full sm:w-auto bg-indigo-600 text-white hover:bg-indigo-700 px-8 rounded-md h-9 text-sm font-medium shadow-sm transition-colors">
                        {isSubmitting ? <><Loader2 className="mr-2 h-4 w-4 animate-spin" /> Procesando...</> : 'Guardar Ficha Técnica'}
                    </Button>
                </div>

            </form>
        </Form>
    )
}