import { NavLink } from 'react-router-dom'
import { LayoutDashboard, Package, FileText, Settings, Sparkles } from 'lucide-react'
import { cn } from '@/lib/utils'

const navItems = [
    { name: 'Dashboard', to: '/dashboard', icon: LayoutDashboard },
    { name: 'Catálogo', to: '/catalog', icon: Package },
    { name: 'Cotizaciones', to: '/quotes', icon: FileText },
    { name: 'Configuración', to: '/settings', icon: Settings },
]

export function Sidebar() {
    return (
        <aside className="hidden md:flex w-64 flex-col border-r bg-white px-4 py-6">
            {/* Logo y Branding */}
            <div className="flex items-center gap-2 px-2 mb-8">
                <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-zinc-900 text-white">
                    <Sparkles className="h-5 w-5" />
                </div>
                <span className="text-lg font-bold tracking-tight">SaaS B2B</span>
            </div>

            {/* Navegación Principal */}
            <nav className="flex flex-col gap-1">
                {navItems.map((item) => (
                    <NavLink
                        key={item.name}
                        to={item.to}
                        className={({ isActive }) =>
                            cn(
                                "flex items-center gap-3 rounded-md px-3 py-2.5 text-sm font-medium transition-colors",
                                isActive
                                    ? "bg-zinc-100 text-zinc-900"
                                    : "text-zinc-500 hover:bg-zinc-50 hover:text-zinc-900"
                            )
                        }
                    >
                        <item.icon className="h-5 w-5" />
                        {item.name}
                    </NavLink>
                ))}
            </nav>
        </aside>
    )
}