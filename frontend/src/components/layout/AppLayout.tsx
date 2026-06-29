import { useState } from 'react'
import { Link, Outlet, useLocation } from 'react-router-dom' // Quitamos useNavigate
import { LayoutDashboard, Users, Box, FileText, Settings, PanelLeftClose, PanelLeftOpen, LogOut, MoreHorizontal, Receipt, BarChart3 } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"

// IMPORTAMOS NUESTRO NUEVO HOOK
import { useLogout } from '@/core/auth/useLogout'

export function AppLayout() {
    const [isCollapsed, setIsCollapsed] = useState(false)
    const location = useLocation()

    // USAMOS EL HOOK (Reemplaza al useNavigate y al handleLogout viejo)
    const { logout } = useLogout()

    // NAVEGACIÓN ESCRITORIO
    const DesktopNavItem = ({ to, icon, label }: { to: string, icon: React.ReactNode, label: string }) => {
        const isActive = location.pathname.includes(to)
        return (
            <Link
                to={to}
                className={`flex items-center gap-3 px-3 py-2 rounded-md transition-all duration-200 ${isActive
                    ? 'bg-zinc-800/80 text-zinc-100 font-medium shadow-sm'
                    : 'text-zinc-400 hover:bg-zinc-800/50 hover:text-zinc-200'
                    } ${isCollapsed ? 'justify-center' : 'justify-start'}`}
                title={isCollapsed ? label : undefined}
            >
                {icon}
                {!isCollapsed && <span className="text-sm">{label}</span>}
            </Link>
        )
    }

    // NAVEGACIÓN MÓVIL
    const MobileNavItem = ({ to, icon, label }: { to: string, icon: React.ReactNode, label: string }) => {
        const isActive = location.pathname.includes(to)
        return (
            <Link
                to={to}
                className={`flex flex-col items-center justify-center w-full h-full space-y-1 transition-colors ${isActive ? 'text-emerald-500' : 'text-zinc-500 hover:text-zinc-300'
                    }`}
            >
                {icon}
                <span className="text-[10px] font-medium">{label}</span>
            </Link>
        )
    }

    return (
        <div className="flex h-screen bg-[#f8f9fa] overflow-hidden font-sans">

            {/* SIDEBAR DE ESCRITORIO */}
            <aside className={`hidden md:flex flex-col bg-[#1c1c1c] text-zinc-300 transition-all duration-300 ease-in-out flex-shrink-0 z-50 border-r border-zinc-800 ${isCollapsed ? 'w-[72px]' : 'w-64'}`}>
                <div className="h-14 flex items-center justify-between px-4 border-b border-zinc-800/80">
                    {!isCollapsed && (
                        <div className="flex items-center gap-2 overflow-hidden whitespace-nowrap">
                            <div className="h-7 w-7 rounded bg-emerald-600 flex items-center justify-center text-white font-bold text-sm">
                                E
                            </div>
                            <span className="font-semibold text-zinc-100 text-base tracking-tight">ERP SaaS</span>
                        </div>
                    )}
                    <Button variant="ghost" size="icon" onClick={() => setIsCollapsed(!isCollapsed)} className="h-8 w-8 text-zinc-400 hover:text-white hover:bg-zinc-800 rounded-md">
                        {isCollapsed ? <PanelLeftOpen className="h-4 w-4" /> : <PanelLeftClose className="h-4 w-4" />}
                    </Button>
                </div>

                <nav className="flex-1 overflow-y-auto py-4 px-3 space-y-0.5">
                    <DesktopNavItem to="/dashboard" icon={<LayoutDashboard className="h-[18px] w-[18px]" />} label="Dashboard" />
                    <DesktopNavItem to="/clientes" icon={<Users className="h-[18px] w-[18px]" />} label="Clientes B2B" />
                    <DesktopNavItem to="/catalogo" icon={<Box className="h-[18px] w-[18px]" />} label="Catálogo" />
                    <DesktopNavItem to="/cotizaciones" icon={<FileText className="h-[18px] w-[18px]" />} label="Cotizaciones" />
                </nav>

                <div className="p-3 border-t border-zinc-800/80 space-y-0.5">
                    <DesktopNavItem to="/configuracion" icon={<Settings className="h-[18px] w-[18px]" />} label="Configuración" />
                    {/* BOTÓN CERRAR SESIÓN */}
                    <button
                        type="button"
                        onClick={logout}
                        className={`w-full flex items-center gap-3 px-3 py-2 rounded-md text-zinc-400 hover:bg-red-500/10 hover:text-red-400 transition-all ${isCollapsed ? 'justify-center' : 'justify-start'}`}
                    >
                        <LogOut className="h-[18px] w-[18px]" />
                        {!isCollapsed && <span className="text-sm">Cerrar Sesión</span>}
                    </button>
                </div>
            </aside>

            {/* ÁREA DE TRABAJO */}
            <main className="flex-1 overflow-y-auto bg-[#f8f9fa] relative h-[calc(100vh-4rem)] md:h-screen">
                <div className="p-4 sm:p-6 lg:p-8 max-w-[1400px] mx-auto w-full">
                    <Outlet />
                </div>
            </main>

            {/* BARRA INFERIOR MÓVIL */}
            <nav className="md:hidden fixed bottom-0 left-0 right-0 h-16 bg-[#1c1c1c] border-t border-zinc-800 flex items-center justify-around px-1 z-[100] safe-area-pb">
                <MobileNavItem to="/dashboard" icon={<LayoutDashboard className="h-5 w-5" />} label="Inicio" />
                <MobileNavItem to="/clientes" icon={<Users className="h-5 w-5" />} label="Clientes" />
                <MobileNavItem to="/productos" icon={<Box className="h-5 w-5" />} label="Catálogo" />
                <MobileNavItem to="/cotizaciones" icon={<FileText className="h-5 w-5" />} label="Cots." />

                <DropdownMenu>
                    <DropdownMenuTrigger asChild>
                        <button className="flex flex-col items-center justify-center w-full h-full space-y-1 text-zinc-500 hover:text-zinc-300 focus:outline-none">
                            <MoreHorizontal className="h-5 w-5" />
                            <span className="text-[10px] font-medium">Más</span>
                        </button>
                    </DropdownMenuTrigger>
                    <DropdownMenuContent side="top" align="end" className="w-48 bg-[#1c1c1c] border border-zinc-800 text-zinc-300 z-[110] mb-2 shadow-xl p-1 rounded-xl">
                        <DropdownMenuItem className="focus:bg-zinc-800 focus:text-white rounded-lg py-2.5 cursor-pointer">
                            <Link to="/facturacion" className="flex items-center w-full"><Receipt className="h-4 w-4 mr-2.5" /> Facturación</Link>
                        </DropdownMenuItem>
                        <DropdownMenuItem className="focus:bg-zinc-800 focus:text-white rounded-lg py-2.5 cursor-pointer">
                            <Link to="/reportes" className="flex items-center w-full"><BarChart3 className="h-4 w-4 mr-2.5" /> Reportes</Link>
                        </DropdownMenuItem>
                        <DropdownMenuItem className="focus:bg-zinc-800 focus:text-white rounded-lg py-2.5 cursor-pointer">
                            <Link to="/configuracion" className="flex items-center w-full"><Settings className="h-4 w-4 mr-2.5" /> Configuración</Link>
                        </DropdownMenuItem>
                        {/* CERRAR SESIÓN MÓVIL */}
                        <DropdownMenuItem onClick={logout} className="focus:bg-red-500/20 focus:text-red-400 text-red-400 rounded-lg py-2.5 cursor-pointer">
                            <LogOut className="h-4 w-4 mr-2.5" /> Cerrar Sesión
                        </DropdownMenuItem>
                    </DropdownMenuContent>
                </DropdownMenu>
            </nav>

        </div>
    )
}