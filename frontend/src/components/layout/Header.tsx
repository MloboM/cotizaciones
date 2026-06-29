import { Menu, UserCircle } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Sheet, SheetContent, SheetTrigger } from '@/components/ui/sheet'
import { NavLink } from 'react-router-dom'
import { LayoutDashboard, Package, FileText, Settings, Sparkles } from 'lucide-react'

// ✅ IMPORTACIONES CORRECTAS Y LIMPIAS
import { useLogout } from '@/core/auth/useLogout'
import { useTenant } from '@/core/tenant/TenantProvider'
import { useCompany } from '@/core/tenant/CompanyProvider'

const navItems = [
    { name: 'Dashboard', to: '/dashboard', icon: LayoutDashboard },
    { name: 'Catálogo', to: '/catalog', icon: Package },
    { name: 'Cotizaciones', to: '/quotes', icon: FileText },
    { name: 'Configuración', to: '/settings', icon: Settings },
]

export function Header() {
    // ✅ CONSUMO DE NUESTROS NUEVOS HOOKS DE INFRAESTRUCTURA
    const { logout } = useLogout()
    const { activeRole } = useTenant()
    const company = useCompany()

    return (
        <header className="sticky top-0 z-30 flex h-16 items-center justify-between border-b bg-white px-4 shadow-sm md:px-6">

            {/* Menú Hamburguesa (Solo Móvil) */}
            <div className="flex items-center md:hidden">
                <Sheet>
                    <SheetTrigger asChild>
                        <Button variant="ghost" size="icon" className="md:hidden">
                            <Menu className="h-6 w-6" />
                            <span className="sr-only">Abrir menú</span>
                        </Button>
                    </SheetTrigger>
                    <SheetContent side="left" className="w-72 p-6">
                        <div className="flex items-center gap-2 mb-8">
                            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-zinc-900 text-white">
                                <Sparkles className="h-5 w-5" />
                            </div>
                            <span className="text-lg font-bold tracking-tight">SaaS B2B</span>
                        </div>
                        <nav className="flex flex-col gap-2">
                            {navItems.map((item) => (
                                <NavLink
                                    key={item.name}
                                    to={item.to}
                                    className={({ isActive }) =>
                                        `flex items-center gap-3 rounded-md px-3 py-3 text-base font-medium transition-colors ${isActive ? "bg-zinc-100 text-zinc-900" : "text-zinc-500"
                                        }`
                                    }
                                >
                                    <item.icon className="h-5 w-5" />
                                    {item.name}
                                </NavLink>
                            ))}
                        </nav>
                    </SheetContent>
                </Sheet>
            </div>

            {/* Info del Tenant y Perfil (Alineado a la derecha con separación estricta de SOLID) */}
            <div className="flex flex-1 items-center justify-end gap-4">
                <div className="hidden flex-col items-end md:flex mr-2">
                    {/* ✅ Traído de forma segura desde CompanyProvider */}
                    <span className="text-sm font-bold text-zinc-900 leading-none">
                        {company.nombre_comercial}
                    </span>
                    {/* ✅ Traído de forma segura desde TenantProvider */}
                    <span className="text-[11px] font-semibold text-emerald-600 uppercase tracking-wider mt-1">
                        Rol: {activeRole || 'Usuario'}
                    </span>
                </div>

                {/* ✅ Botón conectado a la súper-esterilización de sesiones offline/online */}
                <Button
                    variant="ghost"
                    size="sm"
                    onClick={logout}
                    className="gap-2 text-zinc-600 hover:text-red-600 hover:bg-red-50 transition-colors"
                >
                    <UserCircle className="h-5 w-5" />
                    <span className="hidden sm:inline-block">Cerrar Sesión</span>
                </Button>
            </div>
        </header>
    )
}