"use client"

import { Menu, Bell, Search, LogOut, User } from "lucide-react"
import { Button } from "@/components/ui/button"
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

// 🚀 RE-CONECTAMOS TU CÓDIGO ORIGINAL
import { useLogout } from '@/core/auth/useLogout'

interface HeaderProps {
    onMenuToggle?: () => void
}

export default function Header({ onMenuToggle }: HeaderProps) {
    const { logout } = useLogout()

    return (
        <header className="sticky top-0 z-50 w-full border-b border-slate-200/40 bg-white/70 backdrop-blur-md transition-all dark:border-slate-800/40 dark:bg-slate-950/70 supports-[backdrop-filter]:bg-white/70">
            <div className="w-full flex h-16 items-center justify-between px-4 sm:px-6 lg:px-8">

                {/* LADO IZQUIERDO: Hambuguesa y Branding */}
                <div className="flex items-center gap-4">
                    <Button
                        variant="ghost"
                        size="icon"
                        className="lg:hidden text-slate-600 hover:bg-slate-100/50"
                        onClick={onMenuToggle}
                    >
                        <Menu className="h-5 w-5" />
                        <span className="sr-only">Abrir menú</span>
                    </Button>

                    <div className="flex items-center gap-2">
                        <div className="h-8 w-8 rounded-lg bg-indigo-600 flex items-center justify-center shadow-md shadow-indigo-600/20">
                            <span className="text-white font-black text-base">P</span>
                        </div>
                        <span className="text-base font-black tracking-tight text-slate-900 dark:text-white">
                            Proforma<span className="text-indigo-600 font-medium">Express</span>
                        </span>
                    </div>
                </div>

                {/* CENTRO: Vacío para diseño B2B */}
                <div className="hidden lg:flex flex-1 max-w-md mx-8"></div>

                {/* LADO DERECHO: Herramientas y Usuario */}
                <div className="flex items-center gap-2">
                    <Button variant="ghost" size="icon" className="text-slate-500 hover:bg-slate-100/50">
                        <Search className="h-4 w-4" />
                    </Button>

                    <Button variant="ghost" size="icon" className="text-slate-500 hover:bg-slate-100/50 relative">
                        <Bell className="h-4 w-4" />
                        <span className="absolute top-2 right-2 h-2 w-2 rounded-full bg-rose-500 border border-white"></span>
                    </Button>

                    <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                            <Button variant="ghost" className="relative h-8 w-8 rounded-full ml-2 overflow-hidden border border-slate-200/60 hover:scale-105 transition-transform">
                                <img
                                    src="https://ui.shadcn.com/avatars/01.png"
                                    alt="Avatar"
                                    className="h-full w-full object-cover"
                                />
                            </Button>
                        </DropdownMenuTrigger>
                        <DropdownMenuContent className="w-56 mt-2 bg-white/90 backdrop-blur-md border-slate-200/60" align="end" forceMount>
                            <DropdownMenuLabel className="font-normal">
                                <div className="flex flex-col space-y-1">
                                    <p className="text-sm font-bold text-slate-800">Administrador</p>
                                    <p className="text-xs text-slate-400 truncate">admin@proformaexpress.com</p>
                                </div>
                            </DropdownMenuLabel>
                            <DropdownMenuSeparator className="bg-slate-100" />
                            <DropdownMenuItem className="text-slate-600 focus:bg-slate-50 cursor-pointer">
                                <User className="mr-2 h-4 w-4" />
                                <span>Mi Perfil</span>
                            </DropdownMenuItem>
                            <DropdownMenuSeparator className="bg-slate-100" />

                            {/* 🚀 EL BOTÓN VUELVE A LA VIDA */}
                            <DropdownMenuItem
                                onClick={logout}
                                className="text-rose-600 focus:bg-rose-50 focus:text-rose-700 cursor-pointer font-medium"
                            >
                                <LogOut className="mr-2 h-4 w-4" />
                                <span>Cerrar Sesión</span>
                            </DropdownMenuItem>

                        </DropdownMenuContent>
                    </DropdownMenu>
                </div>

            </div>
        </header>
    )
}