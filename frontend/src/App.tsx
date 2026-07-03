import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

// Componentes Core de Autenticación y Tenant
import { AuthProvider } from '@/core/auth/AuthProvider'
import { AuthGate } from '@/core/auth/AuthGate'
import { TenantProvider } from '@/core/tenant/TenantProvider'
import { CompanyProvider } from '@/core/tenant/CompanyProvider'

// Layout y Vistas
import { AppLayout } from '@/components/layout/AppLayout'
import { LoginPage } from '@/features/auth/LoginPage'
import { ClientesPage } from '@/features/clientes/ClientesPage'
import { ProductosPage } from '@/features/productos/ProductosPage' // 🟢 Importación Real

// Instancia de QueryClient colocada fuera del componente
const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60 * 5,
      retry: 1,
      refetchOnWindowFocus: false,
    },
  },
})

// =====================================================================
// COMPONENTES TEMPORALES (Pendientes de construir)
// =====================================================================

function TempDashboard() {
  return (
    <div className="bg-white p-8 rounded-2xl shadow-sm border border-zinc-200 max-w-md mx-auto mt-10">
      <h1 className="text-2xl font-bold text-zinc-900 tracking-tight">¡Bienvenido al ERP!</h1>
      <p className="text-zinc-500 mt-2 text-sm">
        Fase 2 completada exitosamente. El entorno Multi-Tenant está estable.
      </p>
    </div>
  )
}

function TempCotizaciones() {
  return (
    <div className="bg-white p-8 rounded-2xl shadow-sm border border-zinc-200 max-w-md mx-auto mt-10">
      <h1 className="text-2xl font-bold text-zinc-900 tracking-tight">Módulo de Cotizaciones</h1>
      <p className="text-zinc-500 mt-2 text-sm">
        Aquí construiremos el Cotizador ultra rápido con IA en la Fase 3.
      </p>
    </div>
  )
}

function TempConfiguracion() {
  return (
    <div className="bg-white p-8 rounded-2xl shadow-sm border border-zinc-200 max-w-md mx-auto mt-10">
      <h1 className="text-2xl font-bold text-zinc-900 tracking-tight">Configuración</h1>
      <p className="text-zinc-500 mt-2 text-sm">
        Ajustes avanzados de la empresa, moneda base e impuestos locales.
      </p>
    </div>
  )
}

// =====================================================================
// ENRUTADOR MAESTRO
// =====================================================================

export default function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <AuthProvider>
        <BrowserRouter basename="/cotizaciones">
          <Routes>
            {/* RUTA PÚBLICA */}
            <Route path="/login" element={<LoginPage />} />

            {/* RUTAS PRIVADAS (Estructura Multi-Tenant con RLS Protegido) */}
            <Route
              element={
                <AuthGate>
                  <TenantProvider>
                    <CompanyProvider>
                      <AppLayout />
                    </CompanyProvider>
                  </TenantProvider>
                </AuthGate>
              }
            >
              <Route path="/dashboard" element={<TempDashboard />} />
              <Route path="/clientes" element={<ClientesPage />} />

              {/* 🟢 Ruta del Catálogo ahora apuntando a su Página Real */}
              <Route path="/catalogo" element={<ProductosPage />} />

              <Route path="/cotizaciones" element={<TempCotizaciones />} />
              <Route path="/configuracion" element={<TempConfiguracion />} />

              {/* Redirección por defecto si entra a la raíz */}
              <Route path="/" element={<Navigate to="/dashboard" replace />} />
            </Route>

            {/* Shield anti-404: Cualquier ruta inválida regresa al dashboard seguro */}
            <Route path="*" element={<Navigate to="/dashboard" replace />} />
          </Routes>
        </BrowserRouter>
      </AuthProvider>
    </QueryClientProvider>
  )
}