import { Link, useLocation } from 'react-router-dom'
import { LayoutDashboard, Users, Package, FileText, Settings, Sparkles, X, ChevronLeft, ChevronRight } from 'lucide-react'
import { cn } from '@/lib/utils'
import { Button } from '@/components/ui/button'

export interface SidebarProps {
    isOpen: boolean;
    onClose: () => void;
    isCollapsed: boolean;
    setIsCollapsed: (collapsed: boolean) => void;
}

const navItems = [
    { name: 'Dashboard', to: '/dashboard', icon: LayoutDashboard },
    { name: 'Clientes', to: '/clientes', icon: Users },
    { name: 'Productos', to: '/catalogo', icon: Package }, // Apuntando a tu ruta real en español
    { name: 'Proformas', to: '/quotes', icon: FileText },
    { name: 'Configuración', to: '/settings', icon: Settings },
]

export function Sidebar({ isOpen, onClose, isCollapsed, setIsCollapsed }: SidebarProps) {
    const location = useLocation();

    return (
        <>
            {/* OVERLAY PARA MÓVIL */}
            {isOpen && (
                <div
                    className="fixed inset-0 z-[100] bg-slate-950/20 backdrop-blur-sm lg:hidden"
                    onClick={onClose}
                />
            )}

            {/* SIDEBAR INTELIGENTE ACETERNITY */}
            <aside
                className={cn(
                    // MÓVIL: Flota de forma segura por encima de la app
                    "fixed inset-y-0 left-0 z-[100] flex flex-col border-r border-slate-200/50 bg-white/70 backdrop-blur-xl transition-all duration-300 ease-in-out",
                    isOpen ? "translate-x-0" : "-translate-x-full",

                    // ESCRITORIO: Se integra armónicamente al flujo Flexbox nativo de la página
                    "lg:relative lg:translate-x-0",

                    // ANCHO DINÁMICO: Cambia según el botón de colapso en pantallas grandes
                    isCollapsed ? "lg:w-20 px-3" : "lg:w-64 px-4",
                    "w-64 px-4 py-6" // Estilos base de espaciado
                )}
            >
                {/* CABECERA: Branding y controles de colapso */}
                <div className={cn("flex items-center mb-6 justify-between px-2", isCollapsed && "lg:justify-center lg:px-0")}>
                    <div className="flex items-center gap-2 shrink-0">
                        <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-indigo-600 text-white shadow-md shadow-indigo-600/20">
                            <Sparkles className="h-5 w-5" />
                        </div>
                        <span className={cn("text-lg font-bold tracking-tight text-slate-900 transition-opacity duration-200", isCollapsed && "lg:hidden")}>
                            SaaS B2B
                        </span>
                    </div>

                    {/* Botón cerrar móvil */}
                    <Button variant="ghost" size="icon" onClick={onClose} className="lg:hidden h-8 w-8 text-slate-500">
                        <X className="h-5 w-5" />
                    </Button>

                    {/* Botón Contraer Menú (Desktop) */}
                    {!isCollapsed && (
                        <Button
                            variant="ghost"
                            size="icon"
                            onClick={() => setIsCollapsed(true)}
                            className="hidden lg:flex h-8 w-8 text-slate-400 hover:text-slate-600 hover:bg-slate-100/50 rounded-md"
                        >
                            <ChevronLeft className="h-4 w-4" />
                        </Button>
                    )}
                </div>

                {/* Botón Expandir Menú (Solo visible si está contraído en Desktop) */}
                {isCollapsed && (
                    <div className="hidden lg:flex justify-center mb-4">
                        <Button
                            variant="ghost"
                            size="icon"
                            onClick={() => setIsCollapsed(false)}
                            className="h-8 w-8 text-slate-400 hover:text-slate-600 hover:bg-slate-100/50 rounded-md"
                        >
                            <ChevronRight className="h-4 w-4" />
                        </Button>
                    </div>
                )}

                {/* ENLACES DE NAVEGACIÓN COMPATIBLES */}
                <nav className="flex flex-col gap-1.5 flex-1">
                    {navItems.map((item) => {
                        const isActive = location.pathname.includes(item.to);

                        return (
                            <Link
                                key={item.name}
                                to={item.to}
                                onClick={() => {
                                    if (window.innerWidth < 1024) {
                                        onClose();
                                    }
                                }}
                                className={cn(
                                    "flex items-center rounded-lg text-sm font-semibold transition-all duration-200 group relative w-full",
                                    isCollapsed ? "lg:justify-center lg:p-2.5 px-3 py-2.5 gap-3 lg:gap-0" : "gap-3 px-3 py-2.5",
                                    isActive
                                        ? "bg-indigo-50 text-indigo-900 border border-indigo-100/40 shadow-sm"
                                        : "text-slate-600 hover:bg-slate-100/50 hover:text-slate-900"
                                )}
                            >
                                <item.icon className={cn(
                                    "h-5 w-5 transition-transform duration-200 group-hover:scale-105 shrink-0",
                                    isActive ? "text-indigo-600" : "text-slate-400 group-hover:text-slate-600"
                                )} />

                                <span className={cn("transition-opacity duration-200 truncate", isCollapsed && "lg:hidden")}>
                                    {item.name}
                                </span>

                                {/* TOOLTIP ESTILO ACETERNITY PARA EL MENÚ COLAPSADO */}
                                {isCollapsed && (
                                    <span className="absolute left-full ml-4 rounded-md px-2 py-1 text-xs font-medium bg-slate-900 text-white opacity-0 pointer-events-none group-hover:opacity-100 transition-opacity duration-150 z-50 shadow-md whitespace-nowrap hidden lg:block">
                                        {item.name}
                                    </span>
                                )}
                            </Link>
                        );
                    })}
                </nav>
            </aside>
        </>
    )
}