import { z } from "zod"

export const productoSchema = z.object({

    // 🟢 PESTAÑA 1: Información General
    tipo_item: z.enum(["producto_fisico", "servicio", "suscripcion"]),
    sku: z.string().min(3, "El código/SKU debe tener al menos 3 caracteres"),
    codigo_fabricante: z.string().optional(),
    codigo_barras: z.string().optional(),
    nombre: z.string().min(3, "El nombre corto es obligatorio para facturación"),
    descripcion_corta: z.string().optional(),
    descripcion_larga: z.string().optional(),
    estado: z.enum(["activo", "inactivo", "descontinuado"]).default("activo"),

    // Toggles de Reglas Comerciales
    es_vendible: z.boolean().default(true),
    permite_descuento: z.boolean().default(true),

    // Clasificadores (🛠️ CORRECCIÓN: Se quitó .uuid() para aceptar IDs enteros o alfanuméricos de tu BD)
    categoria_id: z.string().optional().or(z.literal("")),
    marca_id: z.string().optional().or(z.literal("")),

    // 🔵 PESTAÑA 2: Finanzas y Fiscalidad
    moneda_codigo: z.string().default("CRC"),
    precio_base: z.coerce.number().min(0, "El precio de venta no puede ser negativo").default(0),
    costo_proveedor_base: z.coerce.number().min(0, "El costo no puede ser negativo").default(0),

    codigo_cabys: z.string().optional(),
    // 🛠️ CORRECCIÓN: Usamos .min(1) para obligar a seleccionar algo, sin forzar el formato UUID
    grupo_fiscal_id: z.string().min(1, "Debe seleccionar un grupo fiscal"),

    // 🟠 PESTAÑA 3: Logística y Especificaciones
    // 🛠️ CORRECCIÓN: Usamos .min(1) para obligar a seleccionar algo, sin forzar el formato UUID
    unidad_medida_id: z.string().min(1, "La unidad de medida es obligatoria"),
    origen: z.enum(["nacional", "importado"]).default("nacional"),

    // Físicos (`productos_fisicos`)
    controla_inventario: z.boolean().default(true),
    peso_kg: z.coerce.number().optional(),
    volumen_m3: z.coerce.number().optional(),
    stock_minimo: z.coerce.number().default(0),
    punto_reorden: z.coerce.number().default(0),

    // Intangibles (`productos_servicios`)
    horas_estimadas: z.coerce.number().optional(),
    perfiles_requeridos: z.array(z.string()).optional().default([]),

    // Suscripciones (`productos_suscripciones`)
    ciclo_facturacion: z.enum(["mensual", "trimestral", "anual"]).optional(),
    renovacion_automatica: z.boolean().default(true),
    limite_consumo: z.coerce.number().optional(),

    // 🟣 PESTAÑA 4: Ensambles (BOM - Kits)
    componentes: z.array(z.object({
        producto_hijo_id: z.string().min(1), // 🛠️ CORRECCIÓN
        cantidad: z.coerce.number().min(1)
    })).optional().default([]),

    // 🟤 PESTAÑA 5: Proveedores Autorizados
    proveedores: z.array(z.object({
        proveedor_id: z.string().min(1), // 🛠️ CORRECCIÓN
        es_principal: z.boolean().default(false),
        codigo_proveedor: z.string().optional(),
        tiempo_entrega_dias: z.coerce.number().default(0),
        moneda_codigo: z.string().default("USD"),
        costo_catalogo: z.coerce.number().min(0).default(0),
        cantidad_minima_orden: z.coerce.number().min(1).default(1)
    })).optional().default([]),

    // 🧠 PESTAÑA 6: Contexto & IA
    atributos_dinamicos: z.array(z.object({
        clave: z.string(),
        valor: z.string()
    })).optional().default([])

}).superRefine((data, ctx) => {
    // TRIBUNAL DE REGLAS DE NEGOCIO

    // Regla 1: Un servicio no usa WMS
    if (data.tipo_item === "servicio" && data.controla_inventario) {
        ctx.addIssue({
            code: z.ZodIssueCode.custom,
            message: "Un servicio o consultoría no puede llevar control de inventario físico.",
            path: ["controla_inventario"]
        });
    }

    // Regla 2: Longitud exacta del CABYS (CR)
    if (data.codigo_cabys && data.codigo_cabys.trim() !== "") {
        if (data.codigo_cabys.length !== 13) {
            ctx.addIssue({
                code: z.ZodIssueCode.custom,
                message: "El código CABYS oficial debe tener exactamente 13 caracteres numéricos.",
                path: ["codigo_cabys"]
            });
        }
    }

    // Regla 3: Unidad de Medida Estricta
    if (!data.unidad_medida_id || data.unidad_medida_id.trim() === "") {
        ctx.addIssue({
            code: z.ZodIssueCode.custom,
            message: "Debe asignar una Unidad de Medida (Ej: Unidad, Metro, Caja) para facturar.",
            path: ["unidad_medida_id"]
        });
    }
})

export type ProductoFormValues = z.infer<typeof productoSchema>