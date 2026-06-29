import type { ColumnDef } from "@tanstack/react-table"
import { MoreHorizontal, Edit, Trash2 } from "lucide-react"
import { Button } from "@/components/ui/button"
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

// Definimos la "forma" de tu dato tal cual viene de Supabase
export type ClienteRow = {
    id: string
    numero_identificacion: string
    razon_social: string
    condicion_pago: string
    contactos_cliente: { nombre_completo: string; email: string }[]
}

// Usamos una función constructora (Factory) para poder inyectarle las acciones desde afuera
export const getColumns = (
    onEdit: (cliente: ClienteRow) => void,
    onDelete: (cliente: ClienteRow) => void
): ColumnDef<ClienteRow>[] => [
        {
            accessorKey: "numero_identificacion",
            header: "Identificación",
            cell: ({ row }) => <span className="font-medium text-zinc-900 text-sm">{row.original.numero_identificacion}</span>,
        },
        {
            accessorKey: "razon_social",
            header: "Razón Social",
            cell: ({ row }) => <span className="text-zinc-700 text-sm">{row.original.razon_social}</span>,
        },
        {
            id: "contacto",
            header: "Contacto Principal",
            cell: ({ row }) => {
                const contacto = row.original.contactos_cliente?.[0]
                if (!contacto) return <span className="text-zinc-400 italic text-sm">Sin contacto</span>

                return (
                    <div className="text-sm">
                        <div className="font-medium text-zinc-900">{contacto.nombre_completo}</div>
                        <div className="text-zinc-500 text-xs">{contacto.email}</div>
                    </div>
                )
            },
        },
        {
            accessorKey: "condicion_pago",
            header: "Condición",
            cell: ({ row }) => {
                const isCredito = row.original.condicion_pago === 'credito'
                return (
                    <span className={`inline-flex items-center px-2 py-1 rounded-md text-xs font-medium ${isCredito ? 'bg-blue-50 text-blue-700 ring-1 ring-inset ring-blue-700/10' : 'bg-emerald-50 text-emerald-700 ring-1 ring-inset ring-emerald-600/10'
                        }`}>
                        {isCredito ? 'Crédito' : 'Contado'}
                    </span>
                )
            },
        },
        {
            id: "acciones",
            header: () => <div className="text-right">Acciones</div>,
            cell: ({ row }) => {
                const cliente = row.original

                return (
                    <div className="text-right">
                        <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                                <Button variant="ghost" className="h-8 w-8 p-0 text-zinc-500 hover:text-zinc-900">
                                    <span className="sr-only">Abrir menú</span>
                                    <MoreHorizontal className="h-4 w-4" />
                                </Button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent align="end" className="bg-white border-zinc-200 z-[100] min-w-[160px] rounded-xl shadow-lg p-1">
                                <DropdownMenuItem
                                    onClick={() => onEdit(cliente)}
                                    className="text-sm cursor-pointer hover:bg-zinc-100 rounded-lg py-2 focus:bg-zinc-100 focus:text-zinc-900"
                                >
                                    <Edit className="mr-2 h-4 w-4" /> Editar
                                </DropdownMenuItem>
                                <DropdownMenuItem
                                    onClick={() => onDelete(cliente)}
                                    className="text-sm cursor-pointer text-red-600 hover:bg-red-50 focus:bg-red-50 focus:text-red-700 rounded-lg py-2"
                                >
                                    <Trash2 className="mr-2 h-4 w-4" /> Eliminar (Soft)
                                </DropdownMenuItem>
                            </DropdownMenuContent>
                        </DropdownMenu>
                    </div>
                )
            },
        },
    ]