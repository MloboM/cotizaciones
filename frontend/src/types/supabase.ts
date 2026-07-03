export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.5"
  }
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          extensions?: Json
          operationName?: string
          query?: string
          variables?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      atributos_catalogo: {
        Row: {
          activo: boolean
          created_at: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          opciones_lista: string[] | null
          tipo_dato: Database["public"]["Enums"]["atributo_tipo_dato_enum"]
          unidad_medida_id: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          opciones_lista?: string[] | null
          tipo_dato?: Database["public"]["Enums"]["atributo_tipo_dato_enum"]
          unidad_medida_id?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          opciones_lista?: string[] | null
          tipo_dato?: Database["public"]["Enums"]["atributo_tipo_dato_enum"]
          unidad_medida_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "atributos_catalogo_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "atributos_catalogo_empresa_id_unidad_medida_id_fkey"
            columns: ["empresa_id", "unidad_medida_id"]
            isOneToOne: false
            referencedRelation: "unidades_medida"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      audit_eventos: {
        Row: {
          accion: string
          actor_id: string | null
          created_at: string
          detalles: Json
          empresa_id: string
          id: string
          target_id: string | null
        }
        Insert: {
          accion: string
          actor_id?: string | null
          created_at?: string
          detalles?: Json
          empresa_id: string
          id?: string
          target_id?: string | null
        }
        Update: {
          accion?: string
          actor_id?: string | null
          created_at?: string
          detalles?: Json
          empresa_id?: string
          id?: string
          target_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "audit_eventos_actor_id_fkey"
            columns: ["actor_id"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "audit_eventos_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "audit_eventos_target_id_fkey"
            columns: ["target_id"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["id"]
          },
        ]
      }
      bodegas: {
        Row: {
          activo: boolean
          empresa_id: string
          id: string
          nombre: string
          tipo_bodega: Database["public"]["Enums"]["tipo_bodega_enum"]
        }
        Insert: {
          activo?: boolean
          empresa_id: string
          id?: string
          nombre: string
          tipo_bodega?: Database["public"]["Enums"]["tipo_bodega_enum"]
        }
        Update: {
          activo?: boolean
          empresa_id?: string
          id?: string
          nombre?: string
          tipo_bodega?: Database["public"]["Enums"]["tipo_bodega_enum"]
        }
        Relationships: [
          {
            foreignKeyName: "bodegas_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      cache_consultas_ia: {
        Row: {
          created_at: string | null
          empresa_id: string
          expires_at: string
          parametros_json: Json
          query_hash: string
          version_modelo: string
        }
        Insert: {
          created_at?: string | null
          empresa_id: string
          expires_at: string
          parametros_json: Json
          query_hash: string
          version_modelo: string
        }
        Update: {
          created_at?: string | null
          empresa_id?: string
          expires_at?: string
          parametros_json?: Json
          query_hash?: string
          version_modelo?: string
        }
        Relationships: [
          {
            foreignKeyName: "cache_consultas_ia_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      caracteristicas: {
        Row: {
          codigo: string
          created_at: string
          deleted_at: string | null
          descripcion: string | null
          id: string
          tipo_valor: Database["public"]["Enums"]["caracteristica_data_type"]
        }
        Insert: {
          codigo: string
          created_at?: string
          deleted_at?: string | null
          descripcion?: string | null
          id?: string
          tipo_valor?: Database["public"]["Enums"]["caracteristica_data_type"]
        }
        Update: {
          codigo?: string
          created_at?: string
          deleted_at?: string | null
          descripcion?: string | null
          id?: string
          tipo_valor?: Database["public"]["Enums"]["caracteristica_data_type"]
        }
        Relationships: []
      }
      catalogo_sinonimos: {
        Row: {
          contexto_termino: string | null
          empresa_id: string
          id: string
          termino_canonico: string
          termino_origen: string
        }
        Insert: {
          contexto_termino?: string | null
          empresa_id: string
          id?: string
          termino_canonico: string
          termino_origen: string
        }
        Update: {
          contexto_termino?: string | null
          empresa_id?: string
          id?: string
          termino_canonico?: string
          termino_origen?: string
        }
        Relationships: [
          {
            foreignKeyName: "catalogo_sinonimos_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      catalogos_oficiales: {
        Row: {
          activo: boolean
          codigo: string
          descripcion: string
          id: string
          pais_codigo: string | null
          tarifa_impuesto_referencia: number | null
          tipo_catalogo: Database["public"]["Enums"]["tipo_catalogo_oficial_enum"]
          updated_at: string | null
        }
        Insert: {
          activo?: boolean
          codigo: string
          descripcion: string
          id?: string
          pais_codigo?: string | null
          tarifa_impuesto_referencia?: number | null
          tipo_catalogo: Database["public"]["Enums"]["tipo_catalogo_oficial_enum"]
          updated_at?: string | null
        }
        Update: {
          activo?: boolean
          codigo?: string
          descripcion?: string
          id?: string
          pais_codigo?: string | null
          tarifa_impuesto_referencia?: number | null
          tipo_catalogo?: Database["public"]["Enums"]["tipo_catalogo_oficial_enum"]
          updated_at?: string | null
        }
        Relationships: []
      }
      categorias_fiscales: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "categorias_fiscales_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "categorias_fiscales_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "categorias_fiscales_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      categorias_producto: {
        Row: {
          activo: boolean
          categoria_padre_id: string | null
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          ruta_jerarquica: string | null
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          categoria_padre_id?: string | null
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          ruta_jerarquica?: string | null
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          categoria_padre_id?: string | null
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          ruta_jerarquica?: string | null
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "categorias_producto_empresa_id_categoria_padre_id_fkey"
            columns: ["empresa_id", "categoria_padre_id"]
            isOneToOne: false
            referencedRelation: "categorias_producto"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "categorias_producto_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      cliente_tags: {
        Row: {
          cliente_id: string
          created_at: string | null
          empresa_id: string
          tag_id: string
        }
        Insert: {
          cliente_id: string
          created_at?: string | null
          empresa_id: string
          tag_id: string
        }
        Update: {
          cliente_id?: string
          created_at?: string | null
          empresa_id?: string
          tag_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "cliente_tags_empresa_id_cliente_id_fkey"
            columns: ["empresa_id", "cliente_id"]
            isOneToOne: false
            referencedRelation: "clientes"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cliente_tags_empresa_id_tag_id_fkey"
            columns: ["empresa_id", "tag_id"]
            isOneToOne: false
            referencedRelation: "tags"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      clientes: {
        Row: {
          activo: boolean
          categoria_fiscal_id: string | null
          cliente_padre_id: string | null
          condicion_pago: string
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          descuento_maximo_permitido: number
          dias_credito: number
          empresa_id: string
          estado_comercial: Database["public"]["Enums"]["estado_comercial_enum"]
          id: string
          industria_id: string | null
          limite_credito: number
          metadata: Json
          moneda_preferida_codigo: string | null
          nombre_comercial: string
          numero_identificacion: string | null
          origen_id: string | null
          razon_social: string | null
          responsable_comercial_id: string | null
          tipo_cliente_id: string | null
          tipo_identificacion_codigo: string | null
          updated_at: string | null
          updated_by: string | null
          zona_id: string | null
        }
        Insert: {
          activo?: boolean
          categoria_fiscal_id?: string | null
          cliente_padre_id?: string | null
          condicion_pago?: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          descuento_maximo_permitido?: number
          dias_credito?: number
          empresa_id: string
          estado_comercial?: Database["public"]["Enums"]["estado_comercial_enum"]
          id?: string
          industria_id?: string | null
          limite_credito?: number
          metadata?: Json
          moneda_preferida_codigo?: string | null
          nombre_comercial: string
          numero_identificacion?: string | null
          origen_id?: string | null
          razon_social?: string | null
          responsable_comercial_id?: string | null
          tipo_cliente_id?: string | null
          tipo_identificacion_codigo?: string | null
          updated_at?: string | null
          updated_by?: string | null
          zona_id?: string | null
        }
        Update: {
          activo?: boolean
          categoria_fiscal_id?: string | null
          cliente_padre_id?: string | null
          condicion_pago?: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          descuento_maximo_permitido?: number
          dias_credito?: number
          empresa_id?: string
          estado_comercial?: Database["public"]["Enums"]["estado_comercial_enum"]
          id?: string
          industria_id?: string | null
          limite_credito?: number
          metadata?: Json
          moneda_preferida_codigo?: string | null
          nombre_comercial?: string
          numero_identificacion?: string | null
          origen_id?: string | null
          razon_social?: string | null
          responsable_comercial_id?: string | null
          tipo_cliente_id?: string | null
          tipo_identificacion_codigo?: string | null
          updated_at?: string | null
          updated_by?: string | null
          zona_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "clientes_empresa_id_categoria_fiscal_id_fkey"
            columns: ["empresa_id", "categoria_fiscal_id"]
            isOneToOne: false
            referencedRelation: "categorias_fiscales"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_cliente_padre_id_fkey"
            columns: ["empresa_id", "cliente_padre_id"]
            isOneToOne: false
            referencedRelation: "clientes"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_industria_id_fkey"
            columns: ["empresa_id", "industria_id"]
            isOneToOne: false
            referencedRelation: "industrias"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_origen_id_fkey"
            columns: ["empresa_id", "origen_id"]
            isOneToOne: false
            referencedRelation: "origenes_cliente"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_responsable_comercial_id_fkey"
            columns: ["empresa_id", "responsable_comercial_id"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_tipo_cliente_id_fkey"
            columns: ["empresa_id", "tipo_cliente_id"]
            isOneToOne: false
            referencedRelation: "tipos_cliente"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_empresa_id_zona_id_fkey"
            columns: ["empresa_id", "zona_id"]
            isOneToOne: false
            referencedRelation: "zonas"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "clientes_moneda_preferida_codigo_fkey"
            columns: ["moneda_preferida_codigo"]
            isOneToOne: false
            referencedRelation: "monedas"
            referencedColumns: ["codigo"]
          },
          {
            foreignKeyName: "clientes_tipo_identificacion_codigo_fkey"
            columns: ["tipo_identificacion_codigo"]
            isOneToOne: false
            referencedRelation: "tipos_identificacion"
            referencedColumns: ["codigo"]
          },
        ]
      }
      condiciones_pago: {
        Row: {
          activo: boolean
          codigo: string
          dias_credito: number
          empresa_id: string
          id: string
          nombre: string
        }
        Insert: {
          activo?: boolean
          codigo: string
          dias_credito?: number
          empresa_id: string
          id?: string
          nombre: string
        }
        Update: {
          activo?: boolean
          codigo?: string
          dias_credito?: number
          empresa_id?: string
          id?: string
          nombre?: string
        }
        Relationships: [
          {
            foreignKeyName: "condiciones_pago_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      contactos_cliente: {
        Row: {
          cliente_id: string
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          deleted_by_cascade: boolean | null
          email: string | null
          empresa_id: string
          es_principal: boolean | null
          id: string
          nombre_completo: string
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          cliente_id: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          deleted_by_cascade?: boolean | null
          email?: string | null
          empresa_id: string
          es_principal?: boolean | null
          id?: string
          nombre_completo: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          cliente_id?: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          deleted_by_cascade?: boolean | null
          email?: string | null
          empresa_id?: string
          es_principal?: boolean | null
          id?: string
          nombre_completo?: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "contactos_cliente_empresa_id_cliente_id_fkey"
            columns: ["empresa_id", "cliente_id"]
            isOneToOne: false
            referencedRelation: "clientes"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "contactos_cliente_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "contactos_cliente_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      costos_producto: {
        Row: {
          costo_unitario: number
          created_at: string
          created_by: string | null
          empresa_id: string
          id: string
          moneda_codigo: string
          producto_id: string
          proveedor_id: string | null
          tipo_costo: Database["public"]["Enums"]["tipo_costo_enum"]
          valida_desde: string
          valida_hasta: string | null
        }
        Insert: {
          costo_unitario: number
          created_at?: string
          created_by?: string | null
          empresa_id: string
          id?: string
          moneda_codigo: string
          producto_id: string
          proveedor_id?: string | null
          tipo_costo?: Database["public"]["Enums"]["tipo_costo_enum"]
          valida_desde?: string
          valida_hasta?: string | null
        }
        Update: {
          costo_unitario?: number
          created_at?: string
          created_by?: string | null
          empresa_id?: string
          id?: string
          moneda_codigo?: string
          producto_id?: string
          proveedor_id?: string | null
          tipo_costo?: Database["public"]["Enums"]["tipo_costo_enum"]
          valida_desde?: string
          valida_hasta?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "costos_producto_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "costos_producto_empresa_id_proveedor_id_fkey"
            columns: ["empresa_id", "proveedor_id"]
            isOneToOne: false
            referencedRelation: "proveedores"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "costos_producto_moneda_codigo_fkey"
            columns: ["moneda_codigo"]
            isOneToOne: false
            referencedRelation: "monedas"
            referencedColumns: ["codigo"]
          },
        ]
      }
      cotizacion_aprobaciones: {
        Row: {
          cotizacion_id: string
          empresa_id: string
          estado: Database["public"]["Enums"]["estado_aprobacion_enum"]
          evaluado_por: string | null
          fecha_evaluacion: string | null
          fecha_solicitud: string
          id: string
          justificacion_solicitud: string | null
          notas_evaluador: string | null
          politica_id: string
          solicitado_por: string
        }
        Insert: {
          cotizacion_id: string
          empresa_id: string
          estado?: Database["public"]["Enums"]["estado_aprobacion_enum"]
          evaluado_por?: string | null
          fecha_evaluacion?: string | null
          fecha_solicitud?: string
          id?: string
          justificacion_solicitud?: string | null
          notas_evaluador?: string | null
          politica_id: string
          solicitado_por: string
        }
        Update: {
          cotizacion_id?: string
          empresa_id?: string
          estado?: Database["public"]["Enums"]["estado_aprobacion_enum"]
          evaluado_por?: string | null
          fecha_evaluacion?: string | null
          fecha_solicitud?: string
          id?: string
          justificacion_solicitud?: string | null
          notas_evaluador?: string | null
          politica_id?: string
          solicitado_por?: string
        }
        Relationships: [
          {
            foreignKeyName: "cotizacion_aprobaciones_empresa_id_cotizacion_id_fkey"
            columns: ["empresa_id", "cotizacion_id"]
            isOneToOne: false
            referencedRelation: "cotizaciones"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cotizacion_aprobaciones_empresa_id_politica_id_fkey"
            columns: ["empresa_id", "politica_id"]
            isOneToOne: false
            referencedRelation: "politicas_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cotizacion_eventos: {
        Row: {
          actor_id: string
          cotizacion_id: string
          created_at: string
          descripcion: string
          detalles_json: Json | null
          empresa_id: string
          id: string
          tipo_evento: Database["public"]["Enums"]["evento_cotizacion_enum"]
        }
        Insert: {
          actor_id: string
          cotizacion_id: string
          created_at?: string
          descripcion: string
          detalles_json?: Json | null
          empresa_id: string
          id?: string
          tipo_evento: Database["public"]["Enums"]["evento_cotizacion_enum"]
        }
        Update: {
          actor_id?: string
          cotizacion_id?: string
          created_at?: string
          descripcion?: string
          detalles_json?: Json | null
          empresa_id?: string
          id?: string
          tipo_evento?: Database["public"]["Enums"]["evento_cotizacion_enum"]
        }
        Relationships: [
          {
            foreignKeyName: "cotizacion_eventos_empresa_id_actor_id_fkey"
            columns: ["empresa_id", "actor_id"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cotizacion_eventos_empresa_id_cotizacion_id_fkey"
            columns: ["empresa_id", "cotizacion_id"]
            isOneToOne: false
            referencedRelation: "cotizaciones"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cotizacion_grupos: {
        Row: {
          created_at: string
          empresa_id: string
          id: string
          secuencial_visual: number
        }
        Insert: {
          created_at?: string
          empresa_id: string
          id?: string
          secuencial_visual: number
        }
        Update: {
          created_at?: string
          empresa_id?: string
          id?: string
          secuencial_visual?: number
        }
        Relationships: [
          {
            foreignKeyName: "cotizacion_grupos_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      cotizacion_lineas: {
        Row: {
          atributos_snapshot: Json | null
          cantidad: number
          clasificadores_oficiales_snapshot: Json | null
          costo_unitario_base: number
          cotizacion_id: string
          created_at: string
          created_by: string | null
          descripcion_congelada: string | null
          empresa_id: string
          es_opcional: boolean
          id: string
          margen_linea_base: number
          monto_descuento: number
          monto_impuesto: number
          nombre_congelado: string
          orden_impresion: number
          porcentaje_descuento: number
          porcentaje_impuesto: number
          precio_unitario: number
          producto_id: string | null
          sku_congelado: string | null
          tipo_producto_congelado: Database["public"]["Enums"]["tipo_producto_enum"]
          total_linea: number
          updated_by: string | null
        }
        Insert: {
          atributos_snapshot?: Json | null
          cantidad: number
          clasificadores_oficiales_snapshot?: Json | null
          costo_unitario_base?: number
          cotizacion_id: string
          created_at?: string
          created_by?: string | null
          descripcion_congelada?: string | null
          empresa_id: string
          es_opcional?: boolean
          id?: string
          margen_linea_base?: number
          monto_descuento?: number
          monto_impuesto?: number
          nombre_congelado: string
          orden_impresion?: number
          porcentaje_descuento?: number
          porcentaje_impuesto?: number
          precio_unitario?: number
          producto_id?: string | null
          sku_congelado?: string | null
          tipo_producto_congelado: Database["public"]["Enums"]["tipo_producto_enum"]
          total_linea?: number
          updated_by?: string | null
        }
        Update: {
          atributos_snapshot?: Json | null
          cantidad?: number
          clasificadores_oficiales_snapshot?: Json | null
          costo_unitario_base?: number
          cotizacion_id?: string
          created_at?: string
          created_by?: string | null
          descripcion_congelada?: string | null
          empresa_id?: string
          es_opcional?: boolean
          id?: string
          margen_linea_base?: number
          monto_descuento?: number
          monto_impuesto?: number
          nombre_congelado?: string
          orden_impresion?: number
          porcentaje_descuento?: number
          porcentaje_impuesto?: number
          precio_unitario?: number
          producto_id?: string | null
          sku_congelado?: string | null
          tipo_producto_congelado?: Database["public"]["Enums"]["tipo_producto_enum"]
          total_linea?: number
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "cotizacion_lineas_empresa_id_cotizacion_id_fkey"
            columns: ["empresa_id", "cotizacion_id"]
            isOneToOne: false
            referencedRelation: "cotizaciones"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cotizacion_lineas_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cotizacion_narrativas_ia: {
        Row: {
          alcance_exclusiones: string | null
          cotizacion_id: string
          created_at: string
          empresa_id: string
          justificacion_comercial: string | null
          modelo_ia_generador: string | null
          objetivos_proyecto: string | null
          resumen_ejecutivo: string | null
          revisado_por_humano: boolean
          updated_at: string
        }
        Insert: {
          alcance_exclusiones?: string | null
          cotizacion_id: string
          created_at?: string
          empresa_id: string
          justificacion_comercial?: string | null
          modelo_ia_generador?: string | null
          objetivos_proyecto?: string | null
          resumen_ejecutivo?: string | null
          revisado_por_humano?: boolean
          updated_at?: string
        }
        Update: {
          alcance_exclusiones?: string | null
          cotizacion_id?: string
          created_at?: string
          empresa_id?: string
          justificacion_comercial?: string | null
          modelo_ia_generador?: string | null
          objetivos_proyecto?: string | null
          resumen_ejecutivo?: string | null
          revisado_por_humano?: boolean
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "cotizacion_narrativas_ia_empresa_id_cotizacion_id_fkey"
            columns: ["empresa_id", "cotizacion_id"]
            isOneToOne: true
            referencedRelation: "cotizaciones"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cotizaciones: {
        Row: {
          cliente_id: string | null
          clonado_de_id: string | null
          condiciones_pago: string | null
          costo_total_base: number
          created_at: string
          created_by: string | null
          deleted_at: string | null
          documento_grupo_id: string
          empresa_id: string
          es_plantilla: boolean
          estado: Database["public"]["Enums"]["estado_cotizacion_enum"]
          fecha_emision: string | null
          fecha_vencimiento: string | null
          id: string
          lista_precio_id: string | null
          margen_total_base: number
          moneda_cotizacion: string
          nombre_plantilla: string | null
          notas_comerciales: string | null
          rentabilidad_porcentaje: number
          tasa_cambio_a_base: number
          total_bruto: number
          total_descuento: number
          total_impuestos: number
          total_neto: number
          updated_at: string
          updated_by: string | null
          vendedor_id: string
          version_numero: number
        }
        Insert: {
          cliente_id?: string | null
          clonado_de_id?: string | null
          condiciones_pago?: string | null
          costo_total_base?: number
          created_at?: string
          created_by?: string | null
          deleted_at?: string | null
          documento_grupo_id: string
          empresa_id: string
          es_plantilla?: boolean
          estado?: Database["public"]["Enums"]["estado_cotizacion_enum"]
          fecha_emision?: string | null
          fecha_vencimiento?: string | null
          id?: string
          lista_precio_id?: string | null
          margen_total_base?: number
          moneda_cotizacion: string
          nombre_plantilla?: string | null
          notas_comerciales?: string | null
          rentabilidad_porcentaje?: number
          tasa_cambio_a_base?: number
          total_bruto?: number
          total_descuento?: number
          total_impuestos?: number
          total_neto?: number
          updated_at?: string
          updated_by?: string | null
          vendedor_id: string
          version_numero?: number
        }
        Update: {
          cliente_id?: string | null
          clonado_de_id?: string | null
          condiciones_pago?: string | null
          costo_total_base?: number
          created_at?: string
          created_by?: string | null
          deleted_at?: string | null
          documento_grupo_id?: string
          empresa_id?: string
          es_plantilla?: boolean
          estado?: Database["public"]["Enums"]["estado_cotizacion_enum"]
          fecha_emision?: string | null
          fecha_vencimiento?: string | null
          id?: string
          lista_precio_id?: string | null
          margen_total_base?: number
          moneda_cotizacion?: string
          nombre_plantilla?: string | null
          notas_comerciales?: string | null
          rentabilidad_porcentaje?: number
          tasa_cambio_a_base?: number
          total_bruto?: number
          total_descuento?: number
          total_impuestos?: number
          total_neto?: number
          updated_at?: string
          updated_by?: string | null
          vendedor_id?: string
          version_numero?: number
        }
        Relationships: [
          {
            foreignKeyName: "cotizaciones_empresa_id_cliente_id_fkey"
            columns: ["empresa_id", "cliente_id"]
            isOneToOne: false
            referencedRelation: "clientes"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cotizaciones_empresa_id_clonado_de_id_fkey"
            columns: ["empresa_id", "clonado_de_id"]
            isOneToOne: false
            referencedRelation: "cotizaciones"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cotizaciones_empresa_id_documento_grupo_id_fkey"
            columns: ["empresa_id", "documento_grupo_id"]
            isOneToOne: false
            referencedRelation: "cotizacion_grupos"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cotizaciones_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cotizaciones_empresa_id_lista_precio_id_fkey"
            columns: ["empresa_id", "lista_precio_id"]
            isOneToOne: false
            referencedRelation: "listas_precios"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cotizaciones_empresa_id_vendedor_id_fkey"
            columns: ["empresa_id", "vendedor_id"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "cotizaciones_moneda_cotizacion_fkey"
            columns: ["moneda_cotizacion"]
            isOneToOne: false
            referencedRelation: "monedas"
            referencedColumns: ["codigo"]
          },
        ]
      }
      cpq_reglas_catalogo: {
        Row: {
          activo: boolean
          cantidad_limite: number | null
          condicion_atributo: Json | null
          created_at: string
          empresa_id: string
          id: string
          mensaje_error: string
          producto_destino_id: string | null
          producto_origen_id: string
          tipo_regla: Database["public"]["Enums"]["tipo_regla_cpq_enum"]
        }
        Insert: {
          activo?: boolean
          cantidad_limite?: number | null
          condicion_atributo?: Json | null
          created_at?: string
          empresa_id: string
          id?: string
          mensaje_error: string
          producto_destino_id?: string | null
          producto_origen_id: string
          tipo_regla: Database["public"]["Enums"]["tipo_regla_cpq_enum"]
        }
        Update: {
          activo?: boolean
          cantidad_limite?: number | null
          condicion_atributo?: Json | null
          created_at?: string
          empresa_id?: string
          id?: string
          mensaje_error?: string
          producto_destino_id?: string | null
          producto_origen_id?: string
          tipo_regla?: Database["public"]["Enums"]["tipo_regla_cpq_enum"]
        }
        Relationships: [
          {
            foreignKeyName: "cpq_reglas_catalogo_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "cpq_reglas_catalogo_empresa_id_producto_origen_id_fkey"
            columns: ["empresa_id", "producto_origen_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cr_catalogo_actividades: {
        Row: {
          activo: boolean
          codigo_actividad: string
          descripcion: string
        }
        Insert: {
          activo?: boolean
          codigo_actividad: string
          descripcion: string
        }
        Update: {
          activo?: boolean
          codigo_actividad?: string
          descripcion?: string
        }
        Relationships: []
      }
      cr_catalogo_cabys: {
        Row: {
          activo: boolean
          codigo_cabys: string
          descripcion: string
          impuesto_default: number
          vigencia_desde: string
          vigencia_hasta: string | null
        }
        Insert: {
          activo?: boolean
          codigo_cabys: string
          descripcion: string
          impuesto_default?: number
          vigencia_desde?: string
          vigencia_hasta?: string | null
        }
        Update: {
          activo?: boolean
          codigo_cabys?: string
          descripcion?: string
          impuesto_default?: number
          vigencia_desde?: string
          vigencia_hasta?: string | null
        }
        Relationships: []
      }
      cr_documentos_fiscales: {
        Row: {
          actividad_economica_codigo: string | null
          clave_hacienda: string | null
          codigo_respuesta_hacienda: string | null
          consecutivo_hacienda: string | null
          documento_comercial_id: string
          empresa_id: string
          estado_aceptacion_receptor:
            | Database["public"]["Enums"]["cr_estado_aceptacion_enum"]
            | null
          estado_hacienda: Database["public"]["Enums"]["cr_estado_hacienda_enum"]
          fecha_envio_hacienda: string | null
          fecha_respuesta_hacienda: string | null
          id: string
          mensaje_hacienda: string | null
          xml_firmado_url: string | null
          xml_generado_url: string | null
          xml_respuesta_url: string | null
        }
        Insert: {
          actividad_economica_codigo?: string | null
          clave_hacienda?: string | null
          codigo_respuesta_hacienda?: string | null
          consecutivo_hacienda?: string | null
          documento_comercial_id: string
          empresa_id: string
          estado_aceptacion_receptor?:
            | Database["public"]["Enums"]["cr_estado_aceptacion_enum"]
            | null
          estado_hacienda?: Database["public"]["Enums"]["cr_estado_hacienda_enum"]
          fecha_envio_hacienda?: string | null
          fecha_respuesta_hacienda?: string | null
          id?: string
          mensaje_hacienda?: string | null
          xml_firmado_url?: string | null
          xml_generado_url?: string | null
          xml_respuesta_url?: string | null
        }
        Update: {
          actividad_economica_codigo?: string | null
          clave_hacienda?: string | null
          codigo_respuesta_hacienda?: string | null
          consecutivo_hacienda?: string | null
          documento_comercial_id?: string
          empresa_id?: string
          estado_aceptacion_receptor?:
            | Database["public"]["Enums"]["cr_estado_aceptacion_enum"]
            | null
          estado_hacienda?: Database["public"]["Enums"]["cr_estado_hacienda_enum"]
          fecha_envio_hacienda?: string | null
          fecha_respuesta_hacienda?: string | null
          id?: string
          mensaje_hacienda?: string | null
          xml_firmado_url?: string | null
          xml_generado_url?: string | null
          xml_respuesta_url?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "cr_documentos_fiscales_actividad_economica_codigo_fkey"
            columns: ["actividad_economica_codigo"]
            isOneToOne: false
            referencedRelation: "cr_catalogo_actividades"
            referencedColumns: ["codigo_actividad"]
          },
          {
            foreignKeyName: "cr_documentos_fiscales_empresa_id_documento_comercial_id_fkey"
            columns: ["empresa_id", "documento_comercial_id"]
            isOneToOne: true
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cr_empresa_actividades: {
        Row: {
          codigo_actividad: string
          empresa_id: string
          es_principal: boolean
        }
        Insert: {
          codigo_actividad: string
          empresa_id: string
          es_principal?: boolean
        }
        Update: {
          codigo_actividad?: string
          empresa_id?: string
          es_principal?: boolean
        }
        Relationships: [
          {
            foreignKeyName: "cr_empresa_actividades_codigo_actividad_fkey"
            columns: ["codigo_actividad"]
            isOneToOne: false
            referencedRelation: "cr_catalogo_actividades"
            referencedColumns: ["codigo_actividad"]
          },
          {
            foreignKeyName: "cr_empresa_actividades_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      cr_series_documentales: {
        Row: {
          activo: boolean
          codigo_tipo_hacienda: string
          empresa_id: string
          id: string
          secuencia_actual: number
          terminal_id: string
        }
        Insert: {
          activo?: boolean
          codigo_tipo_hacienda: string
          empresa_id: string
          id?: string
          secuencia_actual?: number
          terminal_id: string
        }
        Update: {
          activo?: boolean
          codigo_tipo_hacienda?: string
          empresa_id?: string
          id?: string
          secuencia_actual?: number
          terminal_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "cr_series_documentales_empresa_id_terminal_id_fkey"
            columns: ["empresa_id", "terminal_id"]
            isOneToOne: false
            referencedRelation: "cr_terminales"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cr_sucursales: {
        Row: {
          empresa_id: string
          id: string
          nombre: string
          numero_sucursal: string
        }
        Insert: {
          empresa_id: string
          id?: string
          nombre: string
          numero_sucursal: string
        }
        Update: {
          empresa_id?: string
          id?: string
          nombre?: string
          numero_sucursal?: string
        }
        Relationships: [
          {
            foreignKeyName: "cr_sucursales_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      cr_terminales: {
        Row: {
          empresa_id: string
          id: string
          nombre: string
          numero_terminal: string
          sucursal_id: string
        }
        Insert: {
          empresa_id: string
          id?: string
          nombre: string
          numero_terminal: string
          sucursal_id: string
        }
        Update: {
          empresa_id?: string
          id?: string
          nombre?: string
          numero_terminal?: string
          sucursal_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "cr_terminales_empresa_id_sucursal_id_fkey"
            columns: ["empresa_id", "sucursal_id"]
            isOneToOne: false
            referencedRelation: "cr_sucursales"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cuentas_contables: {
        Row: {
          activo: boolean
          codigo_cuenta: string
          created_at: string
          empresa_id: string
          id: string
          nombre_cuenta: string
        }
        Insert: {
          activo?: boolean
          codigo_cuenta: string
          created_at?: string
          empresa_id: string
          id?: string
          nombre_cuenta: string
        }
        Update: {
          activo?: boolean
          codigo_cuenta?: string
          created_at?: string
          empresa_id?: string
          id?: string
          nombre_cuenta?: string
        }
        Relationships: [
          {
            foreignKeyName: "cuentas_contables_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      cxc_transacciones: {
        Row: {
          created_at: string
          created_by: string | null
          documento_id: string
          empresa_id: string
          estado_pago: Database["public"]["Enums"]["estado_pago_enum"]
          id: string
          moneda_pago: string
          monto_transaccion: number
          referencia_bancaria: string | null
          tasa_cambio_a_factura: number
          tipo_transaccion: Database["public"]["Enums"]["tipo_transaccion_cxc_enum"]
        }
        Insert: {
          created_at?: string
          created_by?: string | null
          documento_id: string
          empresa_id: string
          estado_pago?: Database["public"]["Enums"]["estado_pago_enum"]
          id?: string
          moneda_pago: string
          monto_transaccion: number
          referencia_bancaria?: string | null
          tasa_cambio_a_factura?: number
          tipo_transaccion: Database["public"]["Enums"]["tipo_transaccion_cxc_enum"]
        }
        Update: {
          created_at?: string
          created_by?: string | null
          documento_id?: string
          empresa_id?: string
          estado_pago?: Database["public"]["Enums"]["estado_pago_enum"]
          id?: string
          moneda_pago?: string
          monto_transaccion?: number
          referencia_bancaria?: string | null
          tasa_cambio_a_factura?: number
          tipo_transaccion?: Database["public"]["Enums"]["tipo_transaccion_cxc_enum"]
        }
        Relationships: [
          {
            foreignKeyName: "cxc_transacciones_empresa_id_documento_id_fkey"
            columns: ["empresa_id", "documento_id"]
            isOneToOne: false
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      cxp_transacciones: {
        Row: {
          created_at: string
          created_by: string | null
          documento_id: string
          empresa_id: string
          estado_pago: Database["public"]["Enums"]["estado_pago_enum"]
          id: string
          moneda_pago: string
          monto_transaccion: number
          referencia_documento: string | null
          tasa_cambio_a_factura: number
          tipo_transaccion: Database["public"]["Enums"]["tipo_transaccion_cxp_enum"]
        }
        Insert: {
          created_at?: string
          created_by?: string | null
          documento_id: string
          empresa_id: string
          estado_pago?: Database["public"]["Enums"]["estado_pago_enum"]
          id?: string
          moneda_pago: string
          monto_transaccion: number
          referencia_documento?: string | null
          tasa_cambio_a_factura?: number
          tipo_transaccion: Database["public"]["Enums"]["tipo_transaccion_cxp_enum"]
        }
        Update: {
          created_at?: string
          created_by?: string | null
          documento_id?: string
          empresa_id?: string
          estado_pago?: Database["public"]["Enums"]["estado_pago_enum"]
          id?: string
          moneda_pago?: string
          monto_transaccion?: number
          referencia_documento?: string | null
          tasa_cambio_a_factura?: number
          tipo_transaccion?: Database["public"]["Enums"]["tipo_transaccion_cxp_enum"]
        }
        Relationships: [
          {
            foreignKeyName: "cxp_transacciones_empresa_id_documento_id_fkey"
            columns: ["empresa_id", "documento_id"]
            isOneToOne: false
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      direcciones_cliente: {
        Row: {
          cliente_id: string
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          deleted_by_cascade: boolean | null
          direccion_linea1: string
          empresa_id: string
          es_principal: boolean | null
          id: string
          tipo_direccion: Database["public"]["Enums"]["tipo_direccion_enum"]
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          cliente_id: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          deleted_by_cascade?: boolean | null
          direccion_linea1: string
          empresa_id: string
          es_principal?: boolean | null
          id?: string
          tipo_direccion?: Database["public"]["Enums"]["tipo_direccion_enum"]
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          cliente_id?: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          deleted_by_cascade?: boolean | null
          direccion_linea1?: string
          empresa_id?: string
          es_principal?: boolean | null
          id?: string
          tipo_direccion?: Database["public"]["Enums"]["tipo_direccion_enum"]
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "direcciones_cliente_empresa_id_cliente_id_fkey"
            columns: ["empresa_id", "cliente_id"]
            isOneToOne: false
            referencedRelation: "clientes"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "direcciones_cliente_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "direcciones_cliente_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      documentos_comerciales: {
        Row: {
          cliente_id: string | null
          condicion_pago_id: string | null
          consecutivo_visual: string
          cotizacion_id: string | null
          created_at: string
          created_by: string | null
          documento_padre_id: string | null
          empresa_id: string
          entidad_email: string | null
          entidad_identificacion_numero: string | null
          entidad_identificacion_tipo: string | null
          entidad_nombre: string | null
          estado_operativo: Database["public"]["Enums"]["estado_operativo_enum"]
          fecha_emision: string
          fecha_vencimiento: string | null
          id: string
          moneda_documento: string
          monto_bruto: number
          monto_descuento: number
          monto_impuesto: number
          monto_total: number
          notas_comerciales: string | null
          proveedor_id: string | null
          saldo_pendiente: number
          tipo_cambio_emision: number
          tipo_documento: Database["public"]["Enums"]["tipo_documento_comercial_enum"]
          updated_at: string
          updated_by: string | null
        }
        Insert: {
          cliente_id?: string | null
          condicion_pago_id?: string | null
          consecutivo_visual: string
          cotizacion_id?: string | null
          created_at?: string
          created_by?: string | null
          documento_padre_id?: string | null
          empresa_id: string
          entidad_email?: string | null
          entidad_identificacion_numero?: string | null
          entidad_identificacion_tipo?: string | null
          entidad_nombre?: string | null
          estado_operativo?: Database["public"]["Enums"]["estado_operativo_enum"]
          fecha_emision?: string
          fecha_vencimiento?: string | null
          id?: string
          moneda_documento: string
          monto_bruto?: number
          monto_descuento?: number
          monto_impuesto?: number
          monto_total?: number
          notas_comerciales?: string | null
          proveedor_id?: string | null
          saldo_pendiente?: number
          tipo_cambio_emision?: number
          tipo_documento: Database["public"]["Enums"]["tipo_documento_comercial_enum"]
          updated_at?: string
          updated_by?: string | null
        }
        Update: {
          cliente_id?: string | null
          condicion_pago_id?: string | null
          consecutivo_visual?: string
          cotizacion_id?: string | null
          created_at?: string
          created_by?: string | null
          documento_padre_id?: string | null
          empresa_id?: string
          entidad_email?: string | null
          entidad_identificacion_numero?: string | null
          entidad_identificacion_tipo?: string | null
          entidad_nombre?: string | null
          estado_operativo?: Database["public"]["Enums"]["estado_operativo_enum"]
          fecha_emision?: string
          fecha_vencimiento?: string | null
          id?: string
          moneda_documento?: string
          monto_bruto?: number
          monto_descuento?: number
          monto_impuesto?: number
          monto_total?: number
          notas_comerciales?: string | null
          proveedor_id?: string | null
          saldo_pendiente?: number
          tipo_cambio_emision?: number
          tipo_documento?: Database["public"]["Enums"]["tipo_documento_comercial_enum"]
          updated_at?: string
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "documentos_comerciales_empresa_id_cliente_id_fkey"
            columns: ["empresa_id", "cliente_id"]
            isOneToOne: false
            referencedRelation: "clientes"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "documentos_comerciales_empresa_id_condicion_pago_id_fkey"
            columns: ["empresa_id", "condicion_pago_id"]
            isOneToOne: false
            referencedRelation: "condiciones_pago"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "documentos_comerciales_empresa_id_documento_padre_id_fkey"
            columns: ["empresa_id", "documento_padre_id"]
            isOneToOne: false
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "documentos_comerciales_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "documentos_comerciales_empresa_id_proveedor_id_fkey"
            columns: ["empresa_id", "proveedor_id"]
            isOneToOne: false
            referencedRelation: "proveedores"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      documentos_historial_estados: {
        Row: {
          cambiado_por: string
          created_at: string
          documento_id: string
          empresa_id: string
          estado_anterior:
            | Database["public"]["Enums"]["estado_operativo_enum"]
            | null
          estado_nuevo: Database["public"]["Enums"]["estado_operativo_enum"]
          id: string
        }
        Insert: {
          cambiado_por: string
          created_at?: string
          documento_id: string
          empresa_id: string
          estado_anterior?:
            | Database["public"]["Enums"]["estado_operativo_enum"]
            | null
          estado_nuevo: Database["public"]["Enums"]["estado_operativo_enum"]
          id?: string
        }
        Update: {
          cambiado_por?: string
          created_at?: string
          documento_id?: string
          empresa_id?: string
          estado_anterior?:
            | Database["public"]["Enums"]["estado_operativo_enum"]
            | null
          estado_nuevo?: Database["public"]["Enums"]["estado_operativo_enum"]
          id?: string
        }
        Relationships: [
          {
            foreignKeyName: "documentos_historial_estados_empresa_id_documento_id_fkey"
            columns: ["empresa_id", "documento_id"]
            isOneToOne: false
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      documentos_versiones: {
        Row: {
          created_at: string
          created_by: string | null
          documento_comercial_id: string
          empresa_id: string
          id: string
          snapshot_json: Json
          version_numero: number
        }
        Insert: {
          created_at?: string
          created_by?: string | null
          documento_comercial_id: string
          empresa_id: string
          id?: string
          snapshot_json: Json
          version_numero: number
        }
        Update: {
          created_at?: string
          created_by?: string | null
          documento_comercial_id?: string
          empresa_id?: string
          id?: string
          snapshot_json?: Json
          version_numero?: number
        }
        Relationships: [
          {
            foreignKeyName: "documentos_versiones_empresa_id_documento_comercial_id_fkey"
            columns: ["empresa_id", "documento_comercial_id"]
            isOneToOne: false
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      empresa_suscripciones: {
        Row: {
          empresa_id: string
          estado: string
          feature_flags: Json
          fecha_renovacion: string
          plan_id: string
        }
        Insert: {
          empresa_id: string
          estado?: string
          feature_flags?: Json
          fecha_renovacion: string
          plan_id: string
        }
        Update: {
          empresa_id?: string
          estado?: string
          feature_flags?: Json
          fecha_renovacion?: string
          plan_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "empresa_suscripciones_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: true
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "empresa_suscripciones_plan_id_fkey"
            columns: ["plan_id"]
            isOneToOne: false
            referencedRelation: "saas_planes"
            referencedColumns: ["id"]
          },
        ]
      }
      empresas: {
        Row: {
          created_at: string
          deleted_at: string | null
          estado: Database["public"]["Enums"]["empresa_estado_enum"]
          giro_comercial: Database["public"]["Enums"]["giro_comercial_enum"]
          id: string
          iva_default: number
          moneda_base: string
          nombre_comercial: string
          sub_nicho: string | null
          updated_at: string
        }
        Insert: {
          created_at?: string
          deleted_at?: string | null
          estado?: Database["public"]["Enums"]["empresa_estado_enum"]
          giro_comercial?: Database["public"]["Enums"]["giro_comercial_enum"]
          id?: string
          iva_default?: number
          moneda_base?: string
          nombre_comercial: string
          sub_nicho?: string | null
          updated_at?: string
        }
        Update: {
          created_at?: string
          deleted_at?: string | null
          estado?: Database["public"]["Enums"]["empresa_estado_enum"]
          giro_comercial?: Database["public"]["Enums"]["giro_comercial_enum"]
          id?: string
          iva_default?: number
          moneda_base?: string
          nombre_comercial?: string
          sub_nicho?: string | null
          updated_at?: string
        }
        Relationships: []
      }
      eventos_consumo: {
        Row: {
          cantidad: number
          created_at: string
          empresa_id: string
          evento_tipo: string
          id: string
          metadata: Json | null
          suscripcion_id: string
        }
        Insert: {
          cantidad?: number
          created_at?: string
          empresa_id: string
          evento_tipo: string
          id?: string
          metadata?: Json | null
          suscripcion_id: string
        }
        Update: {
          cantidad?: number
          created_at?: string
          empresa_id?: string
          evento_tipo?: string
          id?: string
          metadata?: Json | null
          suscripcion_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "eventos_consumo_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "eventos_consumo_suscripcion_id_fkey"
            columns: ["suscripcion_id"]
            isOneToOne: false
            referencedRelation: "suscripciones"
            referencedColumns: ["id"]
          },
        ]
      }
      finanzas_eventos: {
        Row: {
          actor_id: string
          created_at: string
          descripcion: string
          detalles_json: Json | null
          documento_referencia_id: string
          empresa_id: string
          id: string
          monto_anterior: number | null
          monto_nuevo: number | null
          tipo_evento: Database["public"]["Enums"]["evento_finanzas_enum"]
        }
        Insert: {
          actor_id: string
          created_at?: string
          descripcion: string
          detalles_json?: Json | null
          documento_referencia_id: string
          empresa_id: string
          id?: string
          monto_anterior?: number | null
          monto_nuevo?: number | null
          tipo_evento: Database["public"]["Enums"]["evento_finanzas_enum"]
        }
        Update: {
          actor_id?: string
          created_at?: string
          descripcion?: string
          detalles_json?: Json | null
          documento_referencia_id?: string
          empresa_id?: string
          id?: string
          monto_anterior?: number | null
          monto_nuevo?: number | null
          tipo_evento?: Database["public"]["Enums"]["evento_finanzas_enum"]
        }
        Relationships: []
      }
      grupos_fiscales: {
        Row: {
          activo: boolean
          codigo: string
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          porcentaje: number
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          codigo: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          porcentaje?: number
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          codigo?: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          porcentaje?: number
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "grupos_fiscales_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      ia_feedback: {
        Row: {
          consulta_original: string
          created_at: string | null
          empresa_id: string
          fue_aceptada: boolean | null
          id: string
          intencion_corregida_json: Json | null
          intencion_detectada_json: Json | null
          usuario_id: string | null
        }
        Insert: {
          consulta_original: string
          created_at?: string | null
          empresa_id: string
          fue_aceptada?: boolean | null
          id?: string
          intencion_corregida_json?: Json | null
          intencion_detectada_json?: Json | null
          usuario_id?: string | null
        }
        Update: {
          consulta_original?: string
          created_at?: string | null
          empresa_id?: string
          fue_aceptada?: boolean | null
          id?: string
          intencion_corregida_json?: Json | null
          intencion_detectada_json?: Json | null
          usuario_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "ia_feedback_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "ia_feedback_empresa_id_usuario_id_fkey"
            columns: ["empresa_id", "usuario_id"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      ia_prompts_externos: {
        Row: {
          codigo_accion: string
          empresa_id: string
          motor_predeterminado: string
          plantilla_prompt: string
        }
        Insert: {
          codigo_accion: string
          empresa_id: string
          motor_predeterminado?: string
          plantilla_prompt: string
        }
        Update: {
          codigo_accion?: string
          empresa_id?: string
          motor_predeterminado?: string
          plantilla_prompt?: string
        }
        Relationships: [
          {
            foreignKeyName: "ia_prompts_externos_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      impuestos: {
        Row: {
          activo: boolean
          codigo_impuesto: string
          empresa_id: string
          id: string
          nombre: string
          tarifa_porcentaje: number
        }
        Insert: {
          activo?: boolean
          codigo_impuesto: string
          empresa_id: string
          id?: string
          nombre: string
          tarifa_porcentaje: number
        }
        Update: {
          activo?: boolean
          codigo_impuesto?: string
          empresa_id?: string
          id?: string
          nombre?: string
          tarifa_porcentaje?: number
        }
        Relationships: [
          {
            foreignKeyName: "impuestos_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      industrias: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "industrias_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "industrias_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "industrias_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      inventario_lotes: {
        Row: {
          empresa_id: string
          fecha_fabricacion: string | null
          fecha_vencimiento: string | null
          id: string
          numero_lote_serie: string
          producto_id: string
        }
        Insert: {
          empresa_id: string
          fecha_fabricacion?: string | null
          fecha_vencimiento?: string | null
          id?: string
          numero_lote_serie: string
          producto_id: string
        }
        Update: {
          empresa_id?: string
          fecha_fabricacion?: string | null
          fecha_vencimiento?: string | null
          id?: string
          numero_lote_serie?: string
          producto_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "inventario_lotes_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      inventario_movimientos: {
        Row: {
          bodega_destino_id: string | null
          bodega_origen_id: string | null
          cantidad: number
          created_at: string
          created_by: string | null
          documento_comercial_id: string
          empresa_id: string
          id: string
          lote_id: string | null
          producto_id: string
          tipo_movimiento: Database["public"]["Enums"]["tipo_movimiento_kardex_enum"]
          ubicacion_destino_id: string | null
          ubicacion_origen_id: string | null
        }
        Insert: {
          bodega_destino_id?: string | null
          bodega_origen_id?: string | null
          cantidad: number
          created_at?: string
          created_by?: string | null
          documento_comercial_id: string
          empresa_id: string
          id?: string
          lote_id?: string | null
          producto_id: string
          tipo_movimiento: Database["public"]["Enums"]["tipo_movimiento_kardex_enum"]
          ubicacion_destino_id?: string | null
          ubicacion_origen_id?: string | null
        }
        Update: {
          bodega_destino_id?: string | null
          bodega_origen_id?: string | null
          cantidad?: number
          created_at?: string
          created_by?: string | null
          documento_comercial_id?: string
          empresa_id?: string
          id?: string
          lote_id?: string | null
          producto_id?: string
          tipo_movimiento?: Database["public"]["Enums"]["tipo_movimiento_kardex_enum"]
          ubicacion_destino_id?: string | null
          ubicacion_origen_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "inventario_movimientos_empresa_id_bodega_destino_id_fkey"
            columns: ["empresa_id", "bodega_destino_id"]
            isOneToOne: false
            referencedRelation: "bodegas"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "inventario_movimientos_empresa_id_bodega_origen_id_fkey"
            columns: ["empresa_id", "bodega_origen_id"]
            isOneToOne: false
            referencedRelation: "bodegas"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "inventario_movimientos_empresa_id_documento_comercial_id_fkey"
            columns: ["empresa_id", "documento_comercial_id"]
            isOneToOne: false
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "inventario_movimientos_empresa_id_lote_id_fkey"
            columns: ["empresa_id", "lote_id"]
            isOneToOne: false
            referencedRelation: "inventario_lotes"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "inventario_movimientos_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "inventario_movimientos_empresa_id_ubicacion_destino_id_fkey"
            columns: ["empresa_id", "ubicacion_destino_id"]
            isOneToOne: false
            referencedRelation: "inventario_ubicaciones"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "inventario_movimientos_empresa_id_ubicacion_origen_id_fkey"
            columns: ["empresa_id", "ubicacion_origen_id"]
            isOneToOne: false
            referencedRelation: "inventario_ubicaciones"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      inventario_reservas: {
        Row: {
          cantidad: number
          created_at: string
          documento_comercial_id: string
          empresa_id: string
          estado: string
          id: string
          producto_id: string
        }
        Insert: {
          cantidad: number
          created_at?: string
          documento_comercial_id: string
          empresa_id: string
          estado?: string
          id?: string
          producto_id: string
        }
        Update: {
          cantidad?: number
          created_at?: string
          documento_comercial_id?: string
          empresa_id?: string
          estado?: string
          id?: string
          producto_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "inventario_reservas_empresa_id_documento_comercial_id_fkey"
            columns: ["empresa_id", "documento_comercial_id"]
            isOneToOne: false
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "inventario_reservas_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "inventario_reservas_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      inventario_saldos: {
        Row: {
          bodega_id: string
          empresa_id: string
          producto_id: string
          stock_fisico: number
          updated_at: string
        }
        Insert: {
          bodega_id: string
          empresa_id: string
          producto_id: string
          stock_fisico?: number
          updated_at?: string
        }
        Update: {
          bodega_id?: string
          empresa_id?: string
          producto_id?: string
          stock_fisico?: number
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "inventario_saldos_empresa_id_bodega_id_fkey"
            columns: ["empresa_id", "bodega_id"]
            isOneToOne: false
            referencedRelation: "bodegas"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "inventario_saldos_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      inventario_ubicaciones: {
        Row: {
          bodega_id: string
          codigo_ubicacion: string
          empresa_id: string
          id: string
        }
        Insert: {
          bodega_id: string
          codigo_ubicacion: string
          empresa_id: string
          id?: string
        }
        Update: {
          bodega_id?: string
          codigo_ubicacion?: string
          empresa_id?: string
          id?: string
        }
        Relationships: [
          {
            foreignKeyName: "inventario_ubicaciones_empresa_id_bodega_id_fkey"
            columns: ["empresa_id", "bodega_id"]
            isOneToOne: false
            referencedRelation: "bodegas"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      invitaciones: {
        Row: {
          accepted_at: string | null
          created_at: string
          email: string
          empresa_id: string
          estado: Database["public"]["Enums"]["estado_invitacion_enum"]
          fecha_expiracion: string
          id: string
          invitado_por: string
          rol: Database["public"]["Enums"]["rol_enum"]
          token: string
          updated_at: string
        }
        Insert: {
          accepted_at?: string | null
          created_at?: string
          email: string
          empresa_id: string
          estado?: Database["public"]["Enums"]["estado_invitacion_enum"]
          fecha_expiracion?: string
          id?: string
          invitado_por: string
          rol?: Database["public"]["Enums"]["rol_enum"]
          token?: string
          updated_at?: string
        }
        Update: {
          accepted_at?: string | null
          created_at?: string
          email?: string
          empresa_id?: string
          estado?: Database["public"]["Enums"]["estado_invitacion_enum"]
          fecha_expiracion?: string
          id?: string
          invitado_por?: string
          rol?: Database["public"]["Enums"]["rol_enum"]
          token?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "invitaciones_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "invitaciones_invitado_por_fkey"
            columns: ["invitado_por"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["id"]
          },
        ]
      }
      lineas_documento: {
        Row: {
          cantidad_procesada: number
          cantidad_solicitada: number
          cuenta_contable_id: string | null
          documento_id: string
          empresa_id: string
          id: string
          impuesto_id: string | null
          impuesto_monto: number
          impuesto_nombre_snapshot: string | null
          impuesto_tarifa_snapshot: number
          monto_descuento: number
          numero_linea: number
          precio_unitario: number
          producto_id: string
          subtotal_linea: number
          total_linea: number
        }
        Insert: {
          cantidad_procesada?: number
          cantidad_solicitada: number
          cuenta_contable_id?: string | null
          documento_id: string
          empresa_id: string
          id?: string
          impuesto_id?: string | null
          impuesto_monto?: number
          impuesto_nombre_snapshot?: string | null
          impuesto_tarifa_snapshot?: number
          monto_descuento?: number
          numero_linea: number
          precio_unitario: number
          producto_id: string
          subtotal_linea: number
          total_linea: number
        }
        Update: {
          cantidad_procesada?: number
          cantidad_solicitada?: number
          cuenta_contable_id?: string | null
          documento_id?: string
          empresa_id?: string
          id?: string
          impuesto_id?: string | null
          impuesto_monto?: number
          impuesto_nombre_snapshot?: string | null
          impuesto_tarifa_snapshot?: number
          monto_descuento?: number
          numero_linea?: number
          precio_unitario?: number
          producto_id?: string
          subtotal_linea?: number
          total_linea?: number
        }
        Relationships: [
          {
            foreignKeyName: "lineas_documento_empresa_id_cuenta_contable_id_fkey"
            columns: ["empresa_id", "cuenta_contable_id"]
            isOneToOne: false
            referencedRelation: "cuentas_contables"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "lineas_documento_empresa_id_documento_id_fkey"
            columns: ["empresa_id", "documento_id"]
            isOneToOne: false
            referencedRelation: "documentos_comerciales"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "lineas_documento_empresa_id_impuesto_id_fkey"
            columns: ["empresa_id", "impuesto_id"]
            isOneToOne: false
            referencedRelation: "impuestos"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "lineas_documento_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      listas_precios: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          moneda_codigo: string
          nombre: string
          prioridad: number
          tipo_cliente_id: string | null
          updated_at: string | null
          updated_by: string | null
          valida_desde: string
          valida_hasta: string | null
          zona_id: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          moneda_codigo: string
          nombre: string
          prioridad?: number
          tipo_cliente_id?: string | null
          updated_at?: string | null
          updated_by?: string | null
          valida_desde?: string
          valida_hasta?: string | null
          zona_id?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          moneda_codigo?: string
          nombre?: string
          prioridad?: number
          tipo_cliente_id?: string | null
          updated_at?: string | null
          updated_by?: string | null
          valida_desde?: string
          valida_hasta?: string | null
          zona_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "listas_precios_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "listas_precios_moneda_codigo_fkey"
            columns: ["moneda_codigo"]
            isOneToOne: false
            referencedRelation: "monedas"
            referencedColumns: ["codigo"]
          },
        ]
      }
      marcas: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "marcas_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      monedas: {
        Row: {
          codigo: string
          decimales: number
          nombre: string
          simbolo: string
        }
        Insert: {
          codigo: string
          decimales?: number
          nombre: string
          simbolo: string
        }
        Update: {
          codigo?: string
          decimales?: number
          nombre?: string
          simbolo?: string
        }
        Relationships: []
      }
      origenes_cliente: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "origenes_cliente_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "origenes_cliente_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "origenes_cliente_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      perfiles: {
        Row: {
          activo: boolean
          created_at: string
          deleted_at: string | null
          empresa_id: string | null
          id: string
          invitado_por: string | null
          nombre_completo: string | null
          rol: Database["public"]["Enums"]["rol_enum"]
          updated_at: string
        }
        Insert: {
          activo?: boolean
          created_at?: string
          deleted_at?: string | null
          empresa_id?: string | null
          id: string
          invitado_por?: string | null
          nombre_completo?: string | null
          rol?: Database["public"]["Enums"]["rol_enum"]
          updated_at?: string
        }
        Update: {
          activo?: boolean
          created_at?: string
          deleted_at?: string | null
          empresa_id?: string | null
          id?: string
          invitado_por?: string | null
          nombre_completo?: string | null
          rol?: Database["public"]["Enums"]["rol_enum"]
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "perfiles_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "perfiles_invitado_por_fkey"
            columns: ["invitado_por"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["id"]
          },
        ]
      }
      plan_configuracion: {
        Row: {
          caracteristica_id: string
          created_at: string
          id: string
          plan_id: string
          updated_at: string
          valor_bool: boolean | null
          valor_decimal: number | null
          valor_int: number | null
        }
        Insert: {
          caracteristica_id: string
          created_at?: string
          id?: string
          plan_id: string
          updated_at?: string
          valor_bool?: boolean | null
          valor_decimal?: number | null
          valor_int?: number | null
        }
        Update: {
          caracteristica_id?: string
          created_at?: string
          id?: string
          plan_id?: string
          updated_at?: string
          valor_bool?: boolean | null
          valor_decimal?: number | null
          valor_int?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "plan_configuracion_caracteristica_id_fkey"
            columns: ["caracteristica_id"]
            isOneToOne: false
            referencedRelation: "caracteristicas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "plan_configuracion_plan_id_fkey"
            columns: ["plan_id"]
            isOneToOne: false
            referencedRelation: "planes"
            referencedColumns: ["id"]
          },
        ]
      }
      planes: {
        Row: {
          created_at: string
          deleted_at: string | null
          id: string
          nivel_jerarquia: number
          nombre: string
          periodo_meses: number
          precio_base: number
          updated_at: string
        }
        Insert: {
          created_at?: string
          deleted_at?: string | null
          id?: string
          nivel_jerarquia?: number
          nombre: string
          periodo_meses?: number
          precio_base?: number
          updated_at?: string
        }
        Update: {
          created_at?: string
          deleted_at?: string | null
          id?: string
          nivel_jerarquia?: number
          nombre?: string
          periodo_meses?: number
          precio_base?: number
          updated_at?: string
        }
        Relationships: []
      }
      politicas_comerciales: {
        Row: {
          accion: Database["public"]["Enums"]["accion_politica_enum"]
          activo: boolean
          aplicar_a_categoria_id: string | null
          aplicar_a_cliente_id: string | null
          aplicar_a_producto_id: string | null
          aplicar_a_rol: string | null
          aplicar_a_tipo_cliente_id: string | null
          created_at: string
          deleted_at: string | null
          empresa_id: string
          id: string
          mensaje_advertencia: string | null
          nivel_evaluacion: Database["public"]["Enums"]["nivel_evaluacion_enum"]
          nombre: string
          prioridad: number
          roles_aprobadores: string[] | null
          tipo_politica: Database["public"]["Enums"]["tipo_politica_enum"]
          umbral_numerico: number
          updated_at: string
        }
        Insert: {
          accion?: Database["public"]["Enums"]["accion_politica_enum"]
          activo?: boolean
          aplicar_a_categoria_id?: string | null
          aplicar_a_cliente_id?: string | null
          aplicar_a_producto_id?: string | null
          aplicar_a_rol?: string | null
          aplicar_a_tipo_cliente_id?: string | null
          created_at?: string
          deleted_at?: string | null
          empresa_id: string
          id?: string
          mensaje_advertencia?: string | null
          nivel_evaluacion?: Database["public"]["Enums"]["nivel_evaluacion_enum"]
          nombre: string
          prioridad?: number
          roles_aprobadores?: string[] | null
          tipo_politica: Database["public"]["Enums"]["tipo_politica_enum"]
          umbral_numerico: number
          updated_at?: string
        }
        Update: {
          accion?: Database["public"]["Enums"]["accion_politica_enum"]
          activo?: boolean
          aplicar_a_categoria_id?: string | null
          aplicar_a_cliente_id?: string | null
          aplicar_a_producto_id?: string | null
          aplicar_a_rol?: string | null
          aplicar_a_tipo_cliente_id?: string | null
          created_at?: string
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          mensaje_advertencia?: string | null
          nivel_evaluacion?: Database["public"]["Enums"]["nivel_evaluacion_enum"]
          nombre?: string
          prioridad?: number
          roles_aprobadores?: string[] | null
          tipo_politica?: Database["public"]["Enums"]["tipo_politica_enum"]
          umbral_numerico?: number
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "politicas_comerciales_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      precio_escalas: {
        Row: {
          cantidad_minima: number
          empresa_id: string
          id: string
          precio_producto_id: string
          precio_unitario: number
        }
        Insert: {
          cantidad_minima: number
          empresa_id: string
          id?: string
          precio_producto_id: string
          precio_unitario: number
        }
        Update: {
          cantidad_minima?: number
          empresa_id?: string
          id?: string
          precio_producto_id?: string
          precio_unitario?: number
        }
        Relationships: [
          {
            foreignKeyName: "precio_escalas_empresa_id_precio_producto_id_fkey"
            columns: ["empresa_id", "precio_producto_id"]
            isOneToOne: false
            referencedRelation: "precios_producto"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      precios_producto: {
        Row: {
          created_at: string
          created_by: string | null
          descuento_max_permitido: number | null
          empresa_id: string
          id: string
          lista_precio_id: string
          precio_base: number
          producto_id: string
          valida_desde: string
          valida_hasta: string | null
        }
        Insert: {
          created_at?: string
          created_by?: string | null
          descuento_max_permitido?: number | null
          empresa_id: string
          id?: string
          lista_precio_id: string
          precio_base: number
          producto_id: string
          valida_desde?: string
          valida_hasta?: string | null
        }
        Update: {
          created_at?: string
          created_by?: string | null
          descuento_max_permitido?: number | null
          empresa_id?: string
          id?: string
          lista_precio_id?: string
          precio_base?: number
          producto_id?: string
          valida_desde?: string
          valida_hasta?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "precios_producto_empresa_id_lista_precio_id_fkey"
            columns: ["empresa_id", "lista_precio_id"]
            isOneToOne: false
            referencedRelation: "listas_precios"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "precios_producto_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_atributos_valores: {
        Row: {
          atributo_id: string
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          producto_id: string
          updated_at: string | null
          updated_by: string | null
          valor_booleano: boolean | null
          valor_fecha: string | null
          valor_numero: number | null
          valor_texto: string | null
        }
        Insert: {
          atributo_id: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          producto_id: string
          updated_at?: string | null
          updated_by?: string | null
          valor_booleano?: boolean | null
          valor_fecha?: string | null
          valor_numero?: number | null
          valor_texto?: string | null
        }
        Update: {
          atributo_id?: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          producto_id?: string
          updated_at?: string | null
          updated_by?: string | null
          valor_booleano?: boolean | null
          valor_fecha?: string | null
          valor_numero?: number | null
          valor_texto?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "producto_atributos_valores_empresa_id_atributo_id_fkey"
            columns: ["empresa_id", "atributo_id"]
            isOneToOne: false
            referencedRelation: "atributos_catalogo"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "producto_atributos_valores_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_codigos_oficiales: {
        Row: {
          catalogo_oficial_id: string
          empresa_id: string
          producto_id: string
        }
        Insert: {
          catalogo_oficial_id: string
          empresa_id: string
          producto_id: string
        }
        Update: {
          catalogo_oficial_id?: string
          empresa_id?: string
          producto_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "producto_codigos_oficiales_catalogo_oficial_id_fkey"
            columns: ["catalogo_oficial_id"]
            isOneToOne: false
            referencedRelation: "catalogos_oficiales"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "producto_codigos_oficiales_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_compatibilidades: {
        Row: {
          contexto_compatibilidad: string
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          producto_id: string
          updated_at: string | null
          updated_by: string | null
          valor_compatibilidad: string
        }
        Insert: {
          contexto_compatibilidad: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          producto_id: string
          updated_at?: string | null
          updated_by?: string | null
          valor_compatibilidad: string
        }
        Update: {
          contexto_compatibilidad?: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          producto_id?: string
          updated_at?: string | null
          updated_by?: string | null
          valor_compatibilidad?: string
        }
        Relationships: [
          {
            foreignKeyName: "producto_compatibilidades_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_componentes: {
        Row: {
          cantidad: number
          created_at: string
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          orden_visualizacion: number | null
          producto_hijo_id: string
          producto_padre_id: string
          regla_seleccion: Database["public"]["Enums"]["regla_seleccion_bom_enum"]
          updated_at: string | null
          updated_by: string | null
          valida_desde: string
          valida_hasta: string | null
        }
        Insert: {
          cantidad: number
          created_at?: string
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          orden_visualizacion?: number | null
          producto_hijo_id: string
          producto_padre_id: string
          regla_seleccion?: Database["public"]["Enums"]["regla_seleccion_bom_enum"]
          updated_at?: string | null
          updated_by?: string | null
          valida_desde?: string
          valida_hasta?: string | null
        }
        Update: {
          cantidad?: number
          created_at?: string
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          orden_visualizacion?: number | null
          producto_hijo_id?: string
          producto_padre_id?: string
          regla_seleccion?: Database["public"]["Enums"]["regla_seleccion_bom_enum"]
          updated_at?: string | null
          updated_by?: string | null
          valida_desde?: string
          valida_hasta?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "producto_componentes_empresa_id_producto_hijo_id_fkey"
            columns: ["empresa_id", "producto_hijo_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "producto_componentes_empresa_id_producto_padre_id_fkey"
            columns: ["empresa_id", "producto_padre_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_embeddings: {
        Row: {
          empresa_id: string
          modelo_embedding: string
          producto_id: string
          vector_data: string
          version_modelo: string
        }
        Insert: {
          empresa_id: string
          modelo_embedding?: string
          producto_id: string
          vector_data: string
          version_modelo?: string
        }
        Update: {
          empresa_id?: string
          modelo_embedding?: string
          producto_id?: string
          vector_data?: string
          version_modelo?: string
        }
        Relationships: [
          {
            foreignKeyName: "producto_embeddings_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: true
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_proveedores: {
        Row: {
          cantidad_minima_orden: number
          codigo_proveedor: string | null
          costo_catalogo: number
          created_at: string
          empresa_id: string
          es_principal: boolean
          fecha_ultima_cotizacion: string | null
          moneda_codigo: string
          producto_id: string
          proveedor_id: string
          tiempo_entrega_dias: number | null
          updated_at: string
        }
        Insert: {
          cantidad_minima_orden?: number
          codigo_proveedor?: string | null
          costo_catalogo?: number
          created_at?: string
          empresa_id: string
          es_principal?: boolean
          fecha_ultima_cotizacion?: string | null
          moneda_codigo?: string
          producto_id: string
          proveedor_id: string
          tiempo_entrega_dias?: number | null
          updated_at?: string
        }
        Update: {
          cantidad_minima_orden?: number
          codigo_proveedor?: string | null
          costo_catalogo?: number
          created_at?: string
          empresa_id?: string
          es_principal?: boolean
          fecha_ultima_cotizacion?: string | null
          moneda_codigo?: string
          producto_id?: string
          proveedor_id?: string
          tiempo_entrega_dias?: number | null
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "fk_prod_prov_empresa"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_prod_prov_moneda"
            columns: ["moneda_codigo"]
            isOneToOne: false
            referencedRelation: "monedas"
            referencedColumns: ["codigo"]
          },
          {
            foreignKeyName: "fk_prod_prov_producto"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "fk_prod_prov_proveedor"
            columns: ["empresa_id", "proveedor_id"]
            isOneToOne: false
            referencedRelation: "proveedores"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_recursos: {
        Row: {
          empresa_id: string
          id: string
          nombre_archivo: string
          producto_id: string
          tipo: Database["public"]["Enums"]["tipo_recurso_enum"]
          url_acceso: string
        }
        Insert: {
          empresa_id: string
          id?: string
          nombre_archivo: string
          producto_id: string
          tipo: Database["public"]["Enums"]["tipo_recurso_enum"]
          url_acceso: string
        }
        Update: {
          empresa_id?: string
          id?: string
          nombre_archivo?: string
          producto_id?: string
          tipo?: Database["public"]["Enums"]["tipo_recurso_enum"]
          url_acceso?: string
        }
        Relationships: [
          {
            foreignKeyName: "producto_recursos_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_relaciones: {
        Row: {
          created_at: string
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          producto_destino_id: string
          producto_origen_id: string
          tipo_relacion: Database["public"]["Enums"]["tipo_relacion_producto_enum"]
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          created_at?: string
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          producto_destino_id: string
          producto_origen_id: string
          tipo_relacion: Database["public"]["Enums"]["tipo_relacion_producto_enum"]
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          created_at?: string
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          producto_destino_id?: string
          producto_origen_id?: string
          tipo_relacion?: Database["public"]["Enums"]["tipo_relacion_producto_enum"]
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "producto_relaciones_empresa_id_producto_destino_id_fkey"
            columns: ["empresa_id", "producto_destino_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "producto_relaciones_empresa_id_producto_origen_id_fkey"
            columns: ["empresa_id", "producto_origen_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      producto_search_index: {
        Row: {
          empresa_id: string
          producto_id: string
          search_document: string
          updated_at: string | null
        }
        Insert: {
          empresa_id: string
          producto_id: string
          search_document: string
          updated_at?: string | null
        }
        Update: {
          empresa_id?: string
          producto_id?: string
          search_document?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "producto_search_index_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: true
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      productos: {
        Row: {
          activo: boolean
          atributos_variante: Json | null
          categoria_id: string | null
          codigo_barras: string | null
          codigo_fabricante: string | null
          codigo_sku: string | null
          codigos_clasificacion: Json
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          descripcion_corta: string | null
          descripcion_larga: string | null
          empresa_id: string
          es_vendible: boolean
          grupo_fiscal_id: string | null
          id: string
          marca_id: string | null
          nombre: string
          permite_descuento: boolean
          producto_padre_id: string | null
          tipo_producto: Database["public"]["Enums"]["tipo_producto_enum"]
          unidad_medida_id: string
          updated_at: string | null
          updated_by: string | null
          variant_key: string | null
        }
        Insert: {
          activo?: boolean
          atributos_variante?: Json | null
          categoria_id?: string | null
          codigo_barras?: string | null
          codigo_fabricante?: string | null
          codigo_sku?: string | null
          codigos_clasificacion?: Json
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          descripcion_corta?: string | null
          descripcion_larga?: string | null
          empresa_id: string
          es_vendible?: boolean
          grupo_fiscal_id?: string | null
          id?: string
          marca_id?: string | null
          nombre: string
          permite_descuento?: boolean
          producto_padre_id?: string | null
          tipo_producto?: Database["public"]["Enums"]["tipo_producto_enum"]
          unidad_medida_id: string
          updated_at?: string | null
          updated_by?: string | null
          variant_key?: string | null
        }
        Update: {
          activo?: boolean
          atributos_variante?: Json | null
          categoria_id?: string | null
          codigo_barras?: string | null
          codigo_fabricante?: string | null
          codigo_sku?: string | null
          codigos_clasificacion?: Json
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          descripcion_corta?: string | null
          descripcion_larga?: string | null
          empresa_id?: string
          es_vendible?: boolean
          grupo_fiscal_id?: string | null
          id?: string
          marca_id?: string | null
          nombre?: string
          permite_descuento?: boolean
          producto_padre_id?: string | null
          tipo_producto?: Database["public"]["Enums"]["tipo_producto_enum"]
          unidad_medida_id?: string
          updated_at?: string | null
          updated_by?: string | null
          variant_key?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "productos_empresa_id_categoria_id_fkey"
            columns: ["empresa_id", "categoria_id"]
            isOneToOne: false
            referencedRelation: "categorias_producto"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "productos_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "productos_empresa_id_grupo_fiscal_id_fkey"
            columns: ["empresa_id", "grupo_fiscal_id"]
            isOneToOne: false
            referencedRelation: "grupos_fiscales"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "productos_empresa_id_marca_id_fkey"
            columns: ["empresa_id", "marca_id"]
            isOneToOne: false
            referencedRelation: "marcas"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "productos_empresa_id_producto_padre_id_fkey"
            columns: ["empresa_id", "producto_padre_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "productos_empresa_id_unidad_medida_id_fkey"
            columns: ["empresa_id", "unidad_medida_id"]
            isOneToOne: false
            referencedRelation: "unidades_medida"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      productos_fisicos: {
        Row: {
          controla_inventario: boolean
          empresa_id: string
          peso_kg: number | null
          producto_id: string
          punto_reorden: number | null
          stock_minimo: number | null
          volumen_m3: number | null
        }
        Insert: {
          controla_inventario?: boolean
          empresa_id: string
          peso_kg?: number | null
          producto_id: string
          punto_reorden?: number | null
          stock_minimo?: number | null
          volumen_m3?: number | null
        }
        Update: {
          controla_inventario?: boolean
          empresa_id?: string
          peso_kg?: number | null
          producto_id?: string
          punto_reorden?: number | null
          stock_minimo?: number | null
          volumen_m3?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "productos_fisicos_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: true
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      productos_servicios: {
        Row: {
          empresa_id: string
          horas_estimadas: number | null
          perfiles_requeridos: string[] | null
          producto_id: string
        }
        Insert: {
          empresa_id: string
          horas_estimadas?: number | null
          perfiles_requeridos?: string[] | null
          producto_id: string
        }
        Update: {
          empresa_id?: string
          horas_estimadas?: number | null
          perfiles_requeridos?: string[] | null
          producto_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "productos_servicios_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: true
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      productos_suscripciones: {
        Row: {
          ciclo_facturacion: Database["public"]["Enums"]["facturacion_ciclo_enum"]
          empresa_id: string
          limite_consumo: number | null
          producto_id: string
          renovacion_automatica: boolean
        }
        Insert: {
          ciclo_facturacion?: Database["public"]["Enums"]["facturacion_ciclo_enum"]
          empresa_id: string
          limite_consumo?: number | null
          producto_id: string
          renovacion_automatica?: boolean
        }
        Update: {
          ciclo_facturacion?: Database["public"]["Enums"]["facturacion_ciclo_enum"]
          empresa_id?: string
          limite_consumo?: number | null
          producto_id?: string
          renovacion_automatica?: boolean
        }
        Relationships: [
          {
            foreignKeyName: "productos_suscripciones_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: true
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      proveedores: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          identificacion_fiscal: string | null
          nombre_comercial: string
          razon_social: string | null
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          identificacion_fiscal?: string | null
          nombre_comercial: string
          razon_social?: string | null
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          identificacion_fiscal?: string | null
          nombre_comercial?: string
          razon_social?: string | null
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "proveedores_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      recurso_chunks: {
        Row: {
          contenido_texto: string
          empresa_id: string
          id: string
          modelo_embedding: string
          recurso_id: string
          vector_data: string
          version_modelo: string
        }
        Insert: {
          contenido_texto: string
          empresa_id: string
          id?: string
          modelo_embedding?: string
          recurso_id: string
          vector_data: string
          version_modelo?: string
        }
        Update: {
          contenido_texto?: string
          empresa_id?: string
          id?: string
          modelo_embedding?: string
          recurso_id?: string
          vector_data?: string
          version_modelo?: string
        }
        Relationships: [
          {
            foreignKeyName: "recurso_chunks_empresa_id_recurso_id_fkey"
            columns: ["empresa_id", "recurso_id"]
            isOneToOne: false
            referencedRelation: "producto_recursos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      saas_planes: {
        Row: {
          id: string
          limite_productos: number
          limite_usuarios: number
          modulos_activos: Json
          nombre: string
          precio_mensual: number
        }
        Insert: {
          id?: string
          limite_productos?: number
          limite_usuarios?: number
          modulos_activos?: Json
          nombre: string
          precio_mensual: number
        }
        Update: {
          id?: string
          limite_productos?: number
          limite_usuarios?: number
          modulos_activos?: Json
          nombre?: string
          precio_mensual?: number
        }
        Relationships: []
      }
      search_reindex_queue: {
        Row: {
          created_at: string
          empresa_id: string
          estado: Database["public"]["Enums"]["estado_indexacion_enum"]
          id: string
          intentos: number
          producto_id: string
          ultimo_error: string | null
          updated_at: string
        }
        Insert: {
          created_at?: string
          empresa_id: string
          estado?: Database["public"]["Enums"]["estado_indexacion_enum"]
          id?: string
          intentos?: number
          producto_id: string
          ultimo_error?: string | null
          updated_at?: string
        }
        Update: {
          created_at?: string
          empresa_id?: string
          estado?: Database["public"]["Enums"]["estado_indexacion_enum"]
          id?: string
          intentos?: number
          producto_id?: string
          ultimo_error?: string | null
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "search_reindex_queue_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "search_reindex_queue_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      sistema_eventos_bus: {
        Row: {
          created_at: string
          empresa_id: string
          error_log: string | null
          estado: Database["public"]["Enums"]["estado_evento_enum"]
          id: string
          idempotency_key: string | null
          intentos: number
          payload: Json
          procesado_at: string | null
          proximo_reintento: string | null
          topico: string
        }
        Insert: {
          created_at?: string
          empresa_id: string
          error_log?: string | null
          estado?: Database["public"]["Enums"]["estado_evento_enum"]
          id?: string
          idempotency_key?: string | null
          intentos?: number
          payload: Json
          procesado_at?: string | null
          proximo_reintento?: string | null
          topico: string
        }
        Update: {
          created_at?: string
          empresa_id?: string
          error_log?: string | null
          estado?: Database["public"]["Enums"]["estado_evento_enum"]
          id?: string
          idempotency_key?: string | null
          intentos?: number
          payload?: Json
          procesado_at?: string | null
          proximo_reintento?: string | null
          topico?: string
        }
        Relationships: [
          {
            foreignKeyName: "sistema_eventos_bus_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      sistema_observabilidad_logs: {
        Row: {
          created_at: string
          detalles_json: Json | null
          empresa_id: string | null
          id: string
          mensaje: string
          nivel: string
          origen: string
        }
        Insert: {
          created_at?: string
          detalles_json?: Json | null
          empresa_id?: string | null
          id?: string
          mensaje: string
          nivel?: string
          origen: string
        }
        Update: {
          created_at?: string
          detalles_json?: Json | null
          empresa_id?: string | null
          id?: string
          mensaje?: string
          nivel?: string
          origen?: string
        }
        Relationships: [
          {
            foreignKeyName: "sistema_observabilidad_logs_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      suscripciones: {
        Row: {
          created_at: string
          deleted_at: string | null
          empresa_id: string
          es_activa_actual: boolean
          estado: Database["public"]["Enums"]["suscripcion_estado_enum"]
          fecha_fin: string
          fecha_inicio: string
          id: string
          plan_id: string
          proveedor_pago: string | null
          referencia_pago: string | null
          renovacion_automatica: boolean
          tipo_suscripcion: Database["public"]["Enums"]["suscripcion_tipo_enum"]
          updated_at: string
        }
        Insert: {
          created_at?: string
          deleted_at?: string | null
          empresa_id: string
          es_activa_actual?: boolean
          estado?: Database["public"]["Enums"]["suscripcion_estado_enum"]
          fecha_fin: string
          fecha_inicio?: string
          id?: string
          plan_id: string
          proveedor_pago?: string | null
          referencia_pago?: string | null
          renovacion_automatica?: boolean
          tipo_suscripcion?: Database["public"]["Enums"]["suscripcion_tipo_enum"]
          updated_at?: string
        }
        Update: {
          created_at?: string
          deleted_at?: string | null
          empresa_id?: string
          es_activa_actual?: boolean
          estado?: Database["public"]["Enums"]["suscripcion_estado_enum"]
          fecha_fin?: string
          fecha_inicio?: string
          id?: string
          plan_id?: string
          proveedor_pago?: string | null
          referencia_pago?: string | null
          renovacion_automatica?: boolean
          tipo_suscripcion?: Database["public"]["Enums"]["suscripcion_tipo_enum"]
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "suscripciones_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "suscripciones_plan_id_fkey"
            columns: ["plan_id"]
            isOneToOne: false
            referencedRelation: "planes"
            referencedColumns: ["id"]
          },
        ]
      }
      tags: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "tags_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "tags_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "tags_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      tenant_ia_limits: {
        Row: {
          bloqueado_por_limite: boolean
          empresa_id: string
          max_costo_usd_mes: number
          max_requests_mes: number
        }
        Insert: {
          bloqueado_por_limite?: boolean
          empresa_id: string
          max_costo_usd_mes?: number
          max_requests_mes?: number
        }
        Update: {
          bloqueado_por_limite?: boolean
          empresa_id?: string
          max_costo_usd_mes?: number
          max_requests_mes?: number
        }
        Relationships: [
          {
            foreignKeyName: "tenant_ia_limits_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: true
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      tenant_ia_usage: {
        Row: {
          costo_usd: number | null
          empresa_id: string
          mes: string
          requests: number | null
        }
        Insert: {
          costo_usd?: number | null
          empresa_id: string
          mes: string
          requests?: number | null
        }
        Update: {
          costo_usd?: number | null
          empresa_id?: string
          mes?: string
          requests?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "tenant_ia_usage_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      tenant_usage: {
        Row: {
          caracteristica_id: string
          consumo_acumulado: number
          empresa_id: string
          id: string
          periodo_fin: string
          periodo_inicio: string
          suscripcion_id: string
          updated_at: string
        }
        Insert: {
          caracteristica_id: string
          consumo_acumulado?: number
          empresa_id: string
          id?: string
          periodo_fin: string
          periodo_inicio: string
          suscripcion_id: string
          updated_at?: string
        }
        Update: {
          caracteristica_id?: string
          consumo_acumulado?: number
          empresa_id?: string
          id?: string
          periodo_fin?: string
          periodo_inicio?: string
          suscripcion_id?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "tenant_usage_caracteristica_id_fkey"
            columns: ["caracteristica_id"]
            isOneToOne: false
            referencedRelation: "caracteristicas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "tenant_usage_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "tenant_usage_suscripcion_id_fkey"
            columns: ["suscripcion_id"]
            isOneToOne: false
            referencedRelation: "suscripciones"
            referencedColumns: ["id"]
          },
        ]
      }
      tipos_cambio_historico: {
        Row: {
          empresa_id: string
          id: string
          moneda_destino: string
          moneda_origen: string
          tasa_cambio: number
          valida_desde: string
          valida_hasta: string | null
        }
        Insert: {
          empresa_id: string
          id?: string
          moneda_destino: string
          moneda_origen: string
          tasa_cambio: number
          valida_desde?: string
          valida_hasta?: string | null
        }
        Update: {
          empresa_id?: string
          id?: string
          moneda_destino?: string
          moneda_origen?: string
          tasa_cambio?: number
          valida_desde?: string
          valida_hasta?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "tipos_cambio_historico_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "tipos_cambio_historico_moneda_destino_fkey"
            columns: ["moneda_destino"]
            isOneToOne: false
            referencedRelation: "monedas"
            referencedColumns: ["codigo"]
          },
          {
            foreignKeyName: "tipos_cambio_historico_moneda_origen_fkey"
            columns: ["moneda_origen"]
            isOneToOne: false
            referencedRelation: "monedas"
            referencedColumns: ["codigo"]
          },
        ]
      }
      tipos_cliente: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "tipos_cliente_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "tipos_cliente_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "tipos_cliente_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
      tipos_identificacion: {
        Row: {
          codigo: string
          nombre: string
          pais_codigo: string | null
        }
        Insert: {
          codigo: string
          nombre: string
          pais_codigo?: string | null
        }
        Update: {
          codigo?: string
          nombre?: string
          pais_codigo?: string | null
        }
        Relationships: []
      }
      unidades_medida: {
        Row: {
          activo: boolean
          codigo: string
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          permite_fracciones: boolean
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          codigo: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          permite_fracciones?: boolean
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          codigo?: string
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          permite_fracciones?: boolean
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "unidades_medida_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      workflow_transiciones: {
        Row: {
          empresa_id: string
          estado_destino: Database["public"]["Enums"]["estado_operativo_enum"]
          estado_origen: Database["public"]["Enums"]["estado_operativo_enum"]
          id: string
          rol_requerido: string | null
          tipo_documento: Database["public"]["Enums"]["tipo_documento_comercial_enum"]
        }
        Insert: {
          empresa_id: string
          estado_destino: Database["public"]["Enums"]["estado_operativo_enum"]
          estado_origen: Database["public"]["Enums"]["estado_operativo_enum"]
          id?: string
          rol_requerido?: string | null
          tipo_documento: Database["public"]["Enums"]["tipo_documento_comercial_enum"]
        }
        Update: {
          empresa_id?: string
          estado_destino?: Database["public"]["Enums"]["estado_operativo_enum"]
          estado_origen?: Database["public"]["Enums"]["estado_operativo_enum"]
          id?: string
          rol_requerido?: string | null
          tipo_documento?: Database["public"]["Enums"]["tipo_documento_comercial_enum"]
        }
        Relationships: [
          {
            foreignKeyName: "workflow_transiciones_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
        ]
      }
      zonas: {
        Row: {
          activo: boolean
          created_at: string | null
          created_by: string | null
          deleted_at: string | null
          empresa_id: string
          id: string
          nombre: string
          updated_at: string | null
          updated_by: string | null
        }
        Insert: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id: string
          id?: string
          nombre: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Update: {
          activo?: boolean
          created_at?: string | null
          created_by?: string | null
          deleted_at?: string | null
          empresa_id?: string
          id?: string
          nombre?: string
          updated_at?: string | null
          updated_by?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "zonas_empresa_id_created_by_fkey"
            columns: ["empresa_id", "created_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
          {
            foreignKeyName: "zonas_empresa_id_fkey"
            columns: ["empresa_id"]
            isOneToOne: false
            referencedRelation: "empresas"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "zonas_empresa_id_updated_by_fkey"
            columns: ["empresa_id", "updated_by"]
            isOneToOne: false
            referencedRelation: "perfiles"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
    }
    Views: {
      vw_inventario_disponibilidad: {
        Row: {
          empresa_id: string | null
          producto_id: string | null
          stock_bloqueado: number | null
          stock_disponible: number | null
          stock_reservado: number | null
          stock_total_fisico: number | null
        }
        Relationships: [
          {
            foreignKeyName: "inventario_saldos_empresa_id_producto_id_fkey"
            columns: ["empresa_id", "producto_id"]
            isOneToOne: false
            referencedRelation: "productos"
            referencedColumns: ["empresa_id", "id"]
          },
        ]
      }
    }
    Functions: {
      aceptar_invitacion: { Args: { p_token: string }; Returns: boolean }
      cambiar_estado_usuario: {
        Args: { p_nuevo_estado: boolean; p_target_id: string }
        Returns: undefined
      }
      cambiar_rol_usuario: {
        Args: {
          p_nuevo_rol: Database["public"]["Enums"]["rol_enum"]
          p_target_id: string
        }
        Returns: undefined
      }
      cancelar_invitacion: {
        Args: { p_invitacion_id: string }
        Returns: undefined
      }
      crear_empresa_y_owner: {
        Args: {
          p_iva_default: number
          p_moneda_base: string
          p_nombre_comercial: string
          p_nombre_completo: string
          p_plan_nombre: string
        }
        Returns: string
      }
      fn_get_auth_role: { Args: never; Returns: string }
      fn_get_auth_tenant: { Args: never; Returns: string }
      fn_tenant_bloqueado: { Args: never; Returns: boolean }
      invitar_usuario: {
        Args: {
          p_email: string
          p_rol: Database["public"]["Enums"]["rol_enum"]
        }
        Returns: string
      }
      obtener_equipo: {
        Args: never
        Returns: {
          activo: boolean
          email: string
          id: string
          nombre_completo: string
          rol: Database["public"]["Enums"]["rol_enum"]
        }[]
      }
      promover_a_owner: { Args: { p_target_id: string }; Returns: undefined }
      show_limit: { Args: never; Returns: number }
      show_trgm: { Args: { "": string }; Returns: string[] }
      sp_crear_nueva_version_cotizacion: {
        Args: {
          p_cotizacion_id: string
          p_empresa_id: string
          p_usuario_id: string
        }
        Returns: string
      }
      sp_generar_clave_hacienda_cr: {
        Args: {
          p_codigo_seguridad: string
          p_consecutivo_20: string
          p_fecha: string
          p_identificacion_emisor: string
          p_situacion_comprobante: string
          p_tipo_id_emisor: string
        }
        Returns: string
      }
      sp_obtener_siguiente_consecutivo: {
        Args: { p_empresa_id: string; p_serie_id: string }
        Returns: string
      }
    }
    Enums: {
      accion_politica_enum: "advertir" | "solicitar_aprobacion" | "bloquear"
      atributo_tipo_dato_enum:
        | "texto"
        | "numero"
        | "booleano"
        | "fecha"
        | "lista"
      caracteristica_data_type: "int" | "bool" | "decimal"
      cr_estado_aceptacion_enum:
        | "pendiente"
        | "aceptado"
        | "aceptado_parcial"
        | "rechazado"
      cr_estado_hacienda_enum:
        | "no_aplica"
        | "borrador"
        | "generada"
        | "enviada_hacienda"
        | "procesando"
        | "aceptada"
        | "rechazada"
        | "error_envio"
      empresa_estado_enum: "activa" | "trial" | "suspendida" | "inactiva"
      estado_aprobacion_enum:
        | "pendiente"
        | "aprobada"
        | "rechazada"
        | "cancelada"
      estado_comercial_enum: "prospecto" | "activo" | "inactivo" | "perdido"
      estado_cotizacion_enum:
        | "borrador"
        | "pendiente_aprobacion"
        | "aprobada"
        | "rechazada_internamente"
        | "enviada"
        | "aceptada_cliente"
        | "rechazada_cliente"
        | "expirada"
        | "version_obsoleta"
      estado_evento_enum:
        | "pendiente"
        | "procesando"
        | "completado"
        | "fallido"
        | "dead_letter"
      estado_indexacion_enum:
        | "pendiente"
        | "procesando"
        | "completado"
        | "error"
      estado_invitacion_enum:
        | "pendiente"
        | "aceptada"
        | "expirada"
        | "cancelada"
      estado_operativo_enum:
        | "borrador"
        | "emitida"
        | "parcial"
        | "completada"
        | "pagada"
        | "anulada"
      estado_pago_enum: "aplicado" | "revertido"
      evento_cotizacion_enum:
        | "CREADA"
        | "EDITADA"
        | "ESTADO_CAMBIADO"
        | "LINEA_AGREGADA"
        | "LINEA_MODIFICADA"
        | "LINEA_ELIMINADA"
        | "APROBACION_SOLICITADA"
        | "APROBACION_RESUELTA"
        | "NUEVA_VERSION"
        | "CLONADA"
      evento_finanzas_enum:
        | "DOCUMENTO_CREADO"
        | "ESTADO_CAMBIADO"
        | "DOCUMENTO_ANULADO"
        | "PAGO_REGISTRADO"
        | "PAGO_MODIFICADO"
        | "PAGO_ELIMINADO"
      facturacion_ciclo_enum:
        | "unica"
        | "mensual"
        | "trimestral"
        | "semestral"
        | "anual"
      giro_comercial_enum:
        | "tecnologia_software"
        | "servicios_profesionales"
        | "construccion_ingenieria"
        | "maquinaria_repuestos"
        | "salud_equipamiento"
        | "retail_comercio"
        | "manufactura"
        | "otro"
      nivel_evaluacion_enum: "linea" | "documento"
      regla_seleccion_bom_enum:
        | "requerido"
        | "opcional"
        | "mutuamente_exclusivo"
      rol_enum: "owner" | "admin" | "seller" | "viewer"
      suscripcion_estado_enum: "activa" | "cancelada" | "vencida" | "suspendida"
      suscripcion_tipo_enum: "trial" | "pago" | "gratuito"
      tipo_bodega_enum:
        | "disponible"
        | "reservada"
        | "cuarentena"
        | "obsoleta_merma"
      tipo_catalogo_oficial_enum:
        | "cabys"
        | "sat"
        | "unspsc"
        | "hs_code"
        | "otro"
      tipo_costo_enum:
        | "estandar"
        | "promedio"
        | "reposicion"
        | "ultimo"
        | "historico"
      tipo_direccion_enum: "fiscal" | "despacho" | "cobro" | "sucursal" | "otra"
      tipo_documento_comercial_enum:
        | "pedido_venta"
        | "factura_venta"
        | "orden_compra"
        | "factura_compra"
        | "nota_credito"
        | "nota_debito"
        | "tiquete_electronico"
        | "factura_exportacion"
      tipo_movimiento_kardex_enum:
        | "COMPRA_INGRESO"
        | "VENTA_SALIDA"
        | "RESERVA_COMPROMISO"
        | "RESERVA_LIBERACION"
        | "DEVOLUCION_CLIENTE"
        | "DEVOLUCION_PROVEEDOR"
        | "AJUSTE_INVENTARIO"
      tipo_politica_enum:
        | "margen_minimo"
        | "margen_objetivo"
        | "descuento_maximo"
        | "precio_minimo"
        | "monto_maximo_documento"
        | "vigencia_maxima_dias"
        | "venta_bajo_costo"
        | "descuento_total_maximo"
        | "utilidad_absoluta_minima"
      tipo_producto_enum: "fisico" | "servicio" | "suscripcion"
      tipo_recurso_enum:
        | "imagen"
        | "pdf"
        | "manual"
        | "ficha_tecnica"
        | "video"
        | "enlace"
      tipo_regla_cpq_enum:
        | "inclusion_obligatoria"
        | "exclusion_mutua"
        | "cantidad_minima"
        | "cantidad_maxima"
        | "restriccion_atributo"
      tipo_relacion_producto_enum:
        | "cross_sell"
        | "up_sell"
        | "sustituto"
        | "accesorio"
        | "compatibilidad"
      tipo_transaccion_cxc_enum:
        | "abono"
        | "adelanto"
        | "aplicacion_nota_credito"
        | "retencion_impuesto"
      tipo_transaccion_cxp_enum:
        | "abono"
        | "aplicacion_nota_credito_proveedor"
        | "nota_debito_proveedor"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  graphql_public: {
    Enums: {},
  },
  public: {
    Enums: {
      accion_politica_enum: ["advertir", "solicitar_aprobacion", "bloquear"],
      atributo_tipo_dato_enum: [
        "texto",
        "numero",
        "booleano",
        "fecha",
        "lista",
      ],
      caracteristica_data_type: ["int", "bool", "decimal"],
      cr_estado_aceptacion_enum: [
        "pendiente",
        "aceptado",
        "aceptado_parcial",
        "rechazado",
      ],
      cr_estado_hacienda_enum: [
        "no_aplica",
        "borrador",
        "generada",
        "enviada_hacienda",
        "procesando",
        "aceptada",
        "rechazada",
        "error_envio",
      ],
      empresa_estado_enum: ["activa", "trial", "suspendida", "inactiva"],
      estado_aprobacion_enum: [
        "pendiente",
        "aprobada",
        "rechazada",
        "cancelada",
      ],
      estado_comercial_enum: ["prospecto", "activo", "inactivo", "perdido"],
      estado_cotizacion_enum: [
        "borrador",
        "pendiente_aprobacion",
        "aprobada",
        "rechazada_internamente",
        "enviada",
        "aceptada_cliente",
        "rechazada_cliente",
        "expirada",
        "version_obsoleta",
      ],
      estado_evento_enum: [
        "pendiente",
        "procesando",
        "completado",
        "fallido",
        "dead_letter",
      ],
      estado_indexacion_enum: [
        "pendiente",
        "procesando",
        "completado",
        "error",
      ],
      estado_invitacion_enum: [
        "pendiente",
        "aceptada",
        "expirada",
        "cancelada",
      ],
      estado_operativo_enum: [
        "borrador",
        "emitida",
        "parcial",
        "completada",
        "pagada",
        "anulada",
      ],
      estado_pago_enum: ["aplicado", "revertido"],
      evento_cotizacion_enum: [
        "CREADA",
        "EDITADA",
        "ESTADO_CAMBIADO",
        "LINEA_AGREGADA",
        "LINEA_MODIFICADA",
        "LINEA_ELIMINADA",
        "APROBACION_SOLICITADA",
        "APROBACION_RESUELTA",
        "NUEVA_VERSION",
        "CLONADA",
      ],
      evento_finanzas_enum: [
        "DOCUMENTO_CREADO",
        "ESTADO_CAMBIADO",
        "DOCUMENTO_ANULADO",
        "PAGO_REGISTRADO",
        "PAGO_MODIFICADO",
        "PAGO_ELIMINADO",
      ],
      facturacion_ciclo_enum: [
        "unica",
        "mensual",
        "trimestral",
        "semestral",
        "anual",
      ],
      giro_comercial_enum: [
        "tecnologia_software",
        "servicios_profesionales",
        "construccion_ingenieria",
        "maquinaria_repuestos",
        "salud_equipamiento",
        "retail_comercio",
        "manufactura",
        "otro",
      ],
      nivel_evaluacion_enum: ["linea", "documento"],
      regla_seleccion_bom_enum: [
        "requerido",
        "opcional",
        "mutuamente_exclusivo",
      ],
      rol_enum: ["owner", "admin", "seller", "viewer"],
      suscripcion_estado_enum: ["activa", "cancelada", "vencida", "suspendida"],
      suscripcion_tipo_enum: ["trial", "pago", "gratuito"],
      tipo_bodega_enum: [
        "disponible",
        "reservada",
        "cuarentena",
        "obsoleta_merma",
      ],
      tipo_catalogo_oficial_enum: ["cabys", "sat", "unspsc", "hs_code", "otro"],
      tipo_costo_enum: [
        "estandar",
        "promedio",
        "reposicion",
        "ultimo",
        "historico",
      ],
      tipo_direccion_enum: ["fiscal", "despacho", "cobro", "sucursal", "otra"],
      tipo_documento_comercial_enum: [
        "pedido_venta",
        "factura_venta",
        "orden_compra",
        "factura_compra",
        "nota_credito",
        "nota_debito",
        "tiquete_electronico",
        "factura_exportacion",
      ],
      tipo_movimiento_kardex_enum: [
        "COMPRA_INGRESO",
        "VENTA_SALIDA",
        "RESERVA_COMPROMISO",
        "RESERVA_LIBERACION",
        "DEVOLUCION_CLIENTE",
        "DEVOLUCION_PROVEEDOR",
        "AJUSTE_INVENTARIO",
      ],
      tipo_politica_enum: [
        "margen_minimo",
        "margen_objetivo",
        "descuento_maximo",
        "precio_minimo",
        "monto_maximo_documento",
        "vigencia_maxima_dias",
        "venta_bajo_costo",
        "descuento_total_maximo",
        "utilidad_absoluta_minima",
      ],
      tipo_producto_enum: ["fisico", "servicio", "suscripcion"],
      tipo_recurso_enum: [
        "imagen",
        "pdf",
        "manual",
        "ficha_tecnica",
        "video",
        "enlace",
      ],
      tipo_regla_cpq_enum: [
        "inclusion_obligatoria",
        "exclusion_mutua",
        "cantidad_minima",
        "cantidad_maxima",
        "restriccion_atributo",
      ],
      tipo_relacion_producto_enum: [
        "cross_sell",
        "up_sell",
        "sustituto",
        "accesorio",
        "compatibilidad",
      ],
      tipo_transaccion_cxc_enum: [
        "abono",
        "adelanto",
        "aplicacion_nota_credito",
        "retencion_impuesto",
      ],
      tipo_transaccion_cxp_enum: [
        "abono",
        "aplicacion_nota_credito_proveedor",
        "nota_debito_proveedor",
      ],
    },
  },
} as const
