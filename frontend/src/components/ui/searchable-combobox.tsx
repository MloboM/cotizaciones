import * as React from "react"
import { Check, ChevronsUpDown } from "lucide-react"
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import {
    Command,
    CommandEmpty,
    CommandGroup,
    CommandInput,
    CommandItem,
    CommandList,
} from "@/components/ui/command"
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"

export interface SearchableComboboxProps {
    options: { label: string; value: string }[]
    value?: string
    onChange: (value: string) => void
    placeholder?: string
    emptyText?: string
}

export function SearchableCombobox({
    options = [],
    value,
    onChange,
    placeholder = "Seleccionar...",
    emptyText = "No se encontraron resultados.",
}: SearchableComboboxProps) {
    const [open, setOpen] = React.useState(false)

    const selectedLabel = React.useMemo(() => {
        if (!value) return ""
        const selectedOption = options.find((opt) => opt.value === value)
        return selectedOption ? selectedOption.label : value
    }, [value, options])

    return (
        <Popover open={open} onOpenChange={setOpen}>
            <PopoverTrigger asChild>
                <Button
                    variant="outline"
                    role="combobox"
                    aria-expanded={open}
                    className={cn(
                        "w-full justify-between bg-white text-sm font-normal border-zinc-300 hover:bg-zinc-50",
                        !value && "text-zinc-500"
                    )}
                >
                    <span className="truncate">{value ? selectedLabel : placeholder}</span>
                    <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
                </Button>
            </PopoverTrigger>

            {/* 🚀 AQUÍ ESTÁ LA MAGIA: bg-white sólido, z-[100] para que flote encima, y sombra */}
            <PopoverContent
                className="w-[--radix-popover-trigger-width] p-0 bg-white z-[100] shadow-lg border border-zinc-200 rounded-md overflow-hidden"
                align="start"
            >
                <Command className="bg-white w-full">
                    <CommandInput placeholder={placeholder} className="h-9 text-sm" />
                    <CommandList className="bg-white">
                        <CommandEmpty className="py-6 text-center text-sm text-zinc-500 bg-white">{emptyText}</CommandEmpty>
                        <CommandGroup className="bg-white">
                            {options.map((option) => (
                                <CommandItem
                                    key={option.value}
                                    value={option.label}
                                    onSelect={() => {
                                        onChange(option.value === value ? "" : option.value)
                                        setOpen(false)
                                    }}
                                    className="text-sm cursor-pointer hover:bg-zinc-100 data-[selected=true]:bg-zinc-100"
                                >
                                    <Check
                                        className={cn(
                                            "mr-2 h-4 w-4 text-indigo-600",
                                            value === option.value ? "opacity-100" : "opacity-0"
                                        )}
                                    />
                                    {option.label}
                                </CommandItem>
                            ))}
                        </CommandGroup>
                    </CommandList>
                </Command>
            </PopoverContent>
        </Popover>
    )
}