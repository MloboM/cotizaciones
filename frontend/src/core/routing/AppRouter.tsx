import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom'
import { AuthProvider } from '../auth/AuthProvider'
import { TenantProvider } from '../tenant/TenantProvider'
import { RBACGuard } from '../permissions/RBACGuard'
import { AppLayout } from '@/components/layout/AppLayout'
import { LoginPage } from '@/features/auth/LoginPage'
import { ClientesPage } from '@/features/clientes/ClientesPage' // <-- ¡Nuestra primera página real!

// Mocks temporales (Páginas de relleno mientras las construimos)
const MockDashboard = () => (
    <div className="rounded-xl border bg-white p-8 shadow-sm">
        <h1 className="text-2xl font-bold text-zinc-900">Dashboard Principal</h1>
        <p className="mt-2 text-zinc-500">Bienvenido a tu entorno de trabajo.</p>
    </div>
)
const MockProductos = () => (
    <div className="rounded-xl border bg-white p-8 shadow-sm">
        <h1 className="text-2xl font-bold text-zinc-900">Catálogo de Productos</h1>
        <p className="mt-2 text-zinc-500">Aquí integraremos nuestro inventario y TanStack Table.</p>
    </div>
)

export function AppRouter() {
    return (
        <BrowserRouter>
            <AuthProvider>
                <TenantProvider>
                    <Routes>
                        {/* 1. RUTAS PÚBLICAS */}
                        <Route path="/login" element={<LoginPage />} />

                        {/* 2. RUTAS PROTEGIDAS (Requieren Login) */}
                        {/* El Layout envuelve a TODAS estas rutas. El <Outlet /> mostrará el contenido */}
                        <Route element={<RBACGuard allowedRoles={['admin', 'vendedor']}><AppLayout /></RBACGuard>}>
                            {/* Redirección por defecto si entran a la raíz */}
                            <Route path="/" element={<Navigate to="/dashboard" replace />} />

                            {/* Páginas del SaaS */}
                            <Route path="/dashboard" element={<MockDashboard />} />
                            <Route path="/clientes" element={<ClientesPage />} /> {/* <-- Nuestra página real */}
                            <Route path="/productos" element={<MockProductos />} />
                            <Route path="/cotizaciones" element={<div className="p-8 font-bold">Módulo de Cotizaciones (Próximamente)</div>} />
                            <Route path="/facturacion" element={<div className="p-8 font-bold">Módulo de Facturación (Próximamente)</div>} />
                            <Route path="/reportes" element={<div className="p-8 font-bold">Módulo de Reportes (Próximamente)</div>} />
                            <Route path="/configuracion" element={<div className="p-8 font-bold">Ajustes de la Empresa</div>} />
                        </Route>

                        {/* 3. RUTAS DE ERROR */}
                        <Route path="/unauthorized" element={
                            <div className="flex h-screen items-center justify-center text-red-500 font-bold">
                                Acceso Denegado
                            </div>
                        } />
                        <Route path="*" element={<Navigate to="/dashboard" replace />} />
                    </Routes>
                </TenantProvider>
            </AuthProvider>
        </BrowserRouter>
    )
}