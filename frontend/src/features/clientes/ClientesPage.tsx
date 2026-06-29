import { useEffect, useState } from 'react'
import { Plus, ArrowLeft } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { supabase } from '@/services/supabase/client'
import { ClienteForm } from './ClienteForm'
import { DataTable } from './components/data-table'
import { getColumns, type ClienteRow } from './components/columns'

export function ClientesPage() {
    const [isCreating, setIsCreating] = useState(false)
    const [editingCliente, setEditingCliente] = useState<ClienteRow | null>(null)
    const [clientes, setClientes] = useState<ClienteRow[]>([])
    const [isLoading, setIsLoading] = useState(true)

    // Función para descargar los clientes de Supabase (con las columnas reales)
    const fetchClientes = async () => {
        setIsLoading(true)
        try {
            const { data, error } = await supabase
                .from('clientes')
                .select(`
                  *,
                  contactos_cliente (id, nombre_completo, email) 
                `)
                .order('created_at', { ascending: false })

            if (error) throw error
            setClientes((data as any) || [])
        } catch (error) {
            console.error("Error cargando clientes:", error)
        } finally {
            setIsLoading(false)
        }
    }

    useEffect(() => {
        fetchClientes()
    }, [])

    // Handler para activar la edición
    const handleEdit = (cliente: ClienteRow) => {
        setEditingCliente(cliente)
    }

    // Handler para el Soft Delete (Borrado Lógico / Desactivación comercial)
    const handleDelete = async (cliente: ClienteRow) => {
        const confirmar = window.confirm(`¿Estás seguro de que deseas marcar como Inactivo a ${cliente.razon_social}?`)
        if (!confirmar) return

        try {
            // Pasamos el estado_comercial a 'inactivo' para no romper la integridad del ERP
            const { error } = await supabase
                .from('clientes')
                .update({ estado_comercial: 'inactivo' })
                .eq('id', cliente.id)

            if (error) throw error

            alert("Cliente desactivado correctamente.")
            fetchClientes() // Refrescamos la tabla instantáneamente
        } catch (error: any) {
            console.error("❌ Error al eliminar cliente:", error)
            alert(`No se pudo desactivar el cliente: ${error.message}`)
        }
    }

    // Inicializamos las columnas inyectando los eventos del componente padre
    const columns = getColumns(handleEdit, handleDelete)

    // Si el usuario está creando o editando, mostramos la interfaz del formulario
    if (isCreating || editingCliente) {
        return (
            <div className="p-6 max-w-5xl mx-auto space-y-6">
                <div className="flex items-center gap-3">
                    <Button
                        variant="ghost"
                        size="icon"
                        onClick={() => {
                            setIsCreating(false)
                            setEditingCliente(null)
                        }}
                        className="h-9 w-9 text-zinc-500 hover:text-zinc-900 border border-zinc-200 bg-white shadow-sm rounded-lg"
                    >
                        <ArrowLeft className="h-4 w-4" />
                    </Button>
                    <div>
                        <h1 className="text-xl font-semibold text-zinc-900">
                            {isCreating ? "Nuevo Cliente" : `Editar: ${editingCliente?.razon_social}`}
                        </h1>
                        <p className="text-xs text-zinc-500">
                            {isCreating ? "Registrar un nuevo cliente en el sistema maestro." : "Modificar los datos comerciales y de contacto."}
                        </p>
                    </div>
                </div>


                <ClienteForm
                    clienteToEdit={editingCliente} // Le pasamos el cliente a editar (puede ser null)
                    onSuccess={() => {
                        setIsCreating(false)
                        setEditingCliente(null)
                        fetchClientes()
                    }}
                    onCancel={() => {
                        setIsCreating(false)
                        setEditingCliente(null)
                    }}
                />
            </div>
        )
    }

    return (
        <div className="p-6 max-w-7xl mx-auto space-y-6">
            {/* Encabezado del Módulo */}
            <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-zinc-200 pb-5">
                <div>
                    <h1 className="text-2xl font-bold tracking-tight text-zinc-900">Directorio de Clientes</h1>
                    <p className="text-sm text-zinc-500 mt-1">Gestiona las cuentas comerciales, CRM y términos de crédito de tu SaaS.</p>
                </div>
                <Button
                    onClick={() => setIsCreating(true)}
                    className="bg-zinc-900 hover:bg-zinc-800 text-white rounded-lg px-4 h-9 text-sm font-medium shadow-sm transition-colors self-start sm:self-auto"
                >
                    <Plus className="mr-2 h-4 w-4" /> Nuevo Cliente
                </Button>
            </div>

            {/* Renderizado del Motor TanStack Table */}
            {isLoading ? (
                <div className="h-64 flex flex-col items-center justify-center space-y-2 border border-zinc-200 bg-white rounded-xl shadow-sm">
                    <div className="animate-spin rounded-full h-6 w-6 border-2 border-emerald-600 border-t-transparent" />
                    <span className="text-sm text-zinc-500">Sincronizando con Supabase...</span>
                </div>
            ) : (
                <DataTable columns={columns} data={clientes} />
            )}
        </div>
    )
}