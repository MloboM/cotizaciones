"use client"

import { useState, useEffect } from "react"
import { getColumns, type ProductoRow } from "./components/columns"
import { supabase } from "@/services/supabase/client"
import { ProductoForm } from "./ProductoForm"
import { DataTable } from "./components/data-table"
import { Loader2, Plus, Sparkles } from "lucide-react"
import { Button } from "@/components/ui/button"

export function ProductosPage() {
    const [isFormOpen, setIsFormOpen] = useState(false)
    const [data, setData] = useState<ProductoRow[]>([])
    const [loading, setLoading] = useState(true)

    // Estados para controlar qué estamos haciendo
    const [productoToClone, setProductoToClone] = useState<any>(null)
    const [productoToEdit, setProductoToEdit] = useState<any>(null)

    useEffect(() => {
        fetchProductos()
    }, [])

    async function fetchProductos() {
        try {
            setLoading(true)
            const { data: productos, error } = await supabase
                .from('productos')
                .select('id, nombre, codigo_sku, activo, costo_estandar')
                .order('created_at', { ascending: false })

            if (error) throw error
            setData(productos as ProductoRow[] || [])
        } catch (error) {
            console.error("Error cargando productos:", error)
        } finally {
            setLoading(false)
        }
    }

    // 🚀 LÓGICA DE EDICIÓN
    const handleEdit = async (producto: ProductoRow) => {
        try {
            const { data: productoCompleto, error } = await supabase
                .from('productos')
                .select('*')
                .eq('id', producto.id)
                .single()

            if (error) throw error

            setProductoToEdit(productoCompleto)
            setIsFormOpen(true)
        } catch (error) {
            console.error("Error al obtener datos para editar:", error)
        }
    }

    // LÓGICA DE CLONACIÓN (Intacta)
    const handleClone = async (producto: ProductoRow) => {
        try {
            const { data: productoCompleto, error } = await supabase
                .from('productos')
                .select('*')
                .eq('id', producto.id)
                .single()

            if (error) throw error

            setProductoToClone(productoCompleto)
            setIsFormOpen(true)
        } catch (error) {
            console.error("Error al obtener datos para clonar:", error)
        }
    }

    // 🚀 LÓGICA DE SOFT DELETE (Descontinuar)
    const handleDelete = async (producto: ProductoRow) => {
        const confirmacion = window.confirm(`¿Estás seguro de que deseas descontinuar el producto "${producto.nombre}"? Esto lo ocultará de las búsquedas estándar.`)

        if (!confirmacion) return

        try {
            // Hacemos un update simple cambiando el estado
            const { error } = await supabase
                .from('productos')
                .update({ activo: false, estado: 'descontinuado' })
                .eq('id', producto.id)

            if (error) throw error

            // Recargamos la tabla para reflejar el cambio
            fetchProductos()
        } catch (error) {
            console.error("Error al descontinuar producto:", error)
            alert("Hubo un error al descontinuar el producto.")
        }
    }

    // Función auxiliar para cerrar y limpiar la memoria
    const closeForm = () => {
        setIsFormOpen(false)
        setProductoToClone(null)
        setProductoToEdit(null)
    }

    return (
        <div className="p-6 max-w-7xl mx-auto space-y-6 w-full">
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 border-b border-zinc-200 pb-5">
                <div>
                    <h1 className="text-2xl font-bold text-zinc-900 tracking-tight flex items-center gap-2">
                        Catálogo de Productos
                    </h1>
                    <p className="text-zinc-500 mt-1 text-sm">
                        Gestión de inventario y servicios agnósticos con Embedded AI.
                    </p>
                </div>

                {!isFormOpen && (
                    <Button
                        onClick={() => setIsFormOpen(true)}
                        className="bg-zinc-900 text-white hover:bg-zinc-800 rounded-lg px-4 h-9 text-sm font-medium shadow-sm transition-colors self-start sm:self-auto"
                    >
                        <Plus className="h-4 w-4 mr-2" />
                        Nuevo Ítem Comercial
                    </Button>
                )}
            </div>

            {isFormOpen ? (
                <div className="w-full">
                    <ProductoForm
                        initialData={productoToClone}
                        productoToEdit={productoToEdit} // 🚀 Pasamos el producto a editar
                        onSuccess={() => {
                            closeForm()
                            fetchProductos()
                        }}
                        onCancel={closeForm}
                    />
                </div>
            ) : (
                loading ? (
                    <div className="flex h-64 w-full items-center justify-center">
                        <Loader2 className="h-8 w-8 animate-spin text-indigo-600" />
                    </div>
                ) : (
                    <div className="space-y-4">
                        <DataTable
                            columns={getColumns(handleEdit, handleClone, handleDelete)}
                            data={data}
                        />
                        <div className="flex justify-end">
                            <span className="inline-flex items-center gap-1 rounded-md bg-indigo-50 px-2 py-1 text-xs font-medium text-indigo-700 ring-1 ring-inset ring-indigo-600/20">
                                <Sparkles className="h-3 w-3" /> pgvector Activo
                            </span>
                        </div>
                    </div>
                )
            )}
        </div>
    )
}