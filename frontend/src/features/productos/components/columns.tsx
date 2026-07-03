import type { ColumnDef } from "@tanstack/react-table"
import { MoreHorizontal, Edit, Copy, Trash2 } from "lucide-react"
import { Button } from "@/components/ui/button"
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

// Definimos la estructura del dato
export type ProductoRow = {
    id: string
    nombre: string
    codigo_sku: string
    activo: boolean
    costo_estandar: number
}

// Usamos tu mismo patrón Factory de Clientes
export const getColumns = (
    onEdit: (producto: ProductoRow) => void,
    onClone: (producto: ProductoRow) => void,
    onDelete: (producto: ProductoRow) => void
): ColumnDef<ProductoRow>[] => [
        {
            accessorKey: "codigo_sku",
            header: "SKU",
            cell: ({ row }) => <span className="font-medium text-zinc-900 text-sm">{row.original.codigo_sku}</span>,
        },
        {
            accessorKey: "nombre",
            header: "Nombre",
            cell: ({ row }) => <span className="text-zinc-700 text-sm">{row.original.nombre}</span>,
        },
        {
            accessorKey: "costo_estandar",
            header: "Costo",
            cell: ({ row }) => {
                const amount = parseFloat(row.getValue("costo_estandar") as string)
                return <div className="font-medium text-sm text-zinc-700">₡{amount.toFixed(2)}</div>
            },
        },
        {
            id: "actions",
            header: () => <div className="text-right">Acciones</div>,
            cell: ({ row }) => {
                const producto = row.original
                return (
                    <div className="flex justify-end">
                        <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                                <Button variant="ghost" className="h-8 w-8 p-0 text-zinc-500 hover:text-zinc-900">
                                    <span className="sr-only">Abrir menú</span>
                                    <MoreHorizontal className="h-4 w-4" />
                                </Button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent align="end" className="bg-white border-zinc-200 z-[100] min-w-[160px] rounded-xl shadow-lg p-1">
                                <DropdownMenuItem onClick={() => onEdit(producto)} className="text-sm cursor-pointer hover:bg-zinc-100 rounded-lg py-2">
                                    <Edit className="mr-2 h-4 w-4" /> Editar
                                </DropdownMenuItem>

                                {/* Tu nueva funcionalidad estrella */}
                                <DropdownMenuItem onClick={() => onClone(producto)} className="text-sm cursor-pointer hover:bg-zinc-100 rounded-lg py-2">
                                    <Copy className="mr-2 h-4 w-4" /> Clonar (Variante)
                                </DropdownMenuItem>

                                <DropdownMenuItem onClick={() => onDelete(producto)} className="text-sm cursor-pointer text-red-600 hover:bg-red-50 focus:bg-red-50 focus:text-red-700 rounded-lg py-2">
                                    <Trash2 className="mr-2 h-4 w-4" /> Descontinuar
                                </DropdownMenuItem>
                            </DropdownMenuContent>
                        </DropdownMenu>
                    </div>
                )
            },
        },
    ]