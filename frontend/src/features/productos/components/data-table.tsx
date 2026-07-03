"use client"

import * as React from "react"
import {
    flexRender,
    getCoreRowModel,
    getPaginationRowModel,
    getSortedRowModel,
    getFilteredRowModel,
    useReactTable,
} from "@tanstack/react-table"

import type {
    ColumnDef,
    SortingState,
    ColumnFiltersState,
    FilterFn, // Importación vital para nuestro motor
} from "@tanstack/react-table"

import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"

interface DataTableProps<TData, TValue> {
    columns: ColumnDef<TData, TValue>[]
    data: TData[]
}

// =====================================================================
// MOTOR DE BÚSQUEDA OMNIBOX (Multicampo + Deep Search en Proveedores)
// =====================================================================
const globalFilterMulticampo: FilterFn<any> = (row, _columnId, filterValue) => {
    const search = String(filterValue).toLowerCase();

    // Extraemos la información cruda de la fila
    const data = row.original;

    const nombre = String(data.nombre || "").toLowerCase();
    const sku = String(data.codigo_sku || data.sku || "").toLowerCase();
    const fabricante = String(data.codigo_fabricante || "").toLowerCase();
    const barras = String(data.codigo_barras || "").toLowerCase();

    // Buscamos profundamente dentro del arreglo de proveedores
    const coincidenciaProveedor = Array.isArray(data.proveedores)
        ? data.proveedores.some((prov: any) =>
            String(prov.codigo_proveedor || prov.codigo || "").toLowerCase().includes(search)
        )
        : false;

    // Retorna true si el texto coincide con CUALQUIERA de estos campos
    return (
        nombre.includes(search) ||
        sku.includes(search) ||
        fabricante.includes(search) ||
        barras.includes(search) ||
        coincidenciaProveedor
    );
};

export function DataTable<TData, TValue>({
    columns,
    data,
}: DataTableProps<TData, TValue>) {
    const [sorting, setSorting] = React.useState<SortingState>([])
    const [columnFilters, setColumnFilters] = React.useState<ColumnFiltersState>([])
    const [rowSelection, setRowSelection] = React.useState({})

    // Estado para controlar el buscador global
    const [globalFilter, setGlobalFilter] = React.useState("")

    const table = useReactTable({
        data,
        columns,
        getCoreRowModel: getCoreRowModel(),
        getPaginationRowModel: getPaginationRowModel(),
        onSortingChange: setSorting,
        getSortedRowModel: getSortedRowModel(),
        onColumnFiltersChange: setColumnFilters,
        getFilteredRowModel: getFilteredRowModel(),
        onRowSelectionChange: setRowSelection,

        // Conectamos nuestro motor Omnibox a la tabla
        onGlobalFilterChange: setGlobalFilter,
        globalFilterFn: globalFilterMulticampo,

        state: {
            sorting,
            columnFilters,
            rowSelection,
            globalFilter,
        },
    })

    return (
        <div>
            <div className="flex items-center py-4">
                {/* Input conectado al estado globalFilter */}
                <Input
                    placeholder="Buscar por nombre, SKU, códigos o proveedor..."
                    value={globalFilter ?? ""}
                    onChange={(event) => setGlobalFilter(String(event.target.value))}
                    className="max-w-sm"
                />
            </div>
            <div className="rounded-md border">
                <Table>
                    <TableHeader>
                        {table.getHeaderGroups().map((headerGroup) => (
                            <TableRow key={headerGroup.id}>
                                {headerGroup.headers.map((header) => {
                                    return (
                                        <TableHead key={header.id}>
                                            {header.isPlaceholder
                                                ? null
                                                : flexRender(
                                                    header.column.columnDef.header,
                                                    header.getContext()
                                                )}
                                        </TableHead>
                                    )
                                })}
                            </TableRow>
                        ))}
                    </TableHeader>
                    <TableBody>
                        {table.getRowModel().rows?.length ? (
                            table.getRowModel().rows.map((row) => (
                                <TableRow
                                    key={row.id}
                                    data-state={row.getIsSelected() && "selected"}
                                >
                                    {row.getVisibleCells().map((cell) => (
                                        <TableCell key={cell.id}>
                                            {flexRender(cell.column.columnDef.cell, cell.getContext())}
                                        </TableCell>
                                    ))}
                                </TableRow>
                            ))
                        ) : (
                            <TableRow>
                                <TableCell colSpan={columns.length} className="h-24 text-center">
                                    No se encontraron resultados.
                                </TableCell>
                            </TableRow>
                        )}
                    </TableBody>
                </Table>
            </div>
            <div className="flex items-center justify-end space-x-2 py-4">
                <Button
                    variant="outline"
                    size="sm"
                    onClick={() => table.previousPage()}
                    disabled={!table.getCanPreviousPage()}
                >
                    Anterior
                </Button>
                <Button
                    variant="outline"
                    size="sm"
                    onClick={() => table.nextPage()}
                    disabled={!table.getCanNextPage()}
                >
                    Siguiente
                </Button>
            </div>
        </div>
    )
}