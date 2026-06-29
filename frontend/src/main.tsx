import React from 'react'
import { createRoot } from 'react-dom/client'
import App from './App' // ✅ Ahora apuntamos a nuestro App.tsx maestro
import './index.css'

// 1. Importamos el motor de caché
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

// 2. Lo configuramos por fuera para que no se reinicie
const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60 * 5, // 5 minutos de frescura
      retry: 1,
      refetchOnWindowFocus: false,
    },
  },
})

// 3. Envolvemos a la App con el Motor Supremo
createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <QueryClientProvider client={queryClient}>
      <App />
    </QueryClientProvider>
  </React.StrictMode>,
)