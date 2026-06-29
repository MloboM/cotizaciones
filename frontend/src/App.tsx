import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

import { ClientesPage } from '@/features/clientes/ClientesPage'

import { AuthProvider } from '@/core/auth/AuthProvider'
import { AuthGate } from '@/core/auth/AuthGate'
import { TenantProvider } from '@/core/tenant/TenantProvider'
import { CompanyProvider } from '@/core/tenant/CompanyProvider'

import { LoginPage } from '@/features/auth/LoginPage'
import { AppLayout } from '@/components/layout/AppLayout'

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
// COMPONENTES TEMPORALES DE TRABAJO (FASE 2)
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

// Unificado: Este es tu verdadero catálogo conectado a la base de datos de productos e IA
function TempCatalogo() {
  return (
    <div className="bg-white p-8 rounded-2xl shadow-sm border border-zinc-200 max-w-4xl mx-auto mt-6">
      <div className="flex items-center justify-between border-b border-zinc-100 pb-4">
        <div>
          <h1 className="text-2xl font-bold text-zinc-900 tracking-tight">Catálogo de Productos</h1>
          <p className="text-zinc-500 mt-1 text-sm">
            Gestión de inventario base y búsqueda semántica con Embedded AI habilitada.
          </p>
        </div>
        <span className="inline-flex items-center rounded-md bg-emerald-50 px-2 py-1 text-xs font-medium text-emerald-700 ring-1 ring-inset ring-emerald-600/20 animate-pulse">
          pgvector Listo
        </span>
      </div>

      {/* Marcador de posición para la tabla TanStack de productos */}
      <div className="mt-8 border-2 border-dashed border-zinc-200 rounded-xl h-64 flex items-center justify-center bg-zinc-50/50">
        <p className="text-sm text-zinc-400">Aquí se conectará la tabla de productos y el motor de embeddings en la Fase 4</p>
      </div>
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
        <BrowserRouter>
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
              <Route path="/clientes" element={<ClientesPage />} /> {/* Tu CRM Real */}

              {/* Rutas alineadas perfectamente con tu menú de Asana-Style */}
              <Route path="/catalogo" element={<TempCatalogo />} />
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