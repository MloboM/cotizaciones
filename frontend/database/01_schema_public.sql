


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "btree_gist" WITH SCHEMA "public";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pg_trgm" WITH SCHEMA "public";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "vector" WITH SCHEMA "public";






CREATE TYPE "public"."accion_politica_enum" AS ENUM (
    'advertir',
    'solicitar_aprobacion',
    'bloquear'
);


ALTER TYPE "public"."accion_politica_enum" OWNER TO "postgres";


CREATE TYPE "public"."atributo_tipo_dato_enum" AS ENUM (
    'texto',
    'numero',
    'booleano',
    'fecha',
    'lista'
);


ALTER TYPE "public"."atributo_tipo_dato_enum" OWNER TO "postgres";


CREATE TYPE "public"."caracteristica_data_type" AS ENUM (
    'int',
    'bool',
    'decimal'
);


ALTER TYPE "public"."caracteristica_data_type" OWNER TO "postgres";


CREATE TYPE "public"."cr_estado_aceptacion_enum" AS ENUM (
    'pendiente',
    'aceptado',
    'aceptado_parcial',
    'rechazado'
);


ALTER TYPE "public"."cr_estado_aceptacion_enum" OWNER TO "postgres";


CREATE TYPE "public"."cr_estado_hacienda_enum" AS ENUM (
    'no_aplica',
    'borrador',
    'generada',
    'enviada_hacienda',
    'procesando',
    'aceptada',
    'rechazada',
    'error_envio'
);


ALTER TYPE "public"."cr_estado_hacienda_enum" OWNER TO "postgres";


CREATE TYPE "public"."empresa_estado_enum" AS ENUM (
    'activa',
    'trial',
    'suspendida',
    'inactiva'
);


ALTER TYPE "public"."empresa_estado_enum" OWNER TO "postgres";


CREATE TYPE "public"."estado_aprobacion_enum" AS ENUM (
    'pendiente',
    'aprobada',
    'rechazada',
    'cancelada'
);


ALTER TYPE "public"."estado_aprobacion_enum" OWNER TO "postgres";


CREATE TYPE "public"."estado_comercial_enum" AS ENUM (
    'prospecto',
    'activo',
    'inactivo',
    'perdido'
);


ALTER TYPE "public"."estado_comercial_enum" OWNER TO "postgres";


CREATE TYPE "public"."estado_cotizacion_enum" AS ENUM (
    'borrador',
    'pendiente_aprobacion',
    'aprobada',
    'rechazada_internamente',
    'enviada',
    'aceptada_cliente',
    'rechazada_cliente',
    'expirada',
    'version_obsoleta'
);


ALTER TYPE "public"."estado_cotizacion_enum" OWNER TO "postgres";


CREATE TYPE "public"."estado_evento_enum" AS ENUM (
    'pendiente',
    'procesando',
    'completado',
    'fallido',
    'dead_letter'
);


ALTER TYPE "public"."estado_evento_enum" OWNER TO "postgres";


CREATE TYPE "public"."estado_indexacion_enum" AS ENUM (
    'pendiente',
    'procesando',
    'completado',
    'error'
);


ALTER TYPE "public"."estado_indexacion_enum" OWNER TO "postgres";


CREATE TYPE "public"."estado_invitacion_enum" AS ENUM (
    'pendiente',
    'aceptada',
    'expirada',
    'cancelada'
);


ALTER TYPE "public"."estado_invitacion_enum" OWNER TO "postgres";


CREATE TYPE "public"."estado_operativo_enum" AS ENUM (
    'borrador',
    'emitida',
    'parcial',
    'completada',
    'pagada',
    'anulada'
);


ALTER TYPE "public"."estado_operativo_enum" OWNER TO "postgres";


CREATE TYPE "public"."estado_pago_enum" AS ENUM (
    'aplicado',
    'revertido'
);


ALTER TYPE "public"."estado_pago_enum" OWNER TO "postgres";


CREATE TYPE "public"."evento_cotizacion_enum" AS ENUM (
    'CREADA',
    'EDITADA',
    'ESTADO_CAMBIADO',
    'LINEA_AGREGADA',
    'LINEA_MODIFICADA',
    'LINEA_ELIMINADA',
    'APROBACION_SOLICITADA',
    'APROBACION_RESUELTA',
    'NUEVA_VERSION',
    'CLONADA'
);


ALTER TYPE "public"."evento_cotizacion_enum" OWNER TO "postgres";


CREATE TYPE "public"."evento_finanzas_enum" AS ENUM (
    'DOCUMENTO_CREADO',
    'ESTADO_CAMBIADO',
    'DOCUMENTO_ANULADO',
    'PAGO_REGISTRADO',
    'PAGO_MODIFICADO',
    'PAGO_ELIMINADO'
);


ALTER TYPE "public"."evento_finanzas_enum" OWNER TO "postgres";


CREATE TYPE "public"."facturacion_ciclo_enum" AS ENUM (
    'unica',
    'mensual',
    'trimestral',
    'semestral',
    'anual'
);


ALTER TYPE "public"."facturacion_ciclo_enum" OWNER TO "postgres";


CREATE TYPE "public"."giro_comercial_enum" AS ENUM (
    'tecnologia_software',
    'servicios_profesionales',
    'construccion_ingenieria',
    'maquinaria_repuestos',
    'salud_equipamiento',
    'retail_comercio',
    'manufactura',
    'otro'
);


ALTER TYPE "public"."giro_comercial_enum" OWNER TO "postgres";


CREATE TYPE "public"."nivel_evaluacion_enum" AS ENUM (
    'linea',
    'documento'
);


ALTER TYPE "public"."nivel_evaluacion_enum" OWNER TO "postgres";


CREATE TYPE "public"."regla_seleccion_bom_enum" AS ENUM (
    'requerido',
    'opcional',
    'mutuamente_exclusivo'
);


ALTER TYPE "public"."regla_seleccion_bom_enum" OWNER TO "postgres";


CREATE TYPE "public"."rol_enum" AS ENUM (
    'owner',
    'admin',
    'seller',
    'viewer'
);


ALTER TYPE "public"."rol_enum" OWNER TO "postgres";


CREATE TYPE "public"."suscripcion_estado_enum" AS ENUM (
    'activa',
    'cancelada',
    'vencida',
    'suspendida'
);


ALTER TYPE "public"."suscripcion_estado_enum" OWNER TO "postgres";


CREATE TYPE "public"."suscripcion_tipo_enum" AS ENUM (
    'trial',
    'pago',
    'gratuito'
);


ALTER TYPE "public"."suscripcion_tipo_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_bodega_enum" AS ENUM (
    'disponible',
    'reservada',
    'cuarentena',
    'obsoleta_merma'
);


ALTER TYPE "public"."tipo_bodega_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_catalogo_oficial_enum" AS ENUM (
    'cabys',
    'sat',
    'unspsc',
    'hs_code',
    'otro'
);


ALTER TYPE "public"."tipo_catalogo_oficial_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_costo_enum" AS ENUM (
    'estandar',
    'promedio',
    'reposicion',
    'ultimo',
    'historico'
);


ALTER TYPE "public"."tipo_costo_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_direccion_enum" AS ENUM (
    'fiscal',
    'despacho',
    'cobro',
    'sucursal',
    'otra'
);


ALTER TYPE "public"."tipo_direccion_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_documento_comercial_enum" AS ENUM (
    'pedido_venta',
    'factura_venta',
    'orden_compra',
    'factura_compra',
    'nota_credito',
    'nota_debito',
    'tiquete_electronico',
    'factura_exportacion'
);


ALTER TYPE "public"."tipo_documento_comercial_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_movimiento_kardex_enum" AS ENUM (
    'COMPRA_INGRESO',
    'VENTA_SALIDA',
    'RESERVA_COMPROMISO',
    'RESERVA_LIBERACION',
    'DEVOLUCION_CLIENTE',
    'DEVOLUCION_PROVEEDOR',
    'AJUSTE_INVENTARIO'
);


ALTER TYPE "public"."tipo_movimiento_kardex_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_politica_enum" AS ENUM (
    'margen_minimo',
    'margen_objetivo',
    'descuento_maximo',
    'precio_minimo',
    'monto_maximo_documento',
    'vigencia_maxima_dias',
    'venta_bajo_costo',
    'descuento_total_maximo',
    'utilidad_absoluta_minima'
);


ALTER TYPE "public"."tipo_politica_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_producto_enum" AS ENUM (
    'fisico',
    'servicio',
    'suscripcion'
);


ALTER TYPE "public"."tipo_producto_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_recurso_enum" AS ENUM (
    'imagen',
    'pdf',
    'manual',
    'ficha_tecnica',
    'video',
    'enlace'
);


ALTER TYPE "public"."tipo_recurso_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_regla_cpq_enum" AS ENUM (
    'inclusion_obligatoria',
    'exclusion_mutua',
    'cantidad_minima',
    'cantidad_maxima',
    'restriccion_atributo'
);


ALTER TYPE "public"."tipo_regla_cpq_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_relacion_producto_enum" AS ENUM (
    'cross_sell',
    'up_sell',
    'sustituto',
    'accesorio',
    'compatibilidad'
);


ALTER TYPE "public"."tipo_relacion_producto_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_transaccion_cxc_enum" AS ENUM (
    'abono',
    'adelanto',
    'aplicacion_nota_credito',
    'retencion_impuesto'
);


ALTER TYPE "public"."tipo_transaccion_cxc_enum" OWNER TO "postgres";


CREATE TYPE "public"."tipo_transaccion_cxp_enum" AS ENUM (
    'abono',
    'aplicacion_nota_credito_proveedor',
    'nota_debito_proveedor'
);


ALTER TYPE "public"."tipo_transaccion_cxp_enum" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."aceptar_invitacion"("p_token" "uuid") RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_invitacion RECORD;
    v_user_id UUID;
    v_auth_email TEXT;
BEGIN
    v_user_id := auth.uid();
    IF v_user_id IS NULL THEN RAISE EXCEPTION 'Debe estar autenticado.'; END IF;

    SELECT email INTO v_auth_email FROM auth.users WHERE id = v_user_id;
    IF v_auth_email IS NULL THEN 
        RAISE EXCEPTION 'No fue posible validar el correo autenticado.'; 
    END IF;

    -- 1. Consumo Atómico de la Invitación (Solo si está pendiente y no ha expirado)
    UPDATE public.invitaciones 
    SET estado = 'aceptada', accepted_at = NOW() 
    WHERE token = p_token 
      AND estado = 'pendiente'
      AND fecha_expiracion >= NOW()
    RETURNING * INTO v_invitacion;
    
    IF v_invitacion.id IS NULL THEN 
        RAISE EXCEPTION 'Invitación inválida, expirada o ya procesada.'; 
    END IF;

    IF LOWER(TRIM(v_auth_email)) != v_invitacion.email THEN
        RAISE EXCEPTION 'Alerta de Seguridad: El correo no coincide con la invitación.';
    END IF;

    -- 2. Vinculación Atómica del Perfil (Race condition imposible gracias a "empresa_id IS NULL")
    UPDATE public.perfiles 
    SET empresa_id = v_invitacion.empresa_id, rol = v_invitacion.rol, invitado_por = v_invitacion.invitado_por
    WHERE id = v_user_id 
      AND empresa_id IS NULL 
      AND deleted_at IS NULL;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'No fue posible asociar el usuario. Es posible que el perfil no exista, haya sido eliminado, o ya pertenezca a otra empresa.';
    END IF;

    INSERT INTO public.audit_eventos (empresa_id, actor_id, target_id, accion, detalles)
    VALUES (v_invitacion.empresa_id, v_user_id, v_user_id, 'INVITACION_ACEPTADA', jsonb_build_object('rol', v_invitacion.rol));

    RETURN TRUE;
END;
$$;


ALTER FUNCTION "public"."aceptar_invitacion"("p_token" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."cambiar_estado_usuario"("p_target_id" "uuid", "p_nuevo_estado" boolean) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_caller_rol public.rol_enum;
    v_target_rol public.rol_enum;
    v_target_deleted_at TIMESTAMPTZ;
    v_empresa UUID;
    v_limite_usuarios INT;
    v_usuarios_actuales INT;
    v_owners_activos INT;
BEGIN
    SELECT rol, empresa_id INTO v_caller_rol, v_empresa 
    FROM public.perfiles WHERE id = auth.uid() AND activo = TRUE AND deleted_at IS NULL;
    IF v_caller_rol IS NULL THEN RAISE EXCEPTION 'Operación denegada o usuario inactivo.'; END IF;

    SELECT rol, deleted_at INTO v_target_rol, v_target_deleted_at 
    FROM public.perfiles WHERE id = p_target_id AND empresa_id = v_empresa;

    IF v_target_rol IS NULL THEN RAISE EXCEPTION 'Usuario objetivo no encontrado.'; END IF;
    IF v_target_deleted_at IS NOT NULL THEN RAISE EXCEPTION 'El usuario objetivo ha sido eliminado del sistema.'; END IF;

    IF v_caller_rol NOT IN ('owner', 'admin') THEN RAISE EXCEPTION 'Privilegios insuficientes.'; END IF;
    IF v_caller_rol = 'admin' AND v_target_rol IN ('owner', 'admin') THEN RAISE EXCEPTION 'No tiene jerarquía para esta acción.'; END IF;

    IF p_nuevo_estado = FALSE AND v_target_rol = 'owner' THEN
        SELECT COUNT(*) INTO v_owners_activos FROM public.perfiles 
        WHERE empresa_id = v_empresa AND rol = 'owner' AND activo = TRUE AND deleted_at IS NULL;
        
        IF v_owners_activos <= 1 THEN RAISE EXCEPTION 'No puede desactivar al último owner activo.'; END IF;
    END IF;

    IF p_nuevo_estado = TRUE THEN
        PERFORM 1 FROM public.empresas WHERE id = v_empresa FOR UPDATE;

        SELECT COALESCE(pc.valor_int, 999999) INTO v_limite_usuarios
        FROM public.suscripciones s JOIN public.plan_configuracion pc ON s.plan_id = pc.plan_id JOIN public.caracteristicas c ON pc.caracteristica_id = c.id
        WHERE s.empresa_id = v_empresa AND s.es_activa_actual = TRUE AND c.codigo = 'limite_usuarios';

        SELECT (SELECT count(*) FROM public.perfiles WHERE empresa_id = v_empresa AND activo = TRUE AND deleted_at IS NULL) +
               (SELECT count(*) FROM public.invitaciones WHERE empresa_id = v_empresa AND estado = 'pendiente')
        INTO v_usuarios_actuales;

        IF v_usuarios_actuales >= v_limite_usuarios THEN RAISE EXCEPTION 'Límite de usuarios alcanzado.'; END IF;
    END IF;

    UPDATE public.perfiles SET activo = p_nuevo_estado WHERE id = p_target_id AND deleted_at IS NULL;
    IF NOT FOUND THEN RAISE EXCEPTION 'El usuario fue modificado o eliminado simultáneamente.'; END IF;

    INSERT INTO public.audit_eventos (empresa_id, actor_id, target_id, accion, detalles)
    VALUES (v_empresa, auth.uid(), p_target_id, CASE WHEN p_nuevo_estado THEN 'USUARIO_REACTIVADO' ELSE 'USUARIO_DESACTIVADO' END, '{}');
END;
$$;


ALTER FUNCTION "public"."cambiar_estado_usuario"("p_target_id" "uuid", "p_nuevo_estado" boolean) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."cambiar_rol_usuario"("p_target_id" "uuid", "p_nuevo_rol" "public"."rol_enum") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_caller_rol public.rol_enum;
    v_target_rol public.rol_enum;
    v_target_deleted_at TIMESTAMPTZ;
    v_empresa UUID;
    v_owners_activos INT;
BEGIN
    SELECT rol, empresa_id INTO v_caller_rol, v_empresa 
    FROM public.perfiles WHERE id = auth.uid() AND activo = TRUE AND deleted_at IS NULL;
    IF v_caller_rol IS NULL THEN RAISE EXCEPTION 'Operación denegada o usuario inactivo.'; END IF;

    SELECT rol, deleted_at INTO v_target_rol, v_target_deleted_at 
    FROM public.perfiles WHERE id = p_target_id AND empresa_id = v_empresa;

    IF v_target_rol IS NULL THEN RAISE EXCEPTION 'Usuario objetivo no encontrado.'; END IF;
    IF v_target_deleted_at IS NOT NULL THEN RAISE EXCEPTION 'El usuario objetivo ha sido eliminado del sistema.'; END IF;

    IF v_caller_rol NOT IN ('owner', 'admin') THEN RAISE EXCEPTION 'Privilegios insuficientes.'; END IF;
    IF v_caller_rol = 'admin' AND (v_target_rol IN ('owner', 'admin') OR p_nuevo_rol IN ('owner', 'admin')) THEN 
        RAISE EXCEPTION 'Un admin no puede modificar ni asignar roles administrativos.'; 
    END IF;

    IF v_target_rol = 'owner' AND p_nuevo_rol != 'owner' THEN
        SELECT COUNT(*) INTO v_owners_activos FROM public.perfiles 
        WHERE empresa_id = v_empresa AND rol = 'owner' AND activo = TRUE AND deleted_at IS NULL;

        IF v_owners_activos <= 1 THEN RAISE EXCEPTION 'Operación denegada: No puede degradar al único owner activo de la empresa.'; END IF;
    END IF;

    UPDATE public.perfiles SET rol = p_nuevo_rol WHERE id = p_target_id AND deleted_at IS NULL;
    IF NOT FOUND THEN RAISE EXCEPTION 'El usuario fue modificado o eliminado simultáneamente.'; END IF;

    INSERT INTO public.audit_eventos (empresa_id, actor_id, target_id, accion, detalles)
    VALUES (v_empresa, auth.uid(), p_target_id, 'ROL_MODIFICADO', jsonb_build_object('rol_anterior', v_target_rol, 'nuevo_rol', p_nuevo_rol));
END;
$$;


ALTER FUNCTION "public"."cambiar_rol_usuario"("p_target_id" "uuid", "p_nuevo_rol" "public"."rol_enum") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."cancelar_invitacion"("p_invitacion_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_empresa UUID;
    v_caller_rol public.rol_enum;
BEGIN
    SELECT rol, empresa_id INTO v_caller_rol, v_empresa 
    FROM public.perfiles WHERE id = auth.uid() AND activo = TRUE AND deleted_at IS NULL;

    IF v_caller_rol NOT IN ('owner', 'admin') THEN RAISE EXCEPTION 'Operación denegada.'; END IF;

    UPDATE public.invitaciones SET estado = 'cancelada'
    WHERE id = p_invitacion_id AND empresa_id = v_empresa AND estado = 'pendiente';

    IF FOUND THEN
        INSERT INTO public.audit_eventos (empresa_id, actor_id, target_id, accion, detalles)
        VALUES (v_empresa, auth.uid(), NULL, 'INVITACION_CANCELADA', jsonb_build_object('invitacion_id', p_invitacion_id));
    END IF;
END;
$$;


ALTER FUNCTION "public"."cancelar_invitacion"("p_invitacion_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."crear_empresa_y_owner"("p_nombre_comercial" "text", "p_moneda_base" "text", "p_iva_default" numeric, "p_nombre_completo" "text", "p_plan_nombre" "text") RETURNS "uuid"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_empresa_id UUID;
    v_user_id UUID;
    v_plan_id UUID;
BEGIN
    v_user_id := auth.uid();
    IF v_user_id IS NULL THEN
        RAISE EXCEPTION 'Operación denegada: Usuario no autenticado.';
    END IF;

    -- (✅ MEJORA CRÍTICA: Bloquear creación múltiple de empresas)
    IF EXISTS (
        SELECT 1 FROM public.perfiles
        WHERE id = v_user_id AND empresa_id IS NOT NULL AND deleted_at IS NULL
    ) THEN
        RAISE EXCEPTION 'Operación denegada: El usuario ya pertenece a una empresa activa.';
    END IF;

    SELECT id INTO v_plan_id FROM public.planes WHERE nombre = p_plan_nombre LIMIT 1;
    IF v_plan_id IS NULL THEN
        RAISE EXCEPTION 'Operación denegada: El plan especificado no existe.';
    END IF;

    -- 1. Crear Empresa
    INSERT INTO public.empresas (nombre_comercial, moneda_base, iva_default, estado)
    VALUES (p_nombre_comercial, p_moneda_base, p_iva_default, 'trial')
    RETURNING id INTO v_empresa_id;

    -- 2. Crear Suscripción Trial
    INSERT INTO public.suscripciones (empresa_id, plan_id, tipo_suscripcion, estado, fecha_fin, es_activa_actual)
    VALUES (v_empresa_id, v_plan_id, 'trial', 'activa', NOW() + INTERVAL '14 days', TRUE);

    -- 3. Vincular y ascender a Owner
    UPDATE public.perfiles 
    SET empresa_id = v_empresa_id,
        rol = 'owner',
        nombre_completo = p_nombre_completo
    WHERE id = v_user_id;

    RETURN v_empresa_id;
END;
$$;


ALTER FUNCTION "public"."crear_empresa_y_owner"("p_nombre_comercial" "text", "p_moneda_base" "text", "p_iva_default" numeric, "p_nombre_completo" "text", "p_plan_nombre" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_audit_cotizacion_aprobaciones"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_actor UUID;
BEGIN
    IF TG_OP = 'INSERT' THEN
        v_actor := COALESCE(auth.uid(), NEW.solicitado_por);
        IF v_actor IS NULL THEN RAISE EXCEPTION 'AUDITORÍA FALLIDA: Actor nulo en solicitud de aprobación.'; END IF;
        INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion, detalles_json) VALUES (NEW.empresa_id, NEW.cotizacion_id, 'APROBACION_SOLICITADA', v_actor, 'Aprobación solicitada por política comercial.', jsonb_build_object('politica_id', NEW.politica_id));
    ELSIF TG_OP = 'UPDATE' THEN
        IF NEW.estado IS DISTINCT FROM OLD.estado AND NEW.estado IN ('aprobada', 'rechazada', 'cancelada') THEN
            v_actor := COALESCE(NEW.evaluado_por, auth.uid());
            IF v_actor IS NULL THEN RAISE EXCEPTION 'AUDITORÍA FALLIDA: Actor nulo en resolución de aprobación.'; END IF;
            INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion, detalles_json) VALUES (NEW.empresa_id, NEW.cotizacion_id, 'APROBACION_RESUELTA', v_actor, 'Aprobación resuelta: ' || NEW.estado, jsonb_build_object('politica_id', NEW.politica_id, 'estado_nuevo', NEW.estado, 'notas', NEW.notas_evaluador));
        END IF;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_audit_cotizacion_aprobaciones"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_audit_cotizacion_cabecera"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_actor UUID; v_cambios JSONB := '{}'::jsonb;
BEGIN
    v_actor := COALESCE(NEW.updated_by, NEW.created_by, auth.uid());
    IF v_actor IS NULL THEN RAISE EXCEPTION 'AUDITORÍA FALLIDA: Actor nulo en operación de cabecera.'; END IF;

    IF TG_OP = 'INSERT' THEN
        INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion) VALUES (NEW.empresa_id, NEW.id, 'CREADA', v_actor, 'Cotización inicializada.');
    ELSIF TG_OP = 'UPDATE' THEN
        IF NEW.estado IS DISTINCT FROM OLD.estado THEN
            INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion, detalles_json) VALUES (NEW.empresa_id, NEW.id, 'ESTADO_CAMBIADO', v_actor, 'Estado modificado a ' || NEW.estado, jsonb_build_object('anterior', OLD.estado, 'nuevo', NEW.estado));
        END IF;
        
        IF NEW.cliente_id IS DISTINCT FROM OLD.cliente_id THEN v_cambios := jsonb_set(v_cambios, '{cliente_id}', jsonb_build_object('antes', OLD.cliente_id, 'despues', NEW.cliente_id)); END IF;
        IF NEW.total_neto IS DISTINCT FROM OLD.total_neto THEN v_cambios := jsonb_set(v_cambios, '{total_neto}', jsonb_build_object('antes', OLD.total_neto, 'despues', NEW.total_neto)); END IF;
        IF NEW.total_descuento IS DISTINCT FROM OLD.total_descuento THEN v_cambios := jsonb_set(v_cambios, '{total_descuento}', jsonb_build_object('antes', OLD.total_descuento, 'despues', NEW.total_descuento)); END IF;
        IF NEW.rentabilidad_porcentaje IS DISTINCT FROM OLD.rentabilidad_porcentaje THEN v_cambios := jsonb_set(v_cambios, '{rentabilidad_porcentaje}', jsonb_build_object('antes', OLD.rentabilidad_porcentaje, 'despues', NEW.rentabilidad_porcentaje)); END IF;
        IF NEW.moneda_cotizacion IS DISTINCT FROM OLD.moneda_cotizacion THEN v_cambios := jsonb_set(v_cambios, '{moneda_cotizacion}', jsonb_build_object('antes', OLD.moneda_cotizacion, 'despues', NEW.moneda_cotizacion)); END IF;

        IF v_cambios <> '{}'::jsonb THEN
            INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion, detalles_json) VALUES (NEW.empresa_id, NEW.id, 'EDITADA', v_actor, 'Campos comerciales modificados.', v_cambios);
        END IF;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_audit_cotizacion_cabecera"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_audit_cotizacion_lineas"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_actor UUID; v_empresa_id UUID; v_cotizacion_id UUID; v_cambios JSONB := '{}'::jsonb;
BEGIN
    IF TG_OP = 'INSERT' THEN v_actor := COALESCE(NEW.created_by, auth.uid()); v_empresa_id := NEW.empresa_id; v_cotizacion_id := NEW.cotizacion_id;
    ELSIF TG_OP = 'UPDATE' THEN v_actor := COALESCE(NEW.updated_by, OLD.updated_by, auth.uid()); v_empresa_id := NEW.empresa_id; v_cotizacion_id := NEW.cotizacion_id;
    ELSIF TG_OP = 'DELETE' THEN v_actor := auth.uid(); v_empresa_id := OLD.empresa_id; v_cotizacion_id := OLD.cotizacion_id; END IF;

    IF v_actor IS NULL THEN RAISE EXCEPTION 'AUDITORÍA FALLIDA: Actor nulo en operación sobre línea (%).', TG_OP; END IF;

    IF TG_OP = 'INSERT' THEN
        INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion, detalles_json) VALUES (v_empresa_id, v_cotizacion_id, 'LINEA_AGREGADA', v_actor, 'Línea agregada: ' || NEW.nombre_congelado, jsonb_build_object('producto_id', NEW.producto_id, 'cantidad', NEW.cantidad, 'precio_unitario', NEW.precio_unitario));
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion, detalles_json) VALUES (v_empresa_id, v_cotizacion_id, 'LINEA_ELIMINADA', v_actor, 'Línea eliminada: ' || OLD.nombre_congelado, jsonb_build_object('producto_id', OLD.producto_id, 'cantidad', OLD.cantidad));
    ELSIF TG_OP = 'UPDATE' THEN
        IF NEW.cantidad IS DISTINCT FROM OLD.cantidad THEN v_cambios := jsonb_set(v_cambios, '{cantidad}', jsonb_build_object('antes', OLD.cantidad, 'despues', NEW.cantidad)); END IF;
        IF NEW.precio_unitario IS DISTINCT FROM OLD.precio_unitario THEN v_cambios := jsonb_set(v_cambios, '{precio_unitario}', jsonb_build_object('antes', OLD.precio_unitario, 'despues', NEW.precio_unitario)); END IF;
        IF NEW.porcentaje_descuento IS DISTINCT FROM OLD.porcentaje_descuento THEN v_cambios := jsonb_set(v_cambios, '{porcentaje_descuento}', jsonb_build_object('antes', OLD.porcentaje_descuento, 'despues', NEW.porcentaje_descuento)); END IF;
        IF v_cambios <> '{}'::jsonb THEN INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion, detalles_json) VALUES (v_empresa_id, v_cotizacion_id, 'LINEA_MODIFICADA', v_actor, 'Modificada línea: ' || NEW.nombre_congelado, v_cambios); END IF;
    END IF;
    IF TG_OP = 'DELETE' THEN RETURN OLD; ELSE RETURN NEW; END IF;
END;
$$;


ALTER FUNCTION "public"."fn_audit_cotizacion_lineas"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_audit_estado_documento"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
    IF NEW.estado_operativo IS DISTINCT FROM OLD.estado_operativo THEN
        INSERT INTO public.documentos_historial_estados (empresa_id, documento_id, estado_anterior, estado_nuevo, cambiado_por) VALUES (NEW.empresa_id, NEW.id, OLD.estado_operativo, NEW.estado_operativo, COALESCE(NEW.updated_by, auth.uid()));
    END IF; RETURN NEW;
END; $$;


ALTER FUNCTION "public"."fn_audit_estado_documento"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_cascade_soft_delete_cliente"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF NEW.deleted_at IS NOT NULL AND OLD.deleted_at IS NULL THEN
        IF EXISTS (SELECT 1 FROM public.clientes WHERE cliente_padre_id = NEW.id AND empresa_id = NEW.empresa_id AND deleted_at IS NULL) THEN
            RAISE EXCEPTION 'No se puede eliminar un cliente matriz que tiene sucursales activas.';
        END IF;

        UPDATE public.direcciones_cliente SET deleted_at = NEW.deleted_at, deleted_by_cascade = true, updated_at = NOW() WHERE empresa_id = NEW.empresa_id AND cliente_id = NEW.id AND deleted_at IS NULL;
        UPDATE public.contactos_cliente SET deleted_at = NEW.deleted_at, deleted_by_cascade = true, updated_at = NOW() WHERE empresa_id = NEW.empresa_id AND cliente_id = NEW.id AND deleted_at IS NULL;
    END IF;
    
    IF NEW.deleted_at IS NULL AND OLD.deleted_at IS NOT NULL THEN
        -- Optimización: Asegurar que solo actualizamos los que estaban en Soft Delete
        UPDATE public.direcciones_cliente SET deleted_at = NULL, deleted_by_cascade = false, updated_at = NOW() 
        WHERE empresa_id = NEW.empresa_id AND cliente_id = NEW.id AND deleted_by_cascade = true AND deleted_at IS NOT NULL;
        
        UPDATE public.contactos_cliente SET deleted_at = NULL, deleted_by_cascade = false, updated_at = NOW() 
        WHERE empresa_id = NEW.empresa_id AND cliente_id = NEW.id AND deleted_by_cascade = true AND deleted_at IS NOT NULL;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_cascade_soft_delete_cliente"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_clientes_master_trigger"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_perfil_id UUID;
BEGIN
    -- 1. NORMALIZACIÓN
    IF NEW.numero_identificacion IS NOT NULL THEN
        NEW.numero_identificacion := UPPER(REGEXP_REPLACE(NEW.numero_identificacion, '[^0-9A-Za-z]', '', 'g'));
    END IF;
    IF NEW.deleted_at IS NOT NULL THEN
        NEW.activo := false;
    END IF;

    -- 2. AUDITORÍA
    IF TG_OP = 'INSERT' THEN
        NEW.created_at := COALESCE(NEW.created_at, NOW());
        NEW.updated_at := COALESCE(NEW.updated_at, NOW());
    ELSIF TG_OP = 'UPDATE' THEN
        NEW.updated_at := NOW();
    END IF;

    IF v_uid IS NOT NULL THEN
        SELECT id INTO v_perfil_id FROM public.perfiles WHERE id = v_uid AND empresa_id = NEW.empresa_id LIMIT 1;
        IF v_perfil_id IS NOT NULL THEN
            IF TG_OP = 'INSERT' THEN
                NEW.created_by := COALESCE(NEW.created_by, v_perfil_id);
                NEW.updated_by := COALESCE(NEW.updated_by, v_perfil_id);
            ELSIF TG_OP = 'UPDATE' THEN
                NEW.updated_by := v_perfil_id;
            END IF;
        END IF;
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_clientes_master_trigger"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_freeze_quote_approvals"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_estado public.estado_cotizacion_enum;
BEGIN
    SELECT estado INTO v_estado FROM public.cotizaciones WHERE empresa_id = COALESCE(NEW.empresa_id, OLD.empresa_id) AND id = COALESCE(NEW.cotizacion_id, OLD.cotizacion_id);
    IF v_estado IS NULL THEN RAISE EXCEPTION 'INTEGRIDAD FALLIDA: Cotización padre no encontrada.'; END IF;
    IF v_estado IN ('aprobada', 'aceptada_cliente', 'rechazada_cliente', 'expirada', 'version_obsoleta', 'enviada') THEN RAISE EXCEPTION 'INMUTABILIDAD LEGAL: No se pueden alterar aprobaciones de una cotización terminal (%).', v_estado; END IF;
    RETURN COALESCE(NEW, OLD);
END;
$$;


ALTER FUNCTION "public"."fn_freeze_quote_approvals"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_freeze_quote_lines"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_estado public.estado_cotizacion_enum;
BEGIN
    SELECT estado INTO v_estado FROM public.cotizaciones WHERE empresa_id = COALESCE(NEW.empresa_id, OLD.empresa_id) AND id = COALESCE(NEW.cotizacion_id, OLD.cotizacion_id);
    IF v_estado IS NULL THEN RAISE EXCEPTION 'INTEGRIDAD FALLIDA: Cotización padre no encontrada.'; END IF;
    IF v_estado IN ('pendiente_aprobacion', 'aprobada', 'aceptada_cliente', 'rechazada_cliente', 'expirada', 'version_obsoleta', 'enviada', 'rechazada_internamente') THEN RAISE EXCEPTION 'INMUTABILIDAD LEGAL: No se pueden alterar las líneas de una cotización en estado congelado/terminal (%).', v_estado; END IF;
    RETURN COALESCE(NEW, OLD);
END;
$$;


ALTER FUNCTION "public"."fn_freeze_quote_lines"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_get_auth_role"() RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $$
  SELECT COALESCE(
    (auth.jwt() ->> 'rol_usuario')::text, -- Si tienes un rol personalizado
    (auth.jwt() ->> 'role')::text,        -- El rol por defecto de Supabase
    'anon'
  );
$$;


ALTER FUNCTION "public"."fn_get_auth_role"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_get_auth_tenant"() RETURNS "uuid"
    LANGUAGE "plpgsql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_empresa_id UUID;
BEGIN
    SELECT empresa_id INTO v_empresa_id
    FROM public.perfiles
    WHERE id = auth.uid() AND deleted_at IS NULL
    LIMIT 1;
    
    RETURN v_empresa_id;
END;
$$;


ALTER FUNCTION "public"."fn_get_auth_tenant"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_normalize_identificadores"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF NEW.codigo_sku IS NOT NULL THEN NEW.codigo_sku := UPPER(REGEXP_REPLACE(NEW.codigo_sku, '[^0-9A-Za-z-]', '', 'g')); END IF;
    IF NEW.codigo_barras IS NOT NULL THEN NEW.codigo_barras := UPPER(REGEXP_REPLACE(NEW.codigo_barras, '[^0-9A-Za-z-]', '', 'g')); END IF;
    IF NEW.deleted_at IS NOT NULL THEN NEW.activo := false; END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_normalize_identificadores"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_prevent_audit_tampering"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN RAISE EXCEPTION 'AUDITORÍA INMUTABLE: Los registros forenses no pueden ser alterados o eliminados.'; RETURN NULL; END; $$;


ALTER FUNCTION "public"."fn_prevent_audit_tampering"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_prevent_categoria_cycle"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE visited_nodes UUID[]; current_parent UUID;
BEGIN
    IF NEW.categoria_padre_id IS NULL THEN RETURN NEW; END IF;
    IF NEW.id IS NULL THEN NEW.id := uuid_generate_v4(); END IF;
    IF NEW.categoria_padre_id = NEW.id THEN RAISE EXCEPTION 'Ciclo jerárquico detectado.'; END IF;
    visited_nodes := ARRAY[NEW.id]; current_parent := NEW.categoria_padre_id;
    WHILE current_parent IS NOT NULL LOOP
        IF current_parent = ANY(visited_nodes) THEN RAISE EXCEPTION 'Ciclo jerárquico detectado.'; END IF;
        visited_nodes := array_append(visited_nodes, current_parent);
        SELECT categoria_padre_id INTO current_parent FROM public.categorias_producto WHERE id = current_parent AND empresa_id = NEW.empresa_id;
    END LOOP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_prevent_categoria_cycle"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_prevent_cliente_cycle"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    current_parent UUID;
    visited_nodes UUID[];
BEGIN
    IF NEW.cliente_padre_id IS NULL THEN RETURN NEW; END IF;
    
    -- Si el motor aún no le asigna el UUID DEFAULT en un INSERT, pre-asígnaselo para rastrearlo
    IF NEW.id IS NULL THEN NEW.id := uuid_generate_v4(); END IF;
    
    IF NEW.cliente_padre_id = NEW.id THEN RAISE EXCEPTION 'Un cliente no puede ser su propio padre.'; END IF;
    
    visited_nodes := ARRAY[NEW.id];
    current_parent := NEW.cliente_padre_id;
    
    WHILE current_parent IS NOT NULL LOOP
        IF current_parent = ANY(visited_nodes) THEN 
            RAISE EXCEPTION 'Ciclo jerárquico detectado. Violación de integridad referencial.'; 
        END IF;
        visited_nodes := array_append(visited_nodes, current_parent);
        SELECT cliente_padre_id INTO current_parent FROM public.clientes WHERE id = current_parent AND empresa_id = NEW.empresa_id;
    END LOOP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_prevent_cliente_cycle"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_prevent_delete_quotes"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN IF OLD.estado NOT IN ('borrador', 'rechazada_internamente') THEN RAISE EXCEPTION 'INMUTABILIDAD LEGAL: No se pueden eliminar cotizaciones en estado (%).', OLD.estado; END IF; RETURN OLD; END;
$$;


ALTER FUNCTION "public"."fn_prevent_delete_quotes"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_prevent_financial_delete"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN RAISE EXCEPTION 'AUDITORÍA: Prohibido eliminar documentos o Kardex. Utilice anulación/reversión.'; RETURN NULL; END; $$;


ALTER FUNCTION "public"."fn_prevent_financial_delete"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_prevent_impuesto_tampering"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN IF OLD.tarifa_porcentaje != NEW.tarifa_porcentaje THEN RAISE EXCEPTION 'CATÁLOGO PROTEGIDO: No puede cambiar la tarifa de un impuesto existente. Desactívelo y cree uno nuevo.'; END IF; RETURN NEW; END; $$;


ALTER FUNCTION "public"."fn_prevent_impuesto_tampering"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_set_audit_fields"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    v_uid UUID := auth.uid(); v_perfil_id UUID;
BEGIN
    IF TG_OP = 'INSERT' THEN
        NEW.created_at := COALESCE(NEW.created_at, NOW()); NEW.updated_at := COALESCE(NEW.updated_at, NOW());
    ELSIF TG_OP = 'UPDATE' THEN
        NEW.updated_at := NOW();
    END IF;

    IF v_uid IS NOT NULL THEN
        SELECT id INTO v_perfil_id FROM public.perfiles WHERE id = v_uid AND empresa_id = NEW.empresa_id LIMIT 1;
        IF v_perfil_id IS NOT NULL THEN
            IF TG_OP = 'INSERT' THEN
                NEW.created_by := COALESCE(NEW.created_by, v_perfil_id); NEW.updated_by := COALESCE(NEW.updated_by, v_perfil_id);
            ELSIF TG_OP = 'UPDATE' THEN
                NEW.updated_by := v_perfil_id;
            END IF;
        END IF;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_set_audit_fields"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_sync_kardex_saldos"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE v_stock_actual NUMERIC(14,4);
BEGIN
    IF NEW.bodega_origen_id IS NOT NULL THEN
        SELECT stock_fisico INTO v_stock_actual FROM public.inventario_saldos WHERE empresa_id = NEW.empresa_id AND bodega_id = NEW.bodega_origen_id AND producto_id = NEW.producto_id FOR UPDATE;
        IF NOT FOUND OR v_stock_actual < NEW.cantidad THEN RAISE EXCEPTION 'INVENTARIO INSUFICIENTE: Intenta retirar % pero solo hay %.', NEW.cantidad, COALESCE(v_stock_actual, 0); END IF;
        UPDATE public.inventario_saldos SET stock_fisico = stock_fisico - NEW.cantidad, updated_at = NOW() WHERE empresa_id = NEW.empresa_id AND bodega_id = NEW.bodega_origen_id AND producto_id = NEW.producto_id;
    END IF;
    IF NEW.bodega_destino_id IS NOT NULL THEN
        INSERT INTO public.inventario_saldos (empresa_id, bodega_id, producto_id, stock_fisico) VALUES (NEW.empresa_id, NEW.bodega_destino_id, NEW.producto_id, NEW.cantidad) ON CONFLICT (empresa_id, bodega_id, producto_id) DO UPDATE SET stock_fisico = inventario_saldos.stock_fisico + EXCLUDED.stock_fisico, updated_at = NOW();
    END IF; RETURN NEW;
END; $$;


ALTER FUNCTION "public"."fn_sync_kardex_saldos"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_sync_saldo_cxc"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE v_delta NUMERIC(15,2) := 0;
BEGIN
    IF TG_OP = 'INSERT' AND NEW.estado_pago = 'aplicado' THEN v_delta := -(NEW.monto_transaccion * NEW.tasa_cambio_a_factura); 
        INSERT INTO public.finanzas_eventos (empresa_id, tipo_evento, documento_referencia_id, actor_id, descripcion, monto_nuevo) VALUES (NEW.empresa_id, 'PAGO_REGISTRADO', NEW.documento_id, COALESCE(NEW.created_by, auth.uid()), 'Abono aplicado', NEW.monto_transaccion);
    ELSIF TG_OP = 'UPDATE' AND OLD.estado_pago = 'aplicado' AND NEW.estado_pago = 'revertido' THEN v_delta := (OLD.monto_transaccion * OLD.tasa_cambio_a_factura);
        INSERT INTO public.finanzas_eventos (empresa_id, tipo_evento, documento_referencia_id, actor_id, descripcion, monto_anterior) VALUES (NEW.empresa_id, 'PAGO_ELIMINADO', NEW.documento_id, auth.uid(), 'Abono revertido', OLD.monto_transaccion);
    END IF;
    UPDATE public.documentos_comerciales SET saldo_pendiente = ROUND(saldo_pendiente + v_delta, 2) WHERE id = NEW.documento_id AND empresa_id = NEW.empresa_id; RETURN NEW;
END; $$;


ALTER FUNCTION "public"."fn_sync_saldo_cxc"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_sync_saldo_cxp"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE v_delta NUMERIC(15,2) := 0;
BEGIN
    IF TG_OP = 'INSERT' AND NEW.estado_pago = 'aplicado' THEN v_delta := -(NEW.monto_transaccion * NEW.tasa_cambio_a_factura);
    ELSIF TG_OP = 'UPDATE' AND OLD.estado_pago = 'aplicado' AND NEW.estado_pago = 'revertido' THEN v_delta := (OLD.monto_transaccion * OLD.tasa_cambio_a_factura); END IF;
    UPDATE public.documentos_comerciales SET saldo_pendiente = ROUND(saldo_pendiente + v_delta, 2) WHERE id = NEW.documento_id AND empresa_id = NEW.empresa_id; RETURN NEW;
END; $$;


ALTER FUNCTION "public"."fn_sync_saldo_cxp"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_tenant_bloqueado"() RETURNS boolean
    LANGUAGE "plpgsql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_bloqueado BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1 FROM public.empresas 
        WHERE id = public.fn_get_auth_tenant() 
        AND estado IN ('suspendida', 'inactiva')
    ) INTO v_bloqueado;
    
    RETURN v_bloqueado;
END;
$$;


ALTER FUNCTION "public"."fn_tenant_bloqueado"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_validar_transicion_estado_comercial"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
DECLARE v_valida BOOLEAN; v_rol_requerido VARCHAR(50); v_rol_actual VARCHAR(50);
BEGIN
    IF OLD.estado_operativo = NEW.estado_operativo THEN RETURN NEW; END IF;
    SELECT EXISTS (SELECT 1 FROM public.workflow_transiciones WHERE empresa_id = NEW.empresa_id AND tipo_documento = NEW.tipo_documento AND estado_origen = OLD.estado_operativo AND estado_destino = NEW.estado_operativo),
           (SELECT rol_requerido FROM public.workflow_transiciones WHERE empresa_id = NEW.empresa_id AND tipo_documento = NEW.tipo_documento AND estado_origen = OLD.estado_operativo AND estado_destino = NEW.estado_operativo LIMIT 1)
    INTO v_valida, v_rol_requerido;

    IF NOT v_valida AND EXISTS (SELECT 1 FROM public.workflow_transiciones WHERE empresa_id = NEW.empresa_id AND tipo_documento = NEW.tipo_documento) THEN RAISE EXCEPTION 'MÁQUINA DE ESTADOS: Transición no permitida de % a %.', OLD.estado_operativo, NEW.estado_operativo; END IF;
    IF v_rol_requerido IS NOT NULL THEN
        v_rol_actual := NULLIF(current_setting('request.jwt.claims', true)::json->>'rol_usuario', ''); 
        IF v_rol_actual IS DISTINCT FROM v_rol_requerido AND v_rol_actual != 'admin' THEN RAISE EXCEPTION 'SEGURIDAD WORKFLOW: Transición exige el rol "%". Su rol actual es "%".', v_rol_requerido, COALESCE(v_rol_actual, 'Ninguno'); END IF;
    END IF; RETURN NEW;
END; $$;


ALTER FUNCTION "public"."fn_validar_transicion_estado_comercial"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."fn_validate_quote_update"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    -- 1. Validar Dueño Comercial (✅ SOLUCIÓN: Vendedor inmutable tras el borrador)
    IF NEW.vendedor_id IS DISTINCT FROM OLD.vendedor_id AND OLD.estado != 'borrador' THEN
        RAISE EXCEPTION 'INMUTABILIDAD COMERCIAL: El vendedor responsable solo puede reasignarse mientras la cotización está en borrador.';
    END IF;

    -- 2. Validar Máquina de Estados
    IF NEW.estado IS DISTINCT FROM OLD.estado THEN
        IF OLD.estado IN ('aceptada_cliente', 'rechazada_cliente', 'version_obsoleta', 'expirada') THEN
            RAISE EXCEPTION 'ESTADO TERMINAL: Una cotización en % no puede cambiar de estado.', OLD.estado;
        END IF;
        IF OLD.estado = 'borrador' AND NEW.estado NOT IN ('pendiente_aprobacion', 'enviada', 'version_obsoleta') THEN
            RAISE EXCEPTION 'MÁQUINA DE ESTADOS: Transición inválida desde borrador.';
        END IF;
        IF OLD.estado = 'pendiente_aprobacion' AND NEW.estado NOT IN ('aprobada', 'rechazada_internamente') THEN
            RAISE EXCEPTION 'MÁQUINA DE ESTADOS: Transición inválida desde pendiente_aprobacion.';
        END IF;
        IF OLD.estado = 'aprobada' AND NEW.estado NOT IN ('enviada', 'version_obsoleta') THEN
            RAISE EXCEPTION 'MÁQUINA DE ESTADOS: Transición inválida desde aprobada.';
        END IF;
        IF OLD.estado = 'rechazada_internamente' AND NEW.estado NOT IN ('borrador', 'version_obsoleta') THEN
            RAISE EXCEPTION 'MÁQUINA DE ESTADOS: De rechazada_internamente solo puede ir a borrador o version_obsoleta.';
        END IF;
        IF OLD.estado = 'enviada' AND NEW.estado NOT IN ('aceptada_cliente', 'rechazada_cliente', 'expirada', 'borrador', 'version_obsoleta') THEN
            RAISE EXCEPTION 'MÁQUINA DE ESTADOS: Transición inválida desde enviada.';
        END IF;
    END IF;

    -- 3. Congelación Total de Datos (Lista Blanca de Estados Mutables)
    IF OLD.estado IN ('pendiente_aprobacion', 'aprobada', 'enviada', 'aceptada_cliente', 'rechazada_cliente', 'expirada', 'version_obsoleta', 'rechazada_internamente') THEN
        IF NEW.cliente_id IS DISTINCT FROM OLD.cliente_id OR NEW.lista_precio_id IS DISTINCT FROM OLD.lista_precio_id OR NEW.moneda_cotizacion IS DISTINCT FROM OLD.moneda_cotizacion OR NEW.tasa_cambio_a_base IS DISTINCT FROM OLD.tasa_cambio_a_base OR NEW.total_bruto IS DISTINCT FROM OLD.total_bruto OR NEW.total_descuento IS DISTINCT FROM OLD.total_descuento OR NEW.total_impuestos IS DISTINCT FROM OLD.total_impuestos OR NEW.total_neto IS DISTINCT FROM OLD.total_neto OR NEW.costo_total_base IS DISTINCT FROM OLD.costo_total_base OR NEW.margen_total_base IS DISTINCT FROM OLD.margen_total_base OR NEW.rentabilidad_porcentaje IS DISTINCT FROM OLD.rentabilidad_porcentaje OR NEW.fecha_emision IS DISTINCT FROM OLD.fecha_emision OR NEW.fecha_vencimiento IS DISTINCT FROM OLD.fecha_vencimiento OR NEW.notas_comerciales IS DISTINCT FROM OLD.notas_comerciales OR NEW.condiciones_pago IS DISTINCT FROM OLD.condiciones_pago OR NEW.es_plantilla IS DISTINCT FROM OLD.es_plantilla OR NEW.nombre_plantilla IS DISTINCT FROM OLD.nombre_plantilla OR NEW.documento_grupo_id IS DISTINCT FROM OLD.documento_grupo_id OR NEW.version_numero IS DISTINCT FROM OLD.version_numero OR NEW.clonado_de_id IS DISTINCT FROM OLD.clonado_de_id OR NEW.deleted_at IS DISTINCT FROM OLD.deleted_at THEN
            RAISE EXCEPTION 'INMUTABILIDAD LEGAL: La cotización está en estado (%). Modificación bloqueada.', OLD.estado;
        END IF;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_validate_quote_update"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."handle_new_auth_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
BEGIN
    INSERT INTO public.perfiles (id, empresa_id, nombre_completo, rol)
    VALUES (NEW.id, NULL, COALESCE(NEW.raw_user_meta_data->>'nombre_completo', 'Usuario Nuevo'), 'viewer');
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."handle_new_auth_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."invitar_usuario"("p_email" "text", "p_rol" "public"."rol_enum") RETURNS "uuid"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_caller_rol public.rol_enum;
    v_caller_empresa UUID;
    v_limite_usuarios INT;
    v_usuarios_actuales INT;
    v_token UUID;
BEGIN
    SELECT rol, empresa_id INTO v_caller_rol, v_caller_empresa
    FROM public.perfiles WHERE id = auth.uid() AND activo = TRUE AND deleted_at IS NULL;

    IF v_caller_rol IS NULL THEN RAISE EXCEPTION 'Operación denegada o usuario inactivo.'; END IF;
    IF v_caller_rol NOT IN ('owner', 'admin') THEN RAISE EXCEPTION 'Operación denegada.'; END IF;
    IF v_caller_rol = 'admin' AND p_rol = 'owner' THEN RAISE EXCEPTION 'Un admin no puede invitar a un owner.'; END IF;

    IF EXISTS (
        SELECT 1 FROM public.perfiles p JOIN auth.users u ON p.id = u.id
        WHERE p.empresa_id = v_caller_empresa AND p.activo = TRUE AND p.deleted_at IS NULL AND LOWER(TRIM(u.email)) = LOWER(TRIM(p_email))
    ) THEN
        RAISE EXCEPTION 'El usuario ya pertenece a esta empresa.';
    END IF;

    IF EXISTS (
        SELECT 1 FROM public.invitaciones 
        WHERE empresa_id = v_caller_empresa AND email = LOWER(TRIM(p_email)) AND estado = 'pendiente'
    ) THEN
        RAISE EXCEPTION 'Ya existe una invitación pendiente para este correo.';
    END IF;

    -- Mutex (Semáforo) de concurrencia
    PERFORM 1 FROM public.empresas WHERE id = v_caller_empresa FOR UPDATE;

    SELECT COALESCE(pc.valor_int, 999999) INTO v_limite_usuarios
    FROM public.suscripciones s JOIN public.plan_configuracion pc ON s.plan_id = pc.plan_id JOIN public.caracteristicas c ON pc.caracteristica_id = c.id
    WHERE s.empresa_id = v_caller_empresa AND s.es_activa_actual = TRUE AND c.codigo = 'limite_usuarios';

    SELECT (SELECT count(*) FROM public.perfiles WHERE empresa_id = v_caller_empresa AND activo = TRUE AND deleted_at IS NULL) +
           (SELECT count(*) FROM public.invitaciones WHERE empresa_id = v_caller_empresa AND estado = 'pendiente')
    INTO v_usuarios_actuales;

    IF v_usuarios_actuales >= v_limite_usuarios THEN RAISE EXCEPTION 'Límite de usuarios alcanzado.'; END IF;

    INSERT INTO public.invitaciones (empresa_id, email, rol, invitado_por)
    VALUES (v_caller_empresa, LOWER(TRIM(p_email)), p_rol, auth.uid())
    RETURNING token INTO v_token;

    INSERT INTO public.audit_eventos (empresa_id, actor_id, target_id, accion, detalles)
    VALUES (v_caller_empresa, auth.uid(), NULL, 'INVITACION_CREADA', jsonb_build_object('email', LOWER(TRIM(p_email)), 'rol_asignado', p_rol));

    RETURN v_token;

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION 'Ya existe una invitación pendiente para este correo.';
END;
$$;


ALTER FUNCTION "public"."invitar_usuario"("p_email" "text", "p_rol" "public"."rol_enum") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."obtener_equipo"() RETURNS TABLE("id" "uuid", "rol" "public"."rol_enum", "nombre_completo" "text", "activo" boolean, "email" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_caller_rol public.rol_enum;
BEGIN
    SELECT p.rol INTO v_caller_rol FROM public.perfiles p WHERE p.id = auth.uid() AND p.activo = TRUE AND p.deleted_at IS NULL;
    
    IF v_caller_rol NOT IN ('owner', 'admin') THEN
        RAISE EXCEPTION 'Privacidad activada. Solo administradores pueden ver el directorio.';
    END IF;

    RETURN QUERY
    SELECT p.id, p.rol, p.nombre_completo, p.activo, COALESCE(u.email::TEXT, '[usuario eliminado]')
    FROM public.perfiles p
    LEFT JOIN auth.users u ON p.id = u.id
    WHERE p.empresa_id = public.fn_get_auth_tenant() AND p.deleted_at IS NULL
    ORDER BY CASE WHEN p.activo THEN 0 ELSE 1 END, p.nombre_completo;
END;
$$;


ALTER FUNCTION "public"."obtener_equipo"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."promover_a_owner"("p_target_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $$
DECLARE
    v_caller_rol public.rol_enum;
    v_caller_empresa UUID;
    v_target_rol public.rol_enum;
    v_target_empresa UUID;
    v_target_activo BOOLEAN;
    v_target_deleted_at TIMESTAMPTZ;
BEGIN
    SELECT rol, empresa_id INTO v_caller_rol, v_caller_empresa 
    FROM public.perfiles WHERE id = auth.uid() AND activo = TRUE AND deleted_at IS NULL;
    IF v_caller_rol != 'owner' THEN RAISE EXCEPTION 'Solo un owner activo puede promover.'; END IF;
    
    SELECT rol, empresa_id, activo, deleted_at INTO v_target_rol, v_target_empresa, v_target_activo, v_target_deleted_at 
    FROM public.perfiles WHERE id = p_target_id;
    
    IF v_target_empresa IS NULL THEN RAISE EXCEPTION 'Usuario objetivo no encontrado.'; END IF;
    IF v_target_deleted_at IS NOT NULL THEN RAISE EXCEPTION 'El usuario objetivo ha sido eliminado del sistema.'; END IF;
    IF v_target_empresa != v_caller_empresa THEN RAISE EXCEPTION 'El usuario debe pertenecer a su empresa.'; END IF;
    IF NOT v_target_activo THEN RAISE EXCEPTION 'El usuario objetivo debe estar activo.'; END IF;
    IF v_target_rol != 'admin' THEN RAISE EXCEPTION 'Solo un administrador puede ser promovido a owner.'; END IF;

    UPDATE public.perfiles SET rol = 'owner' WHERE id = p_target_id AND deleted_at IS NULL;
    IF NOT FOUND THEN RAISE EXCEPTION 'El usuario fue modificado o eliminado simultáneamente.'; END IF;
    
    INSERT INTO public.audit_eventos (empresa_id, actor_id, target_id, accion, detalles) 
    VALUES (v_caller_empresa, auth.uid(), p_target_id, 'USUARIO_PROMOVIDO_A_OWNER', '{}');
END;
$$;


ALTER FUNCTION "public"."promover_a_owner"("p_target_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."rls_auto_enable"() RETURNS "event_trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'pg_catalog'
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN
    SELECT *
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO')
      AND object_type IN ('table','partitioned table')
  LOOP
     IF cmd.schema_name IS NOT NULL AND cmd.schema_name IN ('public') AND cmd.schema_name NOT IN ('pg_catalog','information_schema') AND cmd.schema_name NOT LIKE 'pg_toast%' AND cmd.schema_name NOT LIKE 'pg_temp%' THEN
      BEGIN
        EXECUTE format('alter table if exists %s enable row level security', cmd.object_identity);
        RAISE LOG 'rls_auto_enable: enabled RLS on %', cmd.object_identity;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE LOG 'rls_auto_enable: failed to enable RLS on %', cmd.object_identity;
      END;
     ELSE
        RAISE LOG 'rls_auto_enable: skip % (either system schema or not in enforced list: %.)', cmd.object_identity, cmd.schema_name;
     END IF;
  END LOOP;
END;
$$;


ALTER FUNCTION "public"."rls_auto_enable"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."set_updated_at_column"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sp_crear_nueva_version_cotizacion"("p_empresa_id" "uuid", "p_cotizacion_id" "uuid", "p_usuario_id" "uuid") RETURNS "uuid"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_old_quote RECORD; v_nueva_cotizacion_id UUID;
BEGIN
    SELECT * INTO v_old_quote FROM public.cotizaciones WHERE empresa_id = p_empresa_id AND id = p_cotizacion_id FOR UPDATE;
    IF NOT FOUND THEN RAISE EXCEPTION 'Cotización origen no encontrada'; END IF;
    IF v_old_quote.estado IN ('version_obsoleta', 'aceptada_cliente', 'expirada', 'rechazada_cliente') THEN RAISE EXCEPTION 'No se permite generar una versión de una cotización en estado %.', v_old_quote.estado; END IF;

    UPDATE public.cotizaciones SET estado = 'version_obsoleta', updated_at = NOW(), updated_by = p_usuario_id WHERE empresa_id = p_empresa_id AND id = p_cotizacion_id;

    INSERT INTO public.cotizaciones (
        empresa_id, documento_grupo_id, version_numero, clonado_de_id, estado,
        cliente_id, vendedor_id, lista_precio_id, moneda_cotizacion, tasa_cambio_a_base,
        total_bruto, total_descuento, total_impuestos, total_neto, costo_total_base, margen_total_base, rentabilidad_porcentaje,
        notas_comerciales, condiciones_pago, created_by, updated_by
    ) VALUES (
        v_old_quote.empresa_id, v_old_quote.documento_grupo_id, v_old_quote.version_numero + 1, p_cotizacion_id, 'borrador',
        v_old_quote.cliente_id, v_old_quote.vendedor_id, -- El dueño comercial se hereda
        v_old_quote.lista_precio_id, v_old_quote.moneda_cotizacion, v_old_quote.tasa_cambio_a_base,
        v_old_quote.total_bruto, v_old_quote.total_descuento, v_old_quote.total_impuestos, v_old_quote.total_neto, v_old_quote.costo_total_base, v_old_quote.margen_total_base, v_old_quote.rentabilidad_porcentaje,
        v_old_quote.notas_comerciales, v_old_quote.condiciones_pago, p_usuario_id, p_usuario_id -- El modificador registra la acción
    ) RETURNING id INTO v_nueva_cotizacion_id;

    INSERT INTO public.cotizacion_lineas (
        empresa_id, cotizacion_id, producto_id, tipo_producto_congelado, sku_congelado, nombre_congelado, descripcion_congelada, atributos_snapshot, clasificadores_oficiales_snapshot, cantidad, precio_unitario, porcentaje_descuento, monto_descuento, porcentaje_impuesto, monto_impuesto, total_linea, costo_unitario_base, margen_linea_base, orden_impresion, es_opcional, created_by, updated_by
    )
    SELECT empresa_id, v_nueva_cotizacion_id, producto_id, tipo_producto_congelado, sku_congelado, nombre_congelado, descripcion_congelada, atributos_snapshot, clasificadores_oficiales_snapshot, cantidad, precio_unitario, porcentaje_descuento, monto_descuento, porcentaje_impuesto, monto_impuesto, total_linea, costo_unitario_base, margen_linea_base, orden_impresion, es_opcional, p_usuario_id, p_usuario_id
    FROM public.cotizacion_lineas WHERE empresa_id = p_empresa_id AND cotizacion_id = p_cotizacion_id;

    INSERT INTO public.cotizacion_eventos (empresa_id, cotizacion_id, tipo_evento, actor_id, descripcion) VALUES (p_empresa_id, p_cotizacion_id, 'NUEVA_VERSION', p_usuario_id, 'Se generó la versión ' || (v_old_quote.version_numero + 1));

    RETURN v_nueva_cotizacion_id;
END;
$$;


ALTER FUNCTION "public"."sp_crear_nueva_version_cotizacion"("p_empresa_id" "uuid", "p_cotizacion_id" "uuid", "p_usuario_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sp_generar_clave_hacienda_cr"("p_tipo_id_emisor" character varying, "p_identificacion_emisor" character varying, "p_fecha" timestamp without time zone, "p_consecutivo_20" character varying, "p_situacion_comprobante" character varying, "p_codigo_seguridad" character varying) RETURNS character varying
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
DECLARE v_clave VARCHAR(50); v_id_len INT; v_id_formateado VARCHAR(12);
BEGIN
    v_id_len := length(p_identificacion_emisor);
    IF p_tipo_id_emisor = '01' AND v_id_len != 9 THEN RAISE EXCEPTION 'Cédula física (01) debe tener 9 dígitos'; END IF;
    IF p_tipo_id_emisor = '02' AND v_id_len != 10 THEN RAISE EXCEPTION 'Cédula jurídica (02) debe tener 10 dígitos'; END IF;
    IF p_tipo_id_emisor = '03' AND v_id_len NOT IN (11,12) THEN RAISE EXCEPTION 'DIMEX (03) debe tener 11 o 12 dígitos'; END IF;
    IF p_tipo_id_emisor = '04' AND v_id_len != 10 THEN RAISE EXCEPTION 'NITE (04) debe tener 10 dígitos'; END IF;
    IF length(p_consecutivo_20) != 20 OR length(p_codigo_seguridad) != 8 OR p_situacion_comprobante NOT IN ('1','2','3') THEN RAISE EXCEPTION 'Parámetros de Hacienda inválidos.'; END IF;
    v_clave := '506' || to_char(p_fecha, 'DDMMYY') || LPAD(p_identificacion_emisor, 12, '0') || p_consecutivo_20 || p_situacion_comprobante || p_codigo_seguridad;
    IF length(v_clave) != 50 THEN RAISE EXCEPTION 'Error matemático en la clave generada.'; END IF; RETURN v_clave;
END; $$;


ALTER FUNCTION "public"."sp_generar_clave_hacienda_cr"("p_tipo_id_emisor" character varying, "p_identificacion_emisor" character varying, "p_fecha" timestamp without time zone, "p_consecutivo_20" character varying, "p_situacion_comprobante" character varying, "p_codigo_seguridad" character varying) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sp_obtener_siguiente_consecutivo"("p_empresa_id" "uuid", "p_serie_id" "uuid") RETURNS character varying
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_serie RECORD; v_sucursal RECORD; v_terminal RECORD; v_nuevo_secuencial BIGINT;
BEGIN
    SELECT * INTO v_serie FROM public.cr_series_documentales WHERE empresa_id = p_empresa_id AND id = p_serie_id FOR UPDATE;
    IF NOT FOUND THEN RAISE EXCEPTION 'Serie documental no encontrada'; END IF;
    SELECT * INTO v_terminal FROM public.cr_terminales WHERE empresa_id = p_empresa_id AND id = v_serie.terminal_id;
    SELECT * INTO v_sucursal FROM public.cr_sucursales WHERE empresa_id = p_empresa_id AND id = v_terminal.sucursal_id;
    v_nuevo_secuencial := v_serie.secuencia_actual + 1;
    UPDATE public.cr_series_documentales SET secuencia_actual = v_nuevo_secuencial WHERE empresa_id = p_empresa_id AND id = p_serie_id;
    RETURN v_sucursal.numero_sucursal || v_terminal.numero_terminal || v_serie.codigo_tipo_hacienda || LPAD(v_nuevo_secuencial::TEXT, 10, '0');
END; $$;


ALTER FUNCTION "public"."sp_obtener_siguiente_consecutivo"("p_empresa_id" "uuid", "p_serie_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."trg_validar_tipo_configuracion"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
    v_tipo public.caracteristica_data_type;
BEGIN
    SELECT tipo_valor INTO v_tipo FROM public.caracteristicas WHERE id = NEW.caracteristica_id;

    IF v_tipo = 'int' AND NEW.valor_int IS NULL THEN
        RAISE EXCEPTION 'Inconsistencia: La característica requiere un valor entero.';
    ELSIF v_tipo = 'bool' AND NEW.valor_bool IS NULL THEN
        RAISE EXCEPTION 'Inconsistencia: La característica requiere un valor booleano.';
    ELSIF v_tipo = 'decimal' AND NEW.valor_decimal IS NULL THEN
        RAISE EXCEPTION 'Inconsistencia: La característica requiere un valor decimal.';
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."trg_validar_tipo_configuracion"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."atributos_catalogo" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre" "text" NOT NULL,
    "tipo_dato" "public"."atributo_tipo_dato_enum" DEFAULT 'texto'::"public"."atributo_tipo_dato_enum" NOT NULL,
    "unidad_medida_id" "uuid",
    "opciones_lista" "text"[],
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone
);


ALTER TABLE "public"."atributos_catalogo" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."audit_eventos" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "actor_id" "uuid",
    "target_id" "uuid",
    "accion" "text" NOT NULL,
    "detalles" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);

ALTER TABLE ONLY "public"."audit_eventos" FORCE ROW LEVEL SECURITY;


ALTER TABLE "public"."audit_eventos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."bodegas" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre" "text" NOT NULL,
    "tipo_bodega" "public"."tipo_bodega_enum" DEFAULT 'disponible'::"public"."tipo_bodega_enum" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL
);


ALTER TABLE "public"."bodegas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cache_consultas_ia" (
    "empresa_id" "uuid" NOT NULL,
    "query_hash" character varying(64) NOT NULL,
    "version_modelo" character varying(100) NOT NULL,
    "parametros_json" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "expires_at" timestamp with time zone NOT NULL
);


ALTER TABLE "public"."cache_consultas_ia" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."caracteristicas" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "codigo" "text" NOT NULL,
    "descripcion" "text",
    "tipo_valor" "public"."caracteristica_data_type" DEFAULT 'int'::"public"."caracteristica_data_type" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted_at" timestamp with time zone
);


ALTER TABLE "public"."caracteristicas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."catalogo_sinonimos" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "contexto_termino" character varying(50),
    "termino_origen" "text" NOT NULL,
    "termino_canonico" "text" NOT NULL
);


ALTER TABLE "public"."catalogo_sinonimos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."catalogos_oficiales" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "tipo_catalogo" "public"."tipo_catalogo_oficial_enum" NOT NULL,
    "pais_codigo" character varying(2),
    "codigo" "text" NOT NULL,
    "descripcion" "text" NOT NULL,
    "tarifa_impuesto_referencia" numeric(5,2),
    "activo" boolean DEFAULT true NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."catalogos_oficiales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."categorias_fiscales" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "nombre" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "created_by" "uuid",
    "updated_by" "uuid",
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "chk_cat_fisc_activo_deleted" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."categorias_fiscales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."categorias_producto" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "categoria_padre_id" "uuid",
    "nombre" "text" NOT NULL,
    "ruta_jerarquica" "text",
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "created_by" "uuid",
    "updated_by" "uuid",
    CONSTRAINT "check_self_parent_cat" CHECK ((("categoria_padre_id" IS NULL) OR ("categoria_padre_id" <> "id"))),
    CONSTRAINT "chk_cat_activo" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."categorias_producto" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cliente_tags" (
    "empresa_id" "uuid" NOT NULL,
    "cliente_id" "uuid" NOT NULL,
    "tag_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."cliente_tags" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."clientes" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "cliente_padre_id" "uuid",
    "nombre_comercial" "text" NOT NULL,
    "razon_social" "text",
    "tipo_identificacion_codigo" character varying(20),
    "numero_identificacion" "text",
    "responsable_comercial_id" "uuid",
    "zona_id" "uuid",
    "industria_id" "uuid",
    "tipo_cliente_id" "uuid",
    "origen_id" "uuid",
    "categoria_fiscal_id" "uuid",
    "estado_comercial" "public"."estado_comercial_enum" DEFAULT 'prospecto'::"public"."estado_comercial_enum" NOT NULL,
    "moneda_preferida_codigo" character varying(3),
    "dias_credito" integer DEFAULT 0 NOT NULL,
    "limite_credito" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "descuento_maximo_permitido" numeric(5,2) DEFAULT 0.00 NOT NULL,
    "metadata" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_by" "uuid",
    "updated_by" "uuid",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "condicion_pago" character varying(20) DEFAULT 'contado'::character varying NOT NULL,
    CONSTRAINT "check_self_parent" CHECK ((("cliente_padre_id" IS NULL) OR ("cliente_padre_id" <> "id"))),
    CONSTRAINT "chk_cli_identificacion_format" CHECK ((("numero_identificacion" IS NULL) OR ("numero_identificacion" = "upper"("regexp_replace"("numero_identificacion", '[^0-9A-Za-z]'::"text", ''::"text", 'g'::"text"))))),
    CONSTRAINT "chk_clientes_activo_deleted" CHECK ((("deleted_at" IS NULL) OR ("activo" = false))),
    CONSTRAINT "clientes_condicion_pago_check" CHECK ((("condicion_pago")::"text" = ANY ((ARRAY['contado'::character varying, 'credito'::character varying])::"text"[]))),
    CONSTRAINT "clientes_descuento_maximo_permitido_check" CHECK ((("descuento_maximo_permitido" >= (0)::numeric) AND ("descuento_maximo_permitido" <= (100)::numeric))),
    CONSTRAINT "clientes_dias_credito_check" CHECK (("dias_credito" >= 0)),
    CONSTRAINT "clientes_limite_credito_check" CHECK (("limite_credito" >= (0)::numeric))
);


ALTER TABLE "public"."clientes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."condiciones_pago" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "codigo" character varying(20) NOT NULL,
    "nombre" "text" NOT NULL,
    "dias_credito" integer DEFAULT 0 NOT NULL,
    "activo" boolean DEFAULT true NOT NULL
);


ALTER TABLE "public"."condiciones_pago" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."contactos_cliente" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "cliente_id" "uuid" NOT NULL,
    "nombre_completo" "text" NOT NULL,
    "email" "text",
    "es_principal" boolean DEFAULT false,
    "deleted_by_cascade" boolean DEFAULT false,
    "created_by" "uuid",
    "updated_by" "uuid",
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."contactos_cliente" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."costos_producto" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "proveedor_id" "uuid",
    "tipo_costo" "public"."tipo_costo_enum" DEFAULT 'estandar'::"public"."tipo_costo_enum" NOT NULL,
    "moneda_codigo" character varying(3) NOT NULL,
    "costo_unitario" numeric(15,4) NOT NULL,
    "valida_desde" timestamp with time zone DEFAULT "now"() NOT NULL,
    "valida_hasta" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    CONSTRAINT "costos_producto_costo_unitario_check" CHECK (("costo_unitario" >= (0)::numeric))
);


ALTER TABLE "public"."costos_producto" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cotizacion_aprobaciones" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "cotizacion_id" "uuid" NOT NULL,
    "politica_id" "uuid" NOT NULL,
    "estado" "public"."estado_aprobacion_enum" DEFAULT 'pendiente'::"public"."estado_aprobacion_enum" NOT NULL,
    "solicitado_por" "uuid" NOT NULL,
    "evaluado_por" "uuid",
    "justificacion_solicitud" "text",
    "notas_evaluador" "text",
    "fecha_solicitud" timestamp with time zone DEFAULT "now"() NOT NULL,
    "fecha_evaluacion" timestamp with time zone
);


ALTER TABLE "public"."cotizacion_aprobaciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cotizacion_eventos" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "cotizacion_id" "uuid" NOT NULL,
    "tipo_evento" "public"."evento_cotizacion_enum" NOT NULL,
    "actor_id" "uuid" NOT NULL,
    "descripcion" "text" NOT NULL,
    "detalles_json" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."cotizacion_eventos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cotizacion_grupos" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "secuencial_visual" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."cotizacion_grupos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cotizacion_lineas" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "cotizacion_id" "uuid" NOT NULL,
    "producto_id" "uuid",
    "tipo_producto_congelado" "public"."tipo_producto_enum" NOT NULL,
    "sku_congelado" character varying(50),
    "nombre_congelado" "text" NOT NULL,
    "descripcion_congelada" "text",
    "atributos_snapshot" "jsonb" DEFAULT '{}'::"jsonb",
    "clasificadores_oficiales_snapshot" "jsonb" DEFAULT '{}'::"jsonb",
    "cantidad" numeric(14,4) NOT NULL,
    "precio_unitario" numeric(15,4) DEFAULT 0.00 NOT NULL,
    "porcentaje_descuento" numeric(5,2) DEFAULT 0.00 NOT NULL,
    "monto_descuento" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "porcentaje_impuesto" numeric(5,2) DEFAULT 0.00 NOT NULL,
    "monto_impuesto" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "total_linea" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "costo_unitario_base" numeric(15,4) DEFAULT 0.00 NOT NULL,
    "margen_linea_base" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "orden_impresion" integer DEFAULT 0 NOT NULL,
    "es_opcional" boolean DEFAULT false NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    "updated_by" "uuid",
    CONSTRAINT "cotizacion_lineas_cantidad_check" CHECK (("cantidad" > (0)::numeric))
);


ALTER TABLE "public"."cotizacion_lineas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cotizacion_narrativas_ia" (
    "empresa_id" "uuid" NOT NULL,
    "cotizacion_id" "uuid" NOT NULL,
    "resumen_ejecutivo" "text",
    "objetivos_proyecto" "text",
    "alcance_exclusiones" "text",
    "justificacion_comercial" "text",
    "modelo_ia_generador" character varying(100),
    "revisado_por_humano" boolean DEFAULT false NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."cotizacion_narrativas_ia" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cotizaciones" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "es_plantilla" boolean DEFAULT false NOT NULL,
    "nombre_plantilla" "text",
    "documento_grupo_id" "uuid" NOT NULL,
    "version_numero" integer DEFAULT 1 NOT NULL,
    "clonado_de_id" "uuid",
    "estado" "public"."estado_cotizacion_enum" DEFAULT 'borrador'::"public"."estado_cotizacion_enum" NOT NULL,
    "cliente_id" "uuid",
    "vendedor_id" "uuid" NOT NULL,
    "lista_precio_id" "uuid",
    "moneda_cotizacion" character varying(3) NOT NULL,
    "tasa_cambio_a_base" numeric(15,6) DEFAULT 1.000000 NOT NULL,
    "total_bruto" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "total_descuento" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "total_impuestos" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "total_neto" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "costo_total_base" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "margen_total_base" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "rentabilidad_porcentaje" numeric(5,2) DEFAULT 0.00 NOT NULL,
    "fecha_emision" timestamp with time zone,
    "fecha_vencimiento" timestamp with time zone,
    "notas_comerciales" "text",
    "condiciones_pago" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_by" "uuid",
    "updated_by" "uuid"
);


ALTER TABLE "public"."cotizaciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cpq_reglas_catalogo" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_origen_id" "uuid" NOT NULL,
    "producto_destino_id" "uuid",
    "tipo_regla" "public"."tipo_regla_cpq_enum" NOT NULL,
    "cantidad_limite" numeric(14,4),
    "condicion_atributo" "jsonb",
    "mensaje_error" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."cpq_reglas_catalogo" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cr_catalogo_actividades" (
    "codigo_actividad" character varying(6) NOT NULL,
    "descripcion" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL
);


ALTER TABLE "public"."cr_catalogo_actividades" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cr_catalogo_cabys" (
    "codigo_cabys" character varying(13) NOT NULL,
    "descripcion" "text" NOT NULL,
    "impuesto_default" numeric(5,2) DEFAULT 13.00 NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "vigencia_desde" timestamp with time zone DEFAULT "now"() NOT NULL,
    "vigencia_hasta" timestamp with time zone
);


ALTER TABLE "public"."cr_catalogo_cabys" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cr_documentos_fiscales" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "documento_comercial_id" "uuid" NOT NULL,
    "actividad_economica_codigo" character varying(6),
    "consecutivo_hacienda" character varying(20),
    "clave_hacienda" character varying(50),
    "estado_hacienda" "public"."cr_estado_hacienda_enum" DEFAULT 'borrador'::"public"."cr_estado_hacienda_enum" NOT NULL,
    "estado_aceptacion_receptor" "public"."cr_estado_aceptacion_enum",
    "fecha_envio_hacienda" timestamp with time zone,
    "fecha_respuesta_hacienda" timestamp with time zone,
    "codigo_respuesta_hacienda" character varying(5),
    "mensaje_hacienda" "text",
    "xml_generado_url" "text",
    "xml_firmado_url" "text",
    "xml_respuesta_url" "text"
);


ALTER TABLE "public"."cr_documentos_fiscales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cr_empresa_actividades" (
    "empresa_id" "uuid" NOT NULL,
    "codigo_actividad" character varying(6) NOT NULL,
    "es_principal" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."cr_empresa_actividades" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cr_series_documentales" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "terminal_id" "uuid" NOT NULL,
    "codigo_tipo_hacienda" character varying(2) NOT NULL,
    "secuencia_actual" bigint DEFAULT 0 NOT NULL,
    "activo" boolean DEFAULT true NOT NULL
);


ALTER TABLE "public"."cr_series_documentales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cr_sucursales" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "numero_sucursal" character varying(3) NOT NULL,
    "nombre" "text" NOT NULL,
    CONSTRAINT "cr_sucursales_numero_sucursal_check" CHECK ((("numero_sucursal")::"text" ~ '^[0-9]{3}$'::"text"))
);


ALTER TABLE "public"."cr_sucursales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cr_terminales" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "sucursal_id" "uuid" NOT NULL,
    "numero_terminal" character varying(5) NOT NULL,
    "nombre" "text" NOT NULL,
    CONSTRAINT "cr_terminales_numero_terminal_check" CHECK ((("numero_terminal")::"text" ~ '^[0-9]{5}$'::"text"))
);


ALTER TABLE "public"."cr_terminales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cuentas_contables" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "codigo_cuenta" character varying(50) NOT NULL,
    "nombre_cuenta" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."cuentas_contables" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cxc_transacciones" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "documento_id" "uuid" NOT NULL,
    "monto_transaccion" numeric(15,2) NOT NULL,
    "tipo_transaccion" "public"."tipo_transaccion_cxc_enum" NOT NULL,
    "estado_pago" "public"."estado_pago_enum" DEFAULT 'aplicado'::"public"."estado_pago_enum" NOT NULL,
    "moneda_pago" character varying(3) NOT NULL,
    "tasa_cambio_a_factura" numeric(15,6) DEFAULT 1.000000 NOT NULL,
    "referencia_bancaria" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    CONSTRAINT "cxc_transacciones_monto_transaccion_check" CHECK (("monto_transaccion" > (0)::numeric))
);


ALTER TABLE "public"."cxc_transacciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cxp_transacciones" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "documento_id" "uuid" NOT NULL,
    "monto_transaccion" numeric(15,2) NOT NULL,
    "tipo_transaccion" "public"."tipo_transaccion_cxp_enum" NOT NULL,
    "estado_pago" "public"."estado_pago_enum" DEFAULT 'aplicado'::"public"."estado_pago_enum" NOT NULL,
    "moneda_pago" character varying(3) NOT NULL,
    "tasa_cambio_a_factura" numeric(15,6) DEFAULT 1.000000 NOT NULL,
    "referencia_documento" character varying(100),
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    CONSTRAINT "cxp_transacciones_monto_transaccion_check" CHECK (("monto_transaccion" > (0)::numeric))
);


ALTER TABLE "public"."cxp_transacciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."direcciones_cliente" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "cliente_id" "uuid" NOT NULL,
    "tipo_direccion" "public"."tipo_direccion_enum" DEFAULT 'fiscal'::"public"."tipo_direccion_enum" NOT NULL,
    "direccion_linea1" "text" NOT NULL,
    "es_principal" boolean DEFAULT false,
    "deleted_by_cascade" boolean DEFAULT false,
    "created_by" "uuid",
    "updated_by" "uuid",
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."direcciones_cliente" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."documentos_comerciales" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "tipo_documento" "public"."tipo_documento_comercial_enum" NOT NULL,
    "estado_operativo" "public"."estado_operativo_enum" DEFAULT 'borrador'::"public"."estado_operativo_enum" NOT NULL,
    "documento_padre_id" "uuid",
    "cotizacion_id" "uuid",
    "cliente_id" "uuid",
    "proveedor_id" "uuid",
    "moneda_documento" character varying(3) NOT NULL,
    "tipo_cambio_emision" numeric(15,6) DEFAULT 1.000000 NOT NULL,
    "condicion_pago_id" "uuid",
    "consecutivo_visual" character varying(50) NOT NULL,
    "entidad_identificacion_tipo" character varying(10),
    "entidad_identificacion_numero" character varying(50),
    "entidad_nombre" "text",
    "entidad_email" character varying(255),
    "monto_bruto" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "monto_descuento" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "monto_impuesto" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "monto_total" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "saldo_pendiente" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "fecha_emision" timestamp with time zone DEFAULT "now"() NOT NULL,
    "fecha_vencimiento" timestamp with time zone,
    "notas_comerciales" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_by" "uuid",
    CONSTRAINT "chk_doc_montos" CHECK (("monto_total" >= (0)::numeric)),
    CONSTRAINT "chk_doc_saldo" CHECK ((("saldo_pendiente" >= (0)::numeric) AND ("saldo_pendiente" <= "monto_total"))),
    CONSTRAINT "chk_entidad_documento" CHECK (((("tipo_documento" = ANY (ARRAY['pedido_venta'::"public"."tipo_documento_comercial_enum", 'factura_venta'::"public"."tipo_documento_comercial_enum", 'nota_credito'::"public"."tipo_documento_comercial_enum", 'nota_debito'::"public"."tipo_documento_comercial_enum", 'tiquete_electronico'::"public"."tipo_documento_comercial_enum", 'factura_exportacion'::"public"."tipo_documento_comercial_enum"])) AND ("cliente_id" IS NOT NULL) AND ("proveedor_id" IS NULL)) OR (("tipo_documento" = ANY (ARRAY['orden_compra'::"public"."tipo_documento_comercial_enum", 'factura_compra'::"public"."tipo_documento_comercial_enum"])) AND ("proveedor_id" IS NOT NULL) AND ("cliente_id" IS NULL))))
);


ALTER TABLE "public"."documentos_comerciales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."documentos_historial_estados" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "documento_id" "uuid" NOT NULL,
    "estado_anterior" "public"."estado_operativo_enum",
    "estado_nuevo" "public"."estado_operativo_enum" NOT NULL,
    "cambiado_por" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."documentos_historial_estados" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."documentos_versiones" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "documento_comercial_id" "uuid" NOT NULL,
    "version_numero" integer NOT NULL,
    "snapshot_json" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid"
);


ALTER TABLE "public"."documentos_versiones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."empresa_suscripciones" (
    "empresa_id" "uuid" NOT NULL,
    "plan_id" "uuid" NOT NULL,
    "estado" character varying(20) DEFAULT 'activa'::character varying NOT NULL,
    "feature_flags" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "fecha_renovacion" timestamp with time zone NOT NULL
);


ALTER TABLE "public"."empresa_suscripciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."empresas" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre_comercial" "text" NOT NULL,
    "moneda_base" "text" DEFAULT 'USD'::"text" NOT NULL,
    "iva_default" numeric(5,2) DEFAULT 13.00 NOT NULL,
    "estado" "public"."empresa_estado_enum" DEFAULT 'trial'::"public"."empresa_estado_enum" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted_at" timestamp with time zone,
    "giro_comercial" "public"."giro_comercial_enum" DEFAULT 'otro'::"public"."giro_comercial_enum" NOT NULL,
    "sub_nicho" "text"
);


ALTER TABLE "public"."empresas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."eventos_consumo" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "suscripcion_id" "uuid" NOT NULL,
    "evento_tipo" "text" NOT NULL,
    "cantidad" numeric(14,4) DEFAULT 1.00 NOT NULL,
    "metadata" "jsonb" DEFAULT '{}'::"jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."eventos_consumo" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."finanzas_eventos" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "tipo_evento" "public"."evento_finanzas_enum" NOT NULL,
    "documento_referencia_id" "uuid" NOT NULL,
    "actor_id" "uuid" NOT NULL,
    "descripcion" "text" NOT NULL,
    "monto_anterior" numeric(15,2),
    "monto_nuevo" numeric(15,2),
    "detalles_json" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."finanzas_eventos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."grupos_fiscales" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "codigo" "text" NOT NULL,
    "nombre" "text" NOT NULL,
    "porcentaje" numeric(5,2) DEFAULT 0.00 NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "created_by" "uuid",
    "updated_by" "uuid",
    CONSTRAINT "chk_gfisc_activo" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."grupos_fiscales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."ia_feedback" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "usuario_id" "uuid",
    "consulta_original" "text" NOT NULL,
    "intencion_detectada_json" "jsonb",
    "intencion_corregida_json" "jsonb",
    "fue_aceptada" boolean DEFAULT true,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."ia_feedback" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."ia_prompts_externos" (
    "empresa_id" "uuid" NOT NULL,
    "codigo_accion" character varying(50) NOT NULL,
    "motor_predeterminado" character varying(50) DEFAULT 'google'::character varying NOT NULL,
    "plantilla_prompt" "text" NOT NULL
);


ALTER TABLE "public"."ia_prompts_externos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."impuestos" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "codigo_impuesto" character varying(20) NOT NULL,
    "nombre" "text" NOT NULL,
    "tarifa_porcentaje" numeric(5,2) NOT NULL,
    "activo" boolean DEFAULT true NOT NULL
);


ALTER TABLE "public"."impuestos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."industrias" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "nombre" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "created_by" "uuid",
    "updated_by" "uuid",
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "chk_industrias_activo_deleted" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."industrias" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventario_lotes" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "numero_lote_serie" character varying(100) NOT NULL,
    "fecha_vencimiento" timestamp with time zone,
    "fecha_fabricacion" timestamp with time zone
);


ALTER TABLE "public"."inventario_lotes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventario_movimientos" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "bodega_origen_id" "uuid",
    "bodega_destino_id" "uuid",
    "lote_id" "uuid",
    "ubicacion_origen_id" "uuid",
    "ubicacion_destino_id" "uuid",
    "cantidad" numeric(14,4) NOT NULL,
    "tipo_movimiento" "public"."tipo_movimiento_kardex_enum" NOT NULL,
    "documento_comercial_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    CONSTRAINT "chk_mov_dir" CHECK ((("bodega_origen_id" IS NOT NULL) OR ("bodega_destino_id" IS NOT NULL))),
    CONSTRAINT "inventario_movimientos_cantidad_check" CHECK (("cantidad" > (0)::numeric))
);


ALTER TABLE "public"."inventario_movimientos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventario_reservas" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "documento_comercial_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "cantidad" numeric(14,4) NOT NULL,
    "estado" character varying(20) DEFAULT 'activa'::character varying NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "inventario_reservas_cantidad_check" CHECK (("cantidad" > (0)::numeric))
);


ALTER TABLE "public"."inventario_reservas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventario_saldos" (
    "empresa_id" "uuid" NOT NULL,
    "bodega_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "stock_fisico" numeric(14,4) DEFAULT 0.0000 NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "chk_stock_fisico" CHECK (("stock_fisico" >= (0)::numeric))
);


ALTER TABLE "public"."inventario_saldos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."inventario_ubicaciones" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "bodega_id" "uuid" NOT NULL,
    "codigo_ubicacion" character varying(50) NOT NULL
);


ALTER TABLE "public"."inventario_ubicaciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."invitaciones" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "email" "text" NOT NULL,
    "rol" "public"."rol_enum" DEFAULT 'seller'::"public"."rol_enum" NOT NULL,
    "token" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "estado" "public"."estado_invitacion_enum" DEFAULT 'pendiente'::"public"."estado_invitacion_enum" NOT NULL,
    "fecha_expiracion" timestamp with time zone DEFAULT ("now"() + '7 days'::interval) NOT NULL,
    "invitado_por" "uuid" NOT NULL,
    "accepted_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "check_email_format" CHECK (("email" = "lower"(TRIM(BOTH FROM "email"))))
);

ALTER TABLE ONLY "public"."invitaciones" FORCE ROW LEVEL SECURITY;


ALTER TABLE "public"."invitaciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."lineas_documento" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "documento_id" "uuid" NOT NULL,
    "numero_linea" integer NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "cuenta_contable_id" "uuid",
    "impuesto_id" "uuid",
    "cantidad_solicitada" numeric(14,4) NOT NULL,
    "cantidad_procesada" numeric(14,4) DEFAULT 0.0000 NOT NULL,
    "precio_unitario" numeric(15,4) NOT NULL,
    "subtotal_linea" numeric(15,2) NOT NULL,
    "monto_descuento" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "impuesto_nombre_snapshot" "text",
    "impuesto_tarifa_snapshot" numeric(5,2) DEFAULT 0.00 NOT NULL,
    "impuesto_monto" numeric(15,2) DEFAULT 0.00 NOT NULL,
    "total_linea" numeric(15,2) NOT NULL,
    CONSTRAINT "chk_procesada" CHECK ((("cantidad_procesada" >= (0)::numeric) AND ("cantidad_procesada" <= "cantidad_solicitada"))),
    CONSTRAINT "lineas_documento_cantidad_solicitada_check" CHECK (("cantidad_solicitada" > (0)::numeric)),
    CONSTRAINT "lineas_documento_numero_linea_check" CHECK (("numero_linea" > 0))
);


ALTER TABLE "public"."lineas_documento" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."listas_precios" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre" "text" NOT NULL,
    "prioridad" integer DEFAULT 0 NOT NULL,
    "moneda_codigo" character varying(3) NOT NULL,
    "zona_id" "uuid",
    "tipo_cliente_id" "uuid",
    "valida_desde" timestamp with time zone DEFAULT "now"() NOT NULL,
    "valida_hasta" timestamp with time zone,
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "created_by" "uuid",
    "updated_by" "uuid",
    CONSTRAINT "chk_fechas_lista" CHECK ((("valida_hasta" IS NULL) OR ("valida_hasta" > "valida_desde")))
);


ALTER TABLE "public"."listas_precios" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."marcas" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "created_by" "uuid",
    "updated_by" "uuid",
    CONSTRAINT "chk_marcas_activo" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."marcas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."monedas" (
    "codigo" character varying(3) NOT NULL,
    "nombre" "text" NOT NULL,
    "simbolo" character varying(5) NOT NULL,
    "decimales" integer DEFAULT 2 NOT NULL
);


ALTER TABLE "public"."monedas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."origenes_cliente" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "nombre" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "created_by" "uuid",
    "updated_by" "uuid",
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "chk_origenes_activo_deleted" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."origenes_cliente" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."perfiles" (
    "id" "uuid" NOT NULL,
    "empresa_id" "uuid",
    "rol" "public"."rol_enum" DEFAULT 'viewer'::"public"."rol_enum" NOT NULL,
    "nombre_completo" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted_at" timestamp with time zone,
    "activo" boolean DEFAULT true NOT NULL,
    "invitado_por" "uuid"
);


ALTER TABLE "public"."perfiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."plan_configuracion" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "plan_id" "uuid" NOT NULL,
    "caracteristica_id" "uuid" NOT NULL,
    "valor_int" integer,
    "valor_bool" boolean,
    "valor_decimal" numeric(14,4),
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "check_valor_unico" CHECK (((((("valor_int" IS NOT NULL))::integer + (("valor_bool" IS NOT NULL))::integer) + (("valor_decimal" IS NOT NULL))::integer) = 1))
);


ALTER TABLE "public"."plan_configuracion" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."planes" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre" "text" NOT NULL,
    "nivel_jerarquia" integer DEFAULT 1 NOT NULL,
    "precio_base" numeric(10,2) DEFAULT 0.00 NOT NULL,
    "periodo_meses" integer DEFAULT 1 NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted_at" timestamp with time zone
);


ALTER TABLE "public"."planes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."politicas_comerciales" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre" "text" NOT NULL,
    "tipo_politica" "public"."tipo_politica_enum" NOT NULL,
    "nivel_evaluacion" "public"."nivel_evaluacion_enum" DEFAULT 'documento'::"public"."nivel_evaluacion_enum" NOT NULL,
    "prioridad" integer DEFAULT 0 NOT NULL,
    "aplicar_a_categoria_id" "uuid",
    "aplicar_a_producto_id" "uuid",
    "aplicar_a_tipo_cliente_id" "uuid",
    "aplicar_a_cliente_id" "uuid",
    "aplicar_a_rol" character varying(50),
    "umbral_numerico" numeric(15,2) NOT NULL,
    "accion" "public"."accion_politica_enum" DEFAULT 'solicitar_aprobacion'::"public"."accion_politica_enum" NOT NULL,
    "roles_aprobadores" character varying(50)[] DEFAULT ARRAY['admin'::character varying(50)],
    "mensaje_advertencia" "text",
    "activo" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted_at" timestamp with time zone
);


ALTER TABLE "public"."politicas_comerciales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."precio_escalas" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "precio_producto_id" "uuid" NOT NULL,
    "cantidad_minima" numeric(14,4) NOT NULL,
    "precio_unitario" numeric(15,4) NOT NULL,
    CONSTRAINT "precio_escalas_cantidad_minima_check" CHECK (("cantidad_minima" > (1)::numeric)),
    CONSTRAINT "precio_escalas_precio_unitario_check" CHECK (("precio_unitario" >= (0)::numeric))
);


ALTER TABLE "public"."precio_escalas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."precios_producto" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "lista_precio_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "precio_base" numeric(15,4) NOT NULL,
    "descuento_max_permitido" numeric(5,2) DEFAULT 0.00,
    "valida_desde" timestamp with time zone DEFAULT "now"() NOT NULL,
    "valida_hasta" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid",
    CONSTRAINT "precios_producto_precio_base_check" CHECK (("precio_base" >= (0)::numeric))
);


ALTER TABLE "public"."precios_producto" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_atributos_valores" (
    "empresa_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "atributo_id" "uuid" NOT NULL,
    "valor_texto" "text",
    "valor_numero" numeric(15,4),
    "valor_booleano" boolean,
    "valor_fecha" timestamp with time zone,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "created_by" "uuid",
    "updated_by" "uuid"
);


ALTER TABLE "public"."producto_atributos_valores" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_codigos_oficiales" (
    "empresa_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "catalogo_oficial_id" "uuid" NOT NULL
);


ALTER TABLE "public"."producto_codigos_oficiales" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_compatibilidades" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "contexto_compatibilidad" character varying(50) NOT NULL,
    "valor_compatibilidad" character varying(100) NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "created_by" "uuid",
    "updated_by" "uuid"
);


ALTER TABLE "public"."producto_compatibilidades" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_componentes" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_padre_id" "uuid" NOT NULL,
    "producto_hijo_id" "uuid" NOT NULL,
    "cantidad" numeric(14,4) NOT NULL,
    "regla_seleccion" "public"."regla_seleccion_bom_enum" DEFAULT 'requerido'::"public"."regla_seleccion_bom_enum" NOT NULL,
    "orden_visualizacion" integer DEFAULT 0,
    "valida_desde" timestamp with time zone DEFAULT "now"() NOT NULL,
    "valida_hasta" timestamp with time zone,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "created_by" "uuid",
    "updated_by" "uuid",
    CONSTRAINT "chk_no_self_component" CHECK (("producto_padre_id" <> "producto_hijo_id")),
    CONSTRAINT "producto_componentes_cantidad_check" CHECK (("cantidad" > (0)::numeric))
);


ALTER TABLE "public"."producto_componentes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_embeddings" (
    "empresa_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "modelo_embedding" character varying(100) DEFAULT 'text-embedding-3-small'::character varying NOT NULL,
    "version_modelo" character varying(50) DEFAULT 'v1'::character varying NOT NULL,
    "vector_data" "public"."vector"(1536) NOT NULL
);


ALTER TABLE "public"."producto_embeddings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_proveedores" (
    "empresa_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "proveedor_id" "uuid" NOT NULL,
    "es_principal" boolean DEFAULT false NOT NULL,
    "codigo_proveedor" character varying(100),
    "tiempo_entrega_dias" integer DEFAULT 0,
    "moneda_codigo" character varying(3) DEFAULT 'USD'::character varying NOT NULL,
    "costo_catalogo" numeric(15,4) DEFAULT 0.0000 NOT NULL,
    "cantidad_minima_orden" numeric(14,4) DEFAULT 1.0000 NOT NULL,
    "fecha_ultima_cotizacion" timestamp with time zone DEFAULT "now"(),
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "chk_costo_valido" CHECK (("costo_catalogo" >= (0)::numeric)),
    CONSTRAINT "chk_moq_valido" CHECK (("cantidad_minima_orden" > (0)::numeric))
);


ALTER TABLE "public"."producto_proveedores" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_recursos" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "tipo" "public"."tipo_recurso_enum" NOT NULL,
    "nombre_archivo" "text" NOT NULL,
    "url_acceso" "text" NOT NULL
);


ALTER TABLE "public"."producto_recursos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_relaciones" (
    "empresa_id" "uuid" NOT NULL,
    "producto_origen_id" "uuid" NOT NULL,
    "producto_destino_id" "uuid" NOT NULL,
    "tipo_relacion" "public"."tipo_relacion_producto_enum" NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "created_by" "uuid",
    "updated_by" "uuid"
);


ALTER TABLE "public"."producto_relaciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."producto_search_index" (
    "empresa_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "search_document" "text" NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."producto_search_index" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."productos" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_padre_id" "uuid",
    "variant_key" character varying(255),
    "atributos_variante" "jsonb" DEFAULT '{}'::"jsonb",
    "tipo_producto" "public"."tipo_producto_enum" DEFAULT 'fisico'::"public"."tipo_producto_enum" NOT NULL,
    "codigo_sku" character varying(50),
    "codigo_barras" character varying(100),
    "codigos_clasificacion" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "categoria_id" "uuid",
    "marca_id" "uuid",
    "unidad_medida_id" "uuid" NOT NULL,
    "grupo_fiscal_id" "uuid",
    "nombre" "text" NOT NULL,
    "descripcion_corta" "text",
    "permite_descuento" boolean DEFAULT true NOT NULL,
    "es_vendible" boolean DEFAULT true NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "created_by" "uuid",
    "updated_by" "uuid",
    "descripcion_larga" "text",
    CONSTRAINT "chk_prod_activo" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."productos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."productos_fisicos" (
    "empresa_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "controla_inventario" boolean DEFAULT true NOT NULL,
    "peso_kg" numeric(10,4),
    "volumen_m3" numeric(10,4),
    "stock_minimo" numeric(14,4) DEFAULT 0,
    "punto_reorden" numeric(14,4) DEFAULT 0
);


ALTER TABLE "public"."productos_fisicos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."productos_servicios" (
    "empresa_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "horas_estimadas" numeric(8,2),
    "perfiles_requeridos" "text"[]
);


ALTER TABLE "public"."productos_servicios" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."productos_suscripciones" (
    "empresa_id" "uuid" NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "ciclo_facturacion" "public"."facturacion_ciclo_enum" DEFAULT 'mensual'::"public"."facturacion_ciclo_enum" NOT NULL,
    "renovacion_automatica" boolean DEFAULT true NOT NULL,
    "limite_consumo" numeric(15,2)
);


ALTER TABLE "public"."productos_suscripciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."proveedores" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre_comercial" "text" NOT NULL,
    "razon_social" "text",
    "identificacion_fiscal" "text",
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "created_by" "uuid",
    "updated_by" "uuid",
    CONSTRAINT "chk_prov_activo" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."proveedores" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."recurso_chunks" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "recurso_id" "uuid" NOT NULL,
    "contenido_texto" "text" NOT NULL,
    "modelo_embedding" character varying(100) DEFAULT 'text-embedding-3-small'::character varying NOT NULL,
    "version_modelo" character varying(50) DEFAULT 'v1'::character varying NOT NULL,
    "vector_data" "public"."vector"(1536) NOT NULL
);


ALTER TABLE "public"."recurso_chunks" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."saas_planes" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nombre" character varying(50) NOT NULL,
    "limite_usuarios" integer DEFAULT 1 NOT NULL,
    "limite_productos" integer DEFAULT 100 NOT NULL,
    "modulos_activos" "jsonb" DEFAULT '{"inventario": false, "hacienda_cr": false}'::"jsonb" NOT NULL,
    "precio_mensual" numeric(10,2) NOT NULL
);


ALTER TABLE "public"."saas_planes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."search_reindex_queue" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "producto_id" "uuid" NOT NULL,
    "estado" "public"."estado_indexacion_enum" DEFAULT 'pendiente'::"public"."estado_indexacion_enum" NOT NULL,
    "intentos" integer DEFAULT 0 NOT NULL,
    "ultimo_error" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."search_reindex_queue" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."sistema_eventos_bus" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "topico" character varying(100) NOT NULL,
    "payload" "jsonb" NOT NULL,
    "idempotency_key" character varying(100),
    "estado" "public"."estado_evento_enum" DEFAULT 'pendiente'::"public"."estado_evento_enum" NOT NULL,
    "intentos" integer DEFAULT 0 NOT NULL,
    "proximo_reintento" timestamp with time zone,
    "error_log" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "procesado_at" timestamp with time zone
);


ALTER TABLE "public"."sistema_eventos_bus" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."sistema_observabilidad_logs" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid",
    "nivel" character varying(15) DEFAULT 'INFO'::character varying NOT NULL,
    "origen" character varying(50) NOT NULL,
    "mensaje" "text" NOT NULL,
    "detalles_json" "jsonb" DEFAULT '{}'::"jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."sistema_observabilidad_logs" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."suscripciones" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "plan_id" "uuid" NOT NULL,
    "tipo_suscripcion" "public"."suscripcion_tipo_enum" DEFAULT 'trial'::"public"."suscripcion_tipo_enum" NOT NULL,
    "estado" "public"."suscripcion_estado_enum" DEFAULT 'activa'::"public"."suscripcion_estado_enum" NOT NULL,
    "renovacion_automatica" boolean DEFAULT true NOT NULL,
    "proveedor_pago" "text" DEFAULT 'stripe'::"text",
    "referencia_pago" "text",
    "fecha_inicio" timestamp with time zone DEFAULT "now"() NOT NULL,
    "fecha_fin" timestamp with time zone NOT NULL,
    "es_activa_actual" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted_at" timestamp with time zone,
    CONSTRAINT "check_fechas_suscripcion" CHECK (("fecha_fin" > "fecha_inicio"))
);


ALTER TABLE "public"."suscripciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tags" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "nombre" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "created_by" "uuid",
    "updated_by" "uuid",
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "chk_tags_activo_deleted" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."tags" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tenant_ia_limits" (
    "empresa_id" "uuid" NOT NULL,
    "max_requests_mes" integer DEFAULT 500 NOT NULL,
    "max_costo_usd_mes" numeric(10,2) DEFAULT 5.00 NOT NULL,
    "bloqueado_por_limite" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."tenant_ia_limits" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tenant_ia_usage" (
    "empresa_id" "uuid" NOT NULL,
    "mes" character varying(7) NOT NULL,
    "requests" integer DEFAULT 0,
    "costo_usd" numeric(10,4) DEFAULT 0.00
);


ALTER TABLE "public"."tenant_ia_usage" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tenant_usage" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "suscripcion_id" "uuid" NOT NULL,
    "caracteristica_id" "uuid" NOT NULL,
    "consumo_acumulado" numeric(14,4) DEFAULT 0.00 NOT NULL,
    "periodo_inicio" timestamp with time zone NOT NULL,
    "periodo_fin" timestamp with time zone NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."tenant_usage" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tipos_cambio_historico" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "moneda_origen" character varying(3) NOT NULL,
    "moneda_destino" character varying(3) NOT NULL,
    "tasa_cambio" numeric(15,6) NOT NULL,
    "valida_desde" timestamp with time zone DEFAULT "now"() NOT NULL,
    "valida_hasta" timestamp with time zone,
    CONSTRAINT "tipos_cambio_historico_tasa_cambio_check" CHECK (("tasa_cambio" > (0)::numeric))
);


ALTER TABLE "public"."tipos_cambio_historico" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tipos_cliente" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "nombre" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "created_by" "uuid",
    "updated_by" "uuid",
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "chk_tipos_cli_activo_deleted" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."tipos_cliente" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tipos_identificacion" (
    "codigo" character varying(20) NOT NULL,
    "nombre" "text" NOT NULL,
    "pais_codigo" character varying(2)
);


ALTER TABLE "public"."tipos_identificacion" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."unidades_medida" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "codigo" character varying(10) NOT NULL,
    "nombre" "text" NOT NULL,
    "permite_fracciones" boolean DEFAULT false NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "created_by" "uuid",
    "updated_by" "uuid",
    CONSTRAINT "chk_uom_activo" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."unidades_medida" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."vw_inventario_disponibilidad" AS
 SELECT "s"."empresa_id",
    "s"."producto_id",
    "sum"("s"."stock_fisico") FILTER (WHERE ("b"."tipo_bodega" = 'disponible'::"public"."tipo_bodega_enum")) AS "stock_disponible",
    "sum"("s"."stock_fisico") FILTER (WHERE ("b"."tipo_bodega" = 'reservada'::"public"."tipo_bodega_enum")) AS "stock_reservado",
    "sum"("s"."stock_fisico") FILTER (WHERE ("b"."tipo_bodega" = ANY (ARRAY['cuarentena'::"public"."tipo_bodega_enum", 'obsoleta_merma'::"public"."tipo_bodega_enum"]))) AS "stock_bloqueado",
    "sum"("s"."stock_fisico") AS "stock_total_fisico"
   FROM ("public"."inventario_saldos" "s"
     JOIN "public"."bodegas" "b" ON ((("s"."bodega_id" = "b"."id") AND ("s"."empresa_id" = "b"."empresa_id"))))
  GROUP BY "s"."empresa_id", "s"."producto_id";


ALTER VIEW "public"."vw_inventario_disponibilidad" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."workflow_transiciones" (
    "empresa_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "tipo_documento" "public"."tipo_documento_comercial_enum" NOT NULL,
    "estado_origen" "public"."estado_operativo_enum" NOT NULL,
    "estado_destino" "public"."estado_operativo_enum" NOT NULL,
    "rol_requerido" character varying(50)
);


ALTER TABLE "public"."workflow_transiciones" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."zonas" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "empresa_id" "uuid" NOT NULL,
    "nombre" "text" NOT NULL,
    "activo" boolean DEFAULT true NOT NULL,
    "created_by" "uuid",
    "updated_by" "uuid",
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "chk_zonas_activo_deleted" CHECK ((("deleted_at" IS NULL) OR ("activo" = false)))
);


ALTER TABLE "public"."zonas" OWNER TO "postgres";


ALTER TABLE ONLY "public"."atributos_catalogo"
    ADD CONSTRAINT "atributos_catalogo_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."audit_eventos"
    ADD CONSTRAINT "audit_eventos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."bodegas"
    ADD CONSTRAINT "bodegas_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cache_consultas_ia"
    ADD CONSTRAINT "cache_consultas_ia_pkey" PRIMARY KEY ("empresa_id", "query_hash", "version_modelo");



ALTER TABLE ONLY "public"."caracteristicas"
    ADD CONSTRAINT "caracteristicas_codigo_key" UNIQUE ("codigo");



ALTER TABLE ONLY "public"."caracteristicas"
    ADD CONSTRAINT "caracteristicas_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."catalogo_sinonimos"
    ADD CONSTRAINT "catalogo_sinonimos_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."catalogos_oficiales"
    ADD CONSTRAINT "catalogos_oficiales_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."categorias_fiscales"
    ADD CONSTRAINT "categorias_fiscales_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."categorias_producto"
    ADD CONSTRAINT "categorias_producto_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."producto_componentes"
    ADD CONSTRAINT "chk_bom_no_overlap" EXCLUDE USING "gist" ("empresa_id" WITH =, "producto_padre_id" WITH =, "producto_hijo_id" WITH =, "tstzrange"("valida_desde", "valida_hasta") WITH &&);



ALTER TABLE ONLY "public"."precios_producto"
    ADD CONSTRAINT "chk_precios_no_overlap" EXCLUDE USING "gist" ("empresa_id" WITH =, "lista_precio_id" WITH =, "producto_id" WITH =, "tstzrange"("valida_desde", "valida_hasta") WITH &&);



ALTER TABLE ONLY "public"."tipos_cambio_historico"
    ADD CONSTRAINT "chk_tc_no_overlap" EXCLUDE USING "gist" ("empresa_id" WITH =, "moneda_origen" WITH =, "moneda_destino" WITH =, "tstzrange"("valida_desde", "valida_hasta") WITH &&);



ALTER TABLE ONLY "public"."cliente_tags"
    ADD CONSTRAINT "cliente_tags_pkey" PRIMARY KEY ("empresa_id", "cliente_id", "tag_id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."condiciones_pago"
    ADD CONSTRAINT "condiciones_pago_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."contactos_cliente"
    ADD CONSTRAINT "contactos_cliente_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."costos_producto"
    ADD CONSTRAINT "costos_producto_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cotizacion_aprobaciones"
    ADD CONSTRAINT "cotizacion_aprobaciones_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cotizacion_eventos"
    ADD CONSTRAINT "cotizacion_eventos_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cotizacion_grupos"
    ADD CONSTRAINT "cotizacion_grupos_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cotizacion_lineas"
    ADD CONSTRAINT "cotizacion_lineas_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cotizacion_narrativas_ia"
    ADD CONSTRAINT "cotizacion_narrativas_ia_pkey" PRIMARY KEY ("empresa_id", "cotizacion_id");



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "cotizaciones_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cpq_reglas_catalogo"
    ADD CONSTRAINT "cpq_reglas_catalogo_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cr_catalogo_actividades"
    ADD CONSTRAINT "cr_catalogo_actividades_pkey" PRIMARY KEY ("codigo_actividad");



ALTER TABLE ONLY "public"."cr_catalogo_cabys"
    ADD CONSTRAINT "cr_catalogo_cabys_pkey" PRIMARY KEY ("codigo_cabys");



ALTER TABLE ONLY "public"."cr_documentos_fiscales"
    ADD CONSTRAINT "cr_documentos_fiscales_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cr_empresa_actividades"
    ADD CONSTRAINT "cr_empresa_actividades_pkey" PRIMARY KEY ("empresa_id", "codigo_actividad");



ALTER TABLE ONLY "public"."cr_series_documentales"
    ADD CONSTRAINT "cr_series_documentales_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cr_sucursales"
    ADD CONSTRAINT "cr_sucursales_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cr_terminales"
    ADD CONSTRAINT "cr_terminales_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cuentas_contables"
    ADD CONSTRAINT "cuentas_contables_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cxc_transacciones"
    ADD CONSTRAINT "cxc_transacciones_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."cxp_transacciones"
    ADD CONSTRAINT "cxp_transacciones_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."direcciones_cliente"
    ADD CONSTRAINT "direcciones_cliente_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."documentos_comerciales"
    ADD CONSTRAINT "documentos_comerciales_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."documentos_historial_estados"
    ADD CONSTRAINT "documentos_historial_estados_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."documentos_versiones"
    ADD CONSTRAINT "documentos_versiones_empresa_id_documento_comercial_id_vers_key" UNIQUE ("empresa_id", "documento_comercial_id", "version_numero");



ALTER TABLE ONLY "public"."documentos_versiones"
    ADD CONSTRAINT "documentos_versiones_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."empresa_suscripciones"
    ADD CONSTRAINT "empresa_suscripciones_pkey" PRIMARY KEY ("empresa_id");



ALTER TABLE ONLY "public"."empresas"
    ADD CONSTRAINT "empresas_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."eventos_consumo"
    ADD CONSTRAINT "eventos_consumo_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."finanzas_eventos"
    ADD CONSTRAINT "finanzas_eventos_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."grupos_fiscales"
    ADD CONSTRAINT "grupos_fiscales_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."ia_feedback"
    ADD CONSTRAINT "ia_feedback_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."ia_prompts_externos"
    ADD CONSTRAINT "ia_prompts_externos_pkey" PRIMARY KEY ("empresa_id", "codigo_accion");



ALTER TABLE ONLY "public"."impuestos"
    ADD CONSTRAINT "impuestos_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."industrias"
    ADD CONSTRAINT "industrias_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."inventario_lotes"
    ADD CONSTRAINT "inventario_lotes_empresa_id_producto_id_numero_lote_serie_key" UNIQUE ("empresa_id", "producto_id", "numero_lote_serie");



ALTER TABLE ONLY "public"."inventario_lotes"
    ADD CONSTRAINT "inventario_lotes_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."inventario_movimientos"
    ADD CONSTRAINT "inventario_movimientos_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."inventario_reservas"
    ADD CONSTRAINT "inventario_reservas_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."inventario_saldos"
    ADD CONSTRAINT "inventario_saldos_pkey" PRIMARY KEY ("empresa_id", "bodega_id", "producto_id");



ALTER TABLE ONLY "public"."inventario_ubicaciones"
    ADD CONSTRAINT "inventario_ubicaciones_empresa_id_bodega_id_codigo_ubicacio_key" UNIQUE ("empresa_id", "bodega_id", "codigo_ubicacion");



ALTER TABLE ONLY "public"."inventario_ubicaciones"
    ADD CONSTRAINT "inventario_ubicaciones_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."invitaciones"
    ADD CONSTRAINT "invitaciones_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."invitaciones"
    ADD CONSTRAINT "invitaciones_token_key" UNIQUE ("token");



ALTER TABLE ONLY "public"."lineas_documento"
    ADD CONSTRAINT "lineas_documento_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."listas_precios"
    ADD CONSTRAINT "listas_precios_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."marcas"
    ADD CONSTRAINT "marcas_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."monedas"
    ADD CONSTRAINT "monedas_pkey" PRIMARY KEY ("codigo");



ALTER TABLE ONLY "public"."origenes_cliente"
    ADD CONSTRAINT "origenes_cliente_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_empresa_id_id_key" UNIQUE ("empresa_id", "id");



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."plan_configuracion"
    ADD CONSTRAINT "plan_configuracion_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."planes"
    ADD CONSTRAINT "planes_nombre_key" UNIQUE ("nombre");



ALTER TABLE ONLY "public"."planes"
    ADD CONSTRAINT "planes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."politicas_comerciales"
    ADD CONSTRAINT "politicas_comerciales_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."precio_escalas"
    ADD CONSTRAINT "precio_escalas_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."precios_producto"
    ADD CONSTRAINT "precios_producto_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."producto_atributos_valores"
    ADD CONSTRAINT "producto_atributos_valores_pkey" PRIMARY KEY ("empresa_id", "producto_id", "atributo_id");



ALTER TABLE ONLY "public"."producto_codigos_oficiales"
    ADD CONSTRAINT "producto_codigos_oficiales_pkey" PRIMARY KEY ("empresa_id", "producto_id", "catalogo_oficial_id");



ALTER TABLE ONLY "public"."producto_compatibilidades"
    ADD CONSTRAINT "producto_compatibilidades_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."producto_componentes"
    ADD CONSTRAINT "producto_componentes_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."producto_embeddings"
    ADD CONSTRAINT "producto_embeddings_pkey" PRIMARY KEY ("empresa_id", "producto_id");



ALTER TABLE ONLY "public"."producto_proveedores"
    ADD CONSTRAINT "producto_proveedores_pkey" PRIMARY KEY ("empresa_id", "producto_id", "proveedor_id");



ALTER TABLE ONLY "public"."producto_recursos"
    ADD CONSTRAINT "producto_recursos_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."producto_relaciones"
    ADD CONSTRAINT "producto_relaciones_pkey" PRIMARY KEY ("empresa_id", "producto_origen_id", "producto_destino_id", "tipo_relacion");



ALTER TABLE ONLY "public"."producto_search_index"
    ADD CONSTRAINT "producto_search_index_pkey" PRIMARY KEY ("empresa_id", "producto_id");



ALTER TABLE ONLY "public"."productos_fisicos"
    ADD CONSTRAINT "productos_fisicos_pkey" PRIMARY KEY ("empresa_id", "producto_id");



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."productos_servicios"
    ADD CONSTRAINT "productos_servicios_pkey" PRIMARY KEY ("empresa_id", "producto_id");



ALTER TABLE ONLY "public"."productos_suscripciones"
    ADD CONSTRAINT "productos_suscripciones_pkey" PRIMARY KEY ("empresa_id", "producto_id");



ALTER TABLE ONLY "public"."proveedores"
    ADD CONSTRAINT "proveedores_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."recurso_chunks"
    ADD CONSTRAINT "recurso_chunks_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."saas_planes"
    ADD CONSTRAINT "saas_planes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."search_reindex_queue"
    ADD CONSTRAINT "search_reindex_queue_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."sistema_eventos_bus"
    ADD CONSTRAINT "sistema_eventos_bus_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."sistema_observabilidad_logs"
    ADD CONSTRAINT "sistema_observabilidad_logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."suscripciones"
    ADD CONSTRAINT "suscripciones_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."tags"
    ADD CONSTRAINT "tags_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."tenant_ia_limits"
    ADD CONSTRAINT "tenant_ia_limits_pkey" PRIMARY KEY ("empresa_id");



ALTER TABLE ONLY "public"."tenant_ia_usage"
    ADD CONSTRAINT "tenant_ia_usage_pkey" PRIMARY KEY ("empresa_id", "mes");



ALTER TABLE ONLY "public"."tenant_usage"
    ADD CONSTRAINT "tenant_usage_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."tipos_cambio_historico"
    ADD CONSTRAINT "tipos_cambio_historico_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."tipos_cliente"
    ADD CONSTRAINT "tipos_cliente_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."tipos_identificacion"
    ADD CONSTRAINT "tipos_identificacion_pkey" PRIMARY KEY ("codigo");



ALTER TABLE ONLY "public"."unidades_medida"
    ADD CONSTRAINT "unidades_medida_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."plan_configuracion"
    ADD CONSTRAINT "unique_plan_caracteristica" UNIQUE ("plan_id", "caracteristica_id");



ALTER TABLE ONLY "public"."tenant_usage"
    ADD CONSTRAINT "unique_tenant_period_usage" UNIQUE ("empresa_id", "suscripcion_id", "caracteristica_id", "periodo_inicio");



ALTER TABLE ONLY "public"."catalogos_oficiales"
    ADD CONSTRAINT "unq_catalogo_codigo" UNIQUE ("tipo_catalogo", "pais_codigo", "codigo");



ALTER TABLE ONLY "public"."condiciones_pago"
    ADD CONSTRAINT "unq_cond_pago_tenant" UNIQUE ("empresa_id", "codigo");



ALTER TABLE ONLY "public"."cr_documentos_fiscales"
    ADD CONSTRAINT "unq_cr_clave" UNIQUE ("empresa_id", "clave_hacienda");



ALTER TABLE ONLY "public"."cr_documentos_fiscales"
    ADD CONSTRAINT "unq_cr_consecutivo" UNIQUE ("empresa_id", "consecutivo_hacienda");



ALTER TABLE ONLY "public"."cr_documentos_fiscales"
    ADD CONSTRAINT "unq_cr_doc_id" UNIQUE ("empresa_id", "documento_comercial_id");



ALTER TABLE ONLY "public"."cuentas_contables"
    ADD CONSTRAINT "unq_cuenta_tenant" UNIQUE ("empresa_id", "codigo_cuenta");



ALTER TABLE ONLY "public"."documentos_comerciales"
    ADD CONSTRAINT "unq_doc_consecutivo" UNIQUE ("empresa_id", "tipo_documento", "consecutivo_visual");



ALTER TABLE ONLY "public"."sistema_eventos_bus"
    ADD CONSTRAINT "unq_event_idempotency" UNIQUE ("empresa_id", "idempotency_key");



ALTER TABLE ONLY "public"."cotizacion_grupos"
    ADD CONSTRAINT "unq_grupo_secuencial" UNIQUE ("empresa_id", "secuencial_visual");



ALTER TABLE ONLY "public"."impuestos"
    ADD CONSTRAINT "unq_impuesto_tenant" UNIQUE ("empresa_id", "codigo_impuesto");



ALTER TABLE ONLY "public"."lineas_documento"
    ADD CONSTRAINT "unq_linea_orden" UNIQUE ("empresa_id", "documento_id", "numero_linea");



ALTER TABLE ONLY "public"."cr_series_documentales"
    ADD CONSTRAINT "unq_serie_doc" UNIQUE ("empresa_id", "terminal_id", "codigo_tipo_hacienda");



ALTER TABLE ONLY "public"."cr_sucursales"
    ADD CONSTRAINT "unq_sucursal_num" UNIQUE ("empresa_id", "numero_sucursal");



ALTER TABLE ONLY "public"."cr_terminales"
    ADD CONSTRAINT "unq_terminal_num" UNIQUE ("empresa_id", "sucursal_id", "numero_terminal");



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "unq_version_grupo" UNIQUE ("empresa_id", "documento_grupo_id", "version_numero");



ALTER TABLE ONLY "public"."workflow_transiciones"
    ADD CONSTRAINT "unq_workflow_transicion" UNIQUE ("empresa_id", "tipo_documento", "estado_origen", "estado_destino");



ALTER TABLE ONLY "public"."workflow_transiciones"
    ADD CONSTRAINT "workflow_transiciones_pkey" PRIMARY KEY ("empresa_id", "id");



ALTER TABLE ONLY "public"."zonas"
    ADD CONSTRAINT "zonas_pkey" PRIMARY KEY ("empresa_id", "id");



CREATE UNIQUE INDEX "idx_attr_nombre" ON "public"."atributos_catalogo" USING "btree" ("empresa_id", "lower"(TRIM(BOTH FROM "nombre")));



CREATE INDEX "idx_audit_actor" ON "public"."audit_eventos" USING "btree" ("actor_id");



CREATE INDEX "idx_audit_empresa_fecha" ON "public"."audit_eventos" USING "btree" ("empresa_id", "created_at" DESC);



CREATE INDEX "idx_audit_target" ON "public"."audit_eventos" USING "btree" ("target_id");



CREATE UNIQUE INDEX "idx_cat_fisc_nom" ON "public"."categorias_fiscales" USING "btree" ("empresa_id", "lower"(TRIM(BOTH FROM "nombre"))) WHERE ("deleted_at" IS NULL);



CREATE UNIQUE INDEX "idx_cat_prod_nombre" ON "public"."categorias_producto" USING "btree" ("empresa_id", "categoria_padre_id", "lower"(TRIM(BOTH FROM "nombre"))) WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_chunks_hnsw" ON "public"."recurso_chunks" USING "hnsw" ("vector_data" "public"."vector_cosine_ops");



CREATE INDEX "idx_cli_catfisc" ON "public"."clientes" USING "btree" ("empresa_id", "categoria_fiscal_id");



CREATE INDEX "idx_cli_empresa" ON "public"."clientes" USING "btree" ("empresa_id");



CREATE INDEX "idx_cli_empresa_activos" ON "public"."clientes" USING "btree" ("empresa_id", "estado_comercial") WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_cli_empresa_live" ON "public"."clientes" USING "btree" ("empresa_id") WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_cli_empresa_resp" ON "public"."clientes" USING "btree" ("empresa_id", "responsable_comercial_id");



CREATE INDEX "idx_cli_ident" ON "public"."clientes" USING "btree" ("empresa_id", "numero_identificacion");



CREATE INDEX "idx_cli_ident_trgm" ON "public"."clientes" USING "gin" ("numero_identificacion" "public"."gin_trgm_ops");



CREATE UNIQUE INDEX "idx_cli_ident_unica" ON "public"."clientes" USING "btree" ("empresa_id", "tipo_identificacion_codigo", "numero_identificacion") WHERE (("deleted_at" IS NULL) AND ("numero_identificacion" IS NOT NULL) AND (TRIM(BOTH FROM "numero_identificacion") <> ''::"text"));



CREATE INDEX "idx_cli_indus" ON "public"."clientes" USING "btree" ("empresa_id", "industria_id");



CREATE INDEX "idx_cli_nombre_trgm" ON "public"."clientes" USING "gin" ("nombre_comercial" "public"."gin_trgm_ops");



CREATE INDEX "idx_cli_origen" ON "public"."clientes" USING "btree" ("empresa_id", "origen_id");



CREATE INDEX "idx_cli_padre" ON "public"."clientes" USING "btree" ("empresa_id", "cliente_padre_id");



CREATE INDEX "idx_cli_razon_trgm" ON "public"."clientes" USING "gin" ("razon_social" "public"."gin_trgm_ops");



CREATE INDEX "idx_cli_resp_activos" ON "public"."clientes" USING "btree" ("empresa_id", "responsable_comercial_id") WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_cli_tipocli" ON "public"."clientes" USING "btree" ("empresa_id", "tipo_cliente_id");



CREATE INDEX "idx_cli_zona" ON "public"."clientes" USING "btree" ("empresa_id", "zona_id");



CREATE INDEX "idx_compat_universal" ON "public"."producto_compatibilidades" USING "btree" ("empresa_id", "contexto_compatibilidad", "valor_compatibilidad");



CREATE INDEX "idx_cont_cliente" ON "public"."contactos_cliente" USING "btree" ("empresa_id", "cliente_id") WHERE ("deleted_at" IS NULL);



CREATE UNIQUE INDEX "idx_cont_principal" ON "public"."contactos_cliente" USING "btree" ("empresa_id", "cliente_id") WHERE (("es_principal" = true) AND ("deleted_at" IS NULL));



CREATE INDEX "idx_costos_activos" ON "public"."costos_producto" USING "btree" ("empresa_id", "producto_id", "tipo_costo") WHERE ("valida_hasta" IS NULL);



CREATE INDEX "idx_cot_cliente" ON "public"."cotizaciones" USING "btree" ("empresa_id", "cliente_id");



CREATE INDEX "idx_cot_estado" ON "public"."cotizaciones" USING "btree" ("empresa_id", "estado");



CREATE INDEX "idx_cot_eventos" ON "public"."cotizacion_eventos" USING "btree" ("empresa_id", "cotizacion_id", "created_at");



CREATE INDEX "idx_cot_grupo_version" ON "public"."cotizaciones" USING "btree" ("empresa_id", "documento_grupo_id", "version_numero" DESC);



CREATE INDEX "idx_cr_fiscal_tenant_estado" ON "public"."cr_documentos_fiscales" USING "btree" ("empresa_id", "estado_hacienda");



CREATE INDEX "idx_cxc_tenant_doc" ON "public"."cxc_transacciones" USING "btree" ("empresa_id", "documento_id");



CREATE INDEX "idx_cxp_tenant_doc" ON "public"."cxp_transacciones" USING "btree" ("empresa_id", "documento_id");



CREATE INDEX "idx_dir_cliente" ON "public"."direcciones_cliente" USING "btree" ("empresa_id", "cliente_id") WHERE ("deleted_at" IS NULL);



CREATE UNIQUE INDEX "idx_dir_principal" ON "public"."direcciones_cliente" USING "btree" ("empresa_id", "cliente_id") WHERE (("es_principal" = true) AND ("deleted_at" IS NULL));



CREATE INDEX "idx_docs_cliente" ON "public"."documentos_comerciales" USING "btree" ("empresa_id", "cliente_id");



CREATE INDEX "idx_docs_estado" ON "public"."documentos_comerciales" USING "btree" ("empresa_id", "estado_operativo");



CREATE INDEX "idx_docs_fechas" ON "public"."documentos_comerciales" USING "btree" ("empresa_id", "fecha_emision");



CREATE INDEX "idx_docs_proveedor" ON "public"."documentos_comerciales" USING "btree" ("empresa_id", "proveedor_id");



CREATE INDEX "idx_docs_tipo" ON "public"."documentos_comerciales" USING "btree" ("empresa_id", "tipo_documento");



CREATE INDEX "idx_eventos_consumo_admin_metrics" ON "public"."eventos_consumo" USING "btree" ("empresa_id", "evento_tipo", "created_at");



CREATE INDEX "idx_eventos_pendientes" ON "public"."sistema_eventos_bus" USING "btree" ("empresa_id", "estado", "proximo_reintento") WHERE ("estado" = ANY (ARRAY['pendiente'::"public"."estado_evento_enum", 'fallido'::"public"."estado_evento_enum"]));



CREATE INDEX "idx_finanzas_eventos_tenant" ON "public"."finanzas_eventos" USING "btree" ("empresa_id", "created_at");



CREATE UNIQUE INDEX "idx_gfisc_codigo" ON "public"."grupos_fiscales" USING "btree" ("empresa_id", "upper"(TRIM(BOTH FROM "codigo"))) WHERE ("deleted_at" IS NULL);



CREATE UNIQUE INDEX "idx_industrias_nom" ON "public"."industrias" USING "btree" ("empresa_id", "lower"(TRIM(BOTH FROM "nombre"))) WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_inv_reservas_doc" ON "public"."inventario_reservas" USING "btree" ("empresa_id", "documento_comercial_id");



CREATE INDEX "idx_inventario_mov_tenant_fecha" ON "public"."inventario_movimientos" USING "btree" ("empresa_id", "created_at");



CREATE INDEX "idx_invitaciones_empresa" ON "public"."invitaciones" USING "btree" ("empresa_id");



CREATE INDEX "idx_invitaciones_token" ON "public"."invitaciones" USING "btree" ("token") WHERE ("estado" = 'pendiente'::"public"."estado_invitacion_enum");



CREATE INDEX "idx_lotes_tenant_prod" ON "public"."inventario_lotes" USING "btree" ("empresa_id", "producto_id", "fecha_vencimiento");



CREATE UNIQUE INDEX "idx_marcas_nombre" ON "public"."marcas" USING "btree" ("empresa_id", "lower"(TRIM(BOTH FROM "nombre"))) WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_obs_logs_tenant" ON "public"."sistema_observabilidad_logs" USING "btree" ("empresa_id", "created_at");



CREATE UNIQUE INDEX "idx_origenes_nom" ON "public"."origenes_cliente" USING "btree" ("empresa_id", "lower"(TRIM(BOTH FROM "nombre"))) WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_perfiles_auth_lookup" ON "public"."perfiles" USING "btree" ("id") WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_perfiles_empresa" ON "public"."perfiles" USING "btree" ("empresa_id");



CREATE INDEX "idx_perfiles_empresa_rol" ON "public"."perfiles" USING "btree" ("empresa_id", "rol");



CREATE INDEX "idx_plan_configuracion_lookup" ON "public"."plan_configuracion" USING "btree" ("plan_id", "caracteristica_id");



CREATE INDEX "idx_precios_activos" ON "public"."precios_producto" USING "btree" ("empresa_id", "lista_precio_id", "producto_id") WHERE ("valida_hasta" IS NULL);



CREATE INDEX "idx_prod_emb_hnsw" ON "public"."producto_embeddings" USING "hnsw" ("vector_data" "public"."vector_cosine_ops");



CREATE UNIQUE INDEX "idx_prod_sku_unico" ON "public"."productos" USING "btree" ("empresa_id", "upper"(TRIM(BOTH FROM "codigo_sku"))) WHERE (("deleted_at" IS NULL) AND ("codigo_sku" IS NOT NULL) AND (TRIM(BOTH FROM "codigo_sku") <> ''::"text"));



CREATE INDEX "idx_producto_search_trgm" ON "public"."producto_search_index" USING "gin" ("search_document" "public"."gin_trgm_ops");



CREATE UNIQUE INDEX "idx_prov_ident" ON "public"."proveedores" USING "btree" ("empresa_id", "upper"(TRIM(BOTH FROM "identificacion_fiscal"))) WHERE (("deleted_at" IS NULL) AND ("identificacion_fiscal" IS NOT NULL));



CREATE INDEX "idx_reindex_pendientes" ON "public"."search_reindex_queue" USING "btree" ("empresa_id", "estado") WHERE ("estado" = 'pendiente'::"public"."estado_indexacion_enum");



CREATE UNIQUE INDEX "idx_sinonimos_origen" ON "public"."catalogo_sinonimos" USING "btree" ("empresa_id", "contexto_termino", "lower"(TRIM(BOTH FROM "termino_origen")));



CREATE INDEX "idx_suscripciones_empresa_activa" ON "public"."suscripciones" USING "btree" ("empresa_id", "es_activa_actual") WHERE ("deleted_at" IS NULL);



CREATE UNIQUE INDEX "idx_suscripciones_unica_activa" ON "public"."suscripciones" USING "btree" ("empresa_id") WHERE (("es_activa_actual" = true) AND ("deleted_at" IS NULL));



CREATE INDEX "idx_tags_cliente" ON "public"."cliente_tags" USING "btree" ("empresa_id", "cliente_id");



CREATE UNIQUE INDEX "idx_tags_nom" ON "public"."tags" USING "btree" ("empresa_id", "lower"(TRIM(BOTH FROM "nombre"))) WHERE ("deleted_at" IS NULL);



CREATE INDEX "idx_tc_activos" ON "public"."tipos_cambio_historico" USING "btree" ("empresa_id", "moneda_origen", "moneda_destino") WHERE ("valida_hasta" IS NULL);



CREATE INDEX "idx_tenant_usage_lookup" ON "public"."tenant_usage" USING "btree" ("empresa_id", "caracteristica_id", "periodo_inicio", "periodo_fin");



CREATE UNIQUE INDEX "idx_tipos_cli_nom" ON "public"."tipos_cliente" USING "btree" ("empresa_id", "lower"(TRIM(BOTH FROM "nombre"))) WHERE ("deleted_at" IS NULL);



CREATE UNIQUE INDEX "idx_unica_invitacion_pendiente" ON "public"."invitaciones" USING "btree" ("empresa_id", "email") WHERE ("estado" = 'pendiente'::"public"."estado_invitacion_enum");



CREATE UNIQUE INDEX "idx_uom_codigo" ON "public"."unidades_medida" USING "btree" ("empresa_id", "upper"(TRIM(BOTH FROM "codigo"))) WHERE ("deleted_at" IS NULL);



CREATE UNIQUE INDEX "idx_zonas_nom" ON "public"."zonas" USING "btree" ("empresa_id", "lower"(TRIM(BOTH FROM "nombre"))) WHERE ("deleted_at" IS NULL);



CREATE OR REPLACE TRIGGER "trg_01_audit_cotizaciones" BEFORE INSERT OR UPDATE ON "public"."cotizaciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_01_norm_productos" BEFORE INSERT OR UPDATE ON "public"."productos" FOR EACH ROW EXECUTE FUNCTION "public"."fn_normalize_identificadores"();



CREATE OR REPLACE TRIGGER "trg_02_audit_productos" BEFORE INSERT OR UPDATE ON "public"."productos" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_02_freeze_cotizacion" BEFORE UPDATE ON "public"."cotizaciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_validate_quote_update"();



CREATE OR REPLACE TRIGGER "trg_03_prevent_delete" BEFORE DELETE ON "public"."cotizaciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_delete_quotes"();



CREATE OR REPLACE TRIGGER "trg_04_audit_cabecera" AFTER INSERT OR UPDATE ON "public"."cotizaciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_audit_cotizacion_cabecera"();



CREATE OR REPLACE TRIGGER "trg_audit_aprobaciones_eventos" AFTER INSERT OR UPDATE ON "public"."cotizacion_aprobaciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_audit_cotizacion_aprobaciones"();



CREATE OR REPLACE TRIGGER "trg_audit_attr_val" BEFORE INSERT OR UPDATE ON "public"."producto_atributos_valores" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_bom" BEFORE INSERT OR UPDATE ON "public"."producto_componentes" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_cat_fisc" BEFORE INSERT OR UPDATE ON "public"."categorias_fiscales" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_cat_prod" BEFORE INSERT OR UPDATE ON "public"."categorias_producto" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_compat" BEFORE INSERT OR UPDATE ON "public"."producto_compatibilidades" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_cont" BEFORE INSERT OR UPDATE ON "public"."contactos_cliente" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_dir" BEFORE INSERT OR UPDATE ON "public"."direcciones_cliente" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_estado_doc" AFTER UPDATE ON "public"."documentos_comerciales" FOR EACH ROW EXECUTE FUNCTION "public"."fn_audit_estado_documento"();



CREATE OR REPLACE TRIGGER "trg_audit_gfisc" BEFORE INSERT OR UPDATE ON "public"."grupos_fiscales" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_industrias" BEFORE INSERT OR UPDATE ON "public"."industrias" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_lineas" BEFORE INSERT OR UPDATE ON "public"."cotizacion_lineas" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_lineas_eventos" AFTER INSERT OR DELETE OR UPDATE ON "public"."cotizacion_lineas" FOR EACH ROW EXECUTE FUNCTION "public"."fn_audit_cotizacion_lineas"();



CREATE OR REPLACE TRIGGER "trg_audit_listas" BEFORE INSERT OR UPDATE ON "public"."listas_precios" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_marcas" BEFORE INSERT OR UPDATE ON "public"."marcas" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_origenes" BEFORE INSERT OR UPDATE ON "public"."origenes_cliente" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_prod_prov" BEFORE UPDATE ON "public"."producto_proveedores" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at_column"();



CREATE OR REPLACE TRIGGER "trg_audit_prov" BEFORE INSERT OR UPDATE ON "public"."proveedores" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_relaciones" BEFORE INSERT OR UPDATE ON "public"."producto_relaciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_tags" BEFORE INSERT OR UPDATE ON "public"."tags" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_tipos_cliente" BEFORE INSERT OR UPDATE ON "public"."tipos_cliente" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_uom" BEFORE INSERT OR UPDATE ON "public"."unidades_medida" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_audit_zonas" BEFORE INSERT OR UPDATE ON "public"."zonas" FOR EACH ROW EXECUTE FUNCTION "public"."fn_set_audit_fields"();



CREATE OR REPLACE TRIGGER "trg_cascade_soft_delete_cliente" AFTER UPDATE OF "deleted_at" ON "public"."clientes" FOR EACH ROW EXECUTE FUNCTION "public"."fn_cascade_soft_delete_cliente"();



CREATE OR REPLACE TRIGGER "trg_del_cxc" BEFORE DELETE ON "public"."cxc_transacciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_financial_delete"();



CREATE OR REPLACE TRIGGER "trg_del_cxp" BEFORE DELETE ON "public"."cxp_transacciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_financial_delete"();



CREATE OR REPLACE TRIGGER "trg_del_doc" BEFORE DELETE ON "public"."documentos_comerciales" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_financial_delete"();



CREATE OR REPLACE TRIGGER "trg_del_kdx" BEFORE DELETE ON "public"."inventario_movimientos" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_financial_delete"();



CREATE OR REPLACE TRIGGER "trg_finanzas_inmutable" BEFORE DELETE OR UPDATE ON "public"."finanzas_eventos" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_audit_tampering"();



CREATE OR REPLACE TRIGGER "trg_freeze_cotizacion_aprobaciones" BEFORE INSERT OR DELETE OR UPDATE ON "public"."cotizacion_aprobaciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_freeze_quote_approvals"();



CREATE OR REPLACE TRIGGER "trg_freeze_cotizacion_lineas" BEFORE INSERT OR DELETE OR UPDATE ON "public"."cotizacion_lineas" FOR EACH ROW EXECUTE FUNCTION "public"."fn_freeze_quote_lines"();



CREATE OR REPLACE TRIGGER "trg_impuestos_inmutables" BEFORE UPDATE ON "public"."impuestos" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_impuesto_tampering"();



CREATE OR REPLACE TRIGGER "trg_master_clientes" BEFORE INSERT OR UPDATE ON "public"."clientes" FOR EACH ROW EXECUTE FUNCTION "public"."fn_clientes_master_trigger"();



CREATE OR REPLACE TRIGGER "trg_prevent_cat_cycle" BEFORE INSERT OR UPDATE OF "categoria_padre_id" ON "public"."categorias_producto" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_categoria_cycle"();



CREATE OR REPLACE TRIGGER "trg_prevent_cliente_cycle" BEFORE INSERT OR UPDATE OF "cliente_padre_id" ON "public"."clientes" FOR EACH ROW EXECUTE FUNCTION "public"."fn_prevent_cliente_cycle"();



CREATE OR REPLACE TRIGGER "trg_sync_cxc" AFTER INSERT OR UPDATE ON "public"."cxc_transacciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_sync_saldo_cxc"();



CREATE OR REPLACE TRIGGER "trg_sync_cxp" AFTER INSERT OR UPDATE ON "public"."cxp_transacciones" FOR EACH ROW EXECUTE FUNCTION "public"."fn_sync_saldo_cxp"();



CREATE OR REPLACE TRIGGER "trg_sync_kardex" AFTER INSERT ON "public"."inventario_movimientos" FOR EACH ROW EXECUTE FUNCTION "public"."fn_sync_kardex_saldos"();



CREATE OR REPLACE TRIGGER "trg_val_estado_doc" BEFORE UPDATE OF "estado_operativo" ON "public"."documentos_comerciales" FOR EACH ROW EXECUTE FUNCTION "public"."fn_validar_transicion_estado_comercial"();



CREATE OR REPLACE TRIGGER "trigger_updated_at_empresas" BEFORE UPDATE ON "public"."empresas" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at_column"();



CREATE OR REPLACE TRIGGER "trigger_updated_at_invitaciones" BEFORE UPDATE ON "public"."invitaciones" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at_column"();



CREATE OR REPLACE TRIGGER "trigger_updated_at_perfiles" BEFORE UPDATE ON "public"."perfiles" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at_column"();



CREATE OR REPLACE TRIGGER "trigger_updated_at_plan_configuracion" BEFORE UPDATE ON "public"."plan_configuracion" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at_column"();



CREATE OR REPLACE TRIGGER "trigger_updated_at_planes" BEFORE UPDATE ON "public"."planes" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at_column"();



CREATE OR REPLACE TRIGGER "trigger_updated_at_suscripciones" BEFORE UPDATE ON "public"."suscripciones" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at_column"();



CREATE OR REPLACE TRIGGER "trigger_updated_at_tenant_usage" BEFORE UPDATE ON "public"."tenant_usage" FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at_column"();



CREATE OR REPLACE TRIGGER "trigger_validar_tipo_configuracion" BEFORE INSERT OR UPDATE ON "public"."plan_configuracion" FOR EACH ROW EXECUTE FUNCTION "public"."trg_validar_tipo_configuracion"();



ALTER TABLE ONLY "public"."atributos_catalogo"
    ADD CONSTRAINT "atributos_catalogo_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."atributos_catalogo"
    ADD CONSTRAINT "atributos_catalogo_empresa_id_unidad_medida_id_fkey" FOREIGN KEY ("empresa_id", "unidad_medida_id") REFERENCES "public"."unidades_medida"("empresa_id", "id");



ALTER TABLE ONLY "public"."audit_eventos"
    ADD CONSTRAINT "audit_eventos_actor_id_fkey" FOREIGN KEY ("actor_id") REFERENCES "public"."perfiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."audit_eventos"
    ADD CONSTRAINT "audit_eventos_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."audit_eventos"
    ADD CONSTRAINT "audit_eventos_target_id_fkey" FOREIGN KEY ("target_id") REFERENCES "public"."perfiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."bodegas"
    ADD CONSTRAINT "bodegas_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cache_consultas_ia"
    ADD CONSTRAINT "cache_consultas_ia_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."catalogo_sinonimos"
    ADD CONSTRAINT "catalogo_sinonimos_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."categorias_fiscales"
    ADD CONSTRAINT "categorias_fiscales_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."categorias_fiscales"
    ADD CONSTRAINT "categorias_fiscales_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."categorias_fiscales"
    ADD CONSTRAINT "categorias_fiscales_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."categorias_producto"
    ADD CONSTRAINT "categorias_producto_empresa_id_categoria_padre_id_fkey" FOREIGN KEY ("empresa_id", "categoria_padre_id") REFERENCES "public"."categorias_producto"("empresa_id", "id");



ALTER TABLE ONLY "public"."categorias_producto"
    ADD CONSTRAINT "categorias_producto_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cliente_tags"
    ADD CONSTRAINT "cliente_tags_empresa_id_cliente_id_fkey" FOREIGN KEY ("empresa_id", "cliente_id") REFERENCES "public"."clientes"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cliente_tags"
    ADD CONSTRAINT "cliente_tags_empresa_id_tag_id_fkey" FOREIGN KEY ("empresa_id", "tag_id") REFERENCES "public"."tags"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_categoria_fiscal_id_fkey" FOREIGN KEY ("empresa_id", "categoria_fiscal_id") REFERENCES "public"."categorias_fiscales"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_cliente_padre_id_fkey" FOREIGN KEY ("empresa_id", "cliente_padre_id") REFERENCES "public"."clientes"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_industria_id_fkey" FOREIGN KEY ("empresa_id", "industria_id") REFERENCES "public"."industrias"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_origen_id_fkey" FOREIGN KEY ("empresa_id", "origen_id") REFERENCES "public"."origenes_cliente"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_responsable_comercial_id_fkey" FOREIGN KEY ("empresa_id", "responsable_comercial_id") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_tipo_cliente_id_fkey" FOREIGN KEY ("empresa_id", "tipo_cliente_id") REFERENCES "public"."tipos_cliente"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_empresa_id_zona_id_fkey" FOREIGN KEY ("empresa_id", "zona_id") REFERENCES "public"."zonas"("empresa_id", "id");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_moneda_preferida_codigo_fkey" FOREIGN KEY ("moneda_preferida_codigo") REFERENCES "public"."monedas"("codigo");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_tipo_identificacion_codigo_fkey" FOREIGN KEY ("tipo_identificacion_codigo") REFERENCES "public"."tipos_identificacion"("codigo");



ALTER TABLE ONLY "public"."condiciones_pago"
    ADD CONSTRAINT "condiciones_pago_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."contactos_cliente"
    ADD CONSTRAINT "contactos_cliente_empresa_id_cliente_id_fkey" FOREIGN KEY ("empresa_id", "cliente_id") REFERENCES "public"."clientes"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."contactos_cliente"
    ADD CONSTRAINT "contactos_cliente_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."contactos_cliente"
    ADD CONSTRAINT "contactos_cliente_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."costos_producto"
    ADD CONSTRAINT "costos_producto_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."costos_producto"
    ADD CONSTRAINT "costos_producto_empresa_id_proveedor_id_fkey" FOREIGN KEY ("empresa_id", "proveedor_id") REFERENCES "public"."proveedores"("empresa_id", "id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."costos_producto"
    ADD CONSTRAINT "costos_producto_moneda_codigo_fkey" FOREIGN KEY ("moneda_codigo") REFERENCES "public"."monedas"("codigo");



ALTER TABLE ONLY "public"."cotizacion_aprobaciones"
    ADD CONSTRAINT "cotizacion_aprobaciones_empresa_id_cotizacion_id_fkey" FOREIGN KEY ("empresa_id", "cotizacion_id") REFERENCES "public"."cotizaciones"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cotizacion_aprobaciones"
    ADD CONSTRAINT "cotizacion_aprobaciones_empresa_id_politica_id_fkey" FOREIGN KEY ("empresa_id", "politica_id") REFERENCES "public"."politicas_comerciales"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cotizacion_eventos"
    ADD CONSTRAINT "cotizacion_eventos_empresa_id_actor_id_fkey" FOREIGN KEY ("empresa_id", "actor_id") REFERENCES "public"."perfiles"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cotizacion_eventos"
    ADD CONSTRAINT "cotizacion_eventos_empresa_id_cotizacion_id_fkey" FOREIGN KEY ("empresa_id", "cotizacion_id") REFERENCES "public"."cotizaciones"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cotizacion_grupos"
    ADD CONSTRAINT "cotizacion_grupos_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cotizacion_lineas"
    ADD CONSTRAINT "cotizacion_lineas_empresa_id_cotizacion_id_fkey" FOREIGN KEY ("empresa_id", "cotizacion_id") REFERENCES "public"."cotizaciones"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cotizacion_lineas"
    ADD CONSTRAINT "cotizacion_lineas_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."cotizacion_narrativas_ia"
    ADD CONSTRAINT "cotizacion_narrativas_ia_empresa_id_cotizacion_id_fkey" FOREIGN KEY ("empresa_id", "cotizacion_id") REFERENCES "public"."cotizaciones"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "cotizaciones_empresa_id_cliente_id_fkey" FOREIGN KEY ("empresa_id", "cliente_id") REFERENCES "public"."clientes"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "cotizaciones_empresa_id_clonado_de_id_fkey" FOREIGN KEY ("empresa_id", "clonado_de_id") REFERENCES "public"."cotizaciones"("empresa_id", "id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "cotizaciones_empresa_id_documento_grupo_id_fkey" FOREIGN KEY ("empresa_id", "documento_grupo_id") REFERENCES "public"."cotizacion_grupos"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "cotizaciones_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "cotizaciones_empresa_id_lista_precio_id_fkey" FOREIGN KEY ("empresa_id", "lista_precio_id") REFERENCES "public"."listas_precios"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "cotizaciones_empresa_id_vendedor_id_fkey" FOREIGN KEY ("empresa_id", "vendedor_id") REFERENCES "public"."perfiles"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cotizaciones"
    ADD CONSTRAINT "cotizaciones_moneda_cotizacion_fkey" FOREIGN KEY ("moneda_cotizacion") REFERENCES "public"."monedas"("codigo");



ALTER TABLE ONLY "public"."cpq_reglas_catalogo"
    ADD CONSTRAINT "cpq_reglas_catalogo_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cpq_reglas_catalogo"
    ADD CONSTRAINT "cpq_reglas_catalogo_empresa_id_producto_origen_id_fkey" FOREIGN KEY ("empresa_id", "producto_origen_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cr_documentos_fiscales"
    ADD CONSTRAINT "cr_documentos_fiscales_actividad_economica_codigo_fkey" FOREIGN KEY ("actividad_economica_codigo") REFERENCES "public"."cr_catalogo_actividades"("codigo_actividad") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cr_documentos_fiscales"
    ADD CONSTRAINT "cr_documentos_fiscales_empresa_id_documento_comercial_id_fkey" FOREIGN KEY ("empresa_id", "documento_comercial_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cr_empresa_actividades"
    ADD CONSTRAINT "cr_empresa_actividades_codigo_actividad_fkey" FOREIGN KEY ("codigo_actividad") REFERENCES "public"."cr_catalogo_actividades"("codigo_actividad") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cr_empresa_actividades"
    ADD CONSTRAINT "cr_empresa_actividades_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cr_series_documentales"
    ADD CONSTRAINT "cr_series_documentales_empresa_id_terminal_id_fkey" FOREIGN KEY ("empresa_id", "terminal_id") REFERENCES "public"."cr_terminales"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cr_sucursales"
    ADD CONSTRAINT "cr_sucursales_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cr_terminales"
    ADD CONSTRAINT "cr_terminales_empresa_id_sucursal_id_fkey" FOREIGN KEY ("empresa_id", "sucursal_id") REFERENCES "public"."cr_sucursales"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cuentas_contables"
    ADD CONSTRAINT "cuentas_contables_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."cxc_transacciones"
    ADD CONSTRAINT "cxc_transacciones_empresa_id_documento_id_fkey" FOREIGN KEY ("empresa_id", "documento_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."cxp_transacciones"
    ADD CONSTRAINT "cxp_transacciones_empresa_id_documento_id_fkey" FOREIGN KEY ("empresa_id", "documento_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."direcciones_cliente"
    ADD CONSTRAINT "direcciones_cliente_empresa_id_cliente_id_fkey" FOREIGN KEY ("empresa_id", "cliente_id") REFERENCES "public"."clientes"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."direcciones_cliente"
    ADD CONSTRAINT "direcciones_cliente_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."direcciones_cliente"
    ADD CONSTRAINT "direcciones_cliente_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."documentos_comerciales"
    ADD CONSTRAINT "documentos_comerciales_empresa_id_cliente_id_fkey" FOREIGN KEY ("empresa_id", "cliente_id") REFERENCES "public"."clientes"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."documentos_comerciales"
    ADD CONSTRAINT "documentos_comerciales_empresa_id_condicion_pago_id_fkey" FOREIGN KEY ("empresa_id", "condicion_pago_id") REFERENCES "public"."condiciones_pago"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."documentos_comerciales"
    ADD CONSTRAINT "documentos_comerciales_empresa_id_documento_padre_id_fkey" FOREIGN KEY ("empresa_id", "documento_padre_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."documentos_comerciales"
    ADD CONSTRAINT "documentos_comerciales_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."documentos_comerciales"
    ADD CONSTRAINT "documentos_comerciales_empresa_id_proveedor_id_fkey" FOREIGN KEY ("empresa_id", "proveedor_id") REFERENCES "public"."proveedores"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."documentos_historial_estados"
    ADD CONSTRAINT "documentos_historial_estados_empresa_id_documento_id_fkey" FOREIGN KEY ("empresa_id", "documento_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."documentos_versiones"
    ADD CONSTRAINT "documentos_versiones_empresa_id_documento_comercial_id_fkey" FOREIGN KEY ("empresa_id", "documento_comercial_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."empresa_suscripciones"
    ADD CONSTRAINT "empresa_suscripciones_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."empresa_suscripciones"
    ADD CONSTRAINT "empresa_suscripciones_plan_id_fkey" FOREIGN KEY ("plan_id") REFERENCES "public"."saas_planes"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."eventos_consumo"
    ADD CONSTRAINT "eventos_consumo_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."eventos_consumo"
    ADD CONSTRAINT "eventos_consumo_suscripcion_id_fkey" FOREIGN KEY ("suscripcion_id") REFERENCES "public"."suscripciones"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_proveedores"
    ADD CONSTRAINT "fk_prod_prov_empresa" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_proveedores"
    ADD CONSTRAINT "fk_prod_prov_moneda" FOREIGN KEY ("moneda_codigo") REFERENCES "public"."monedas"("codigo") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."producto_proveedores"
    ADD CONSTRAINT "fk_prod_prov_producto" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_proveedores"
    ADD CONSTRAINT "fk_prod_prov_proveedor" FOREIGN KEY ("empresa_id", "proveedor_id") REFERENCES "public"."proveedores"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."grupos_fiscales"
    ADD CONSTRAINT "grupos_fiscales_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ia_feedback"
    ADD CONSTRAINT "ia_feedback_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ia_feedback"
    ADD CONSTRAINT "ia_feedback_empresa_id_usuario_id_fkey" FOREIGN KEY ("empresa_id", "usuario_id") REFERENCES "public"."perfiles"("empresa_id", "id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."ia_prompts_externos"
    ADD CONSTRAINT "ia_prompts_externos_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."impuestos"
    ADD CONSTRAINT "impuestos_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."industrias"
    ADD CONSTRAINT "industrias_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."industrias"
    ADD CONSTRAINT "industrias_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."industrias"
    ADD CONSTRAINT "industrias_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."inventario_lotes"
    ADD CONSTRAINT "inventario_lotes_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventario_movimientos"
    ADD CONSTRAINT "inventario_movimientos_empresa_id_bodega_destino_id_fkey" FOREIGN KEY ("empresa_id", "bodega_destino_id") REFERENCES "public"."bodegas"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."inventario_movimientos"
    ADD CONSTRAINT "inventario_movimientos_empresa_id_bodega_origen_id_fkey" FOREIGN KEY ("empresa_id", "bodega_origen_id") REFERENCES "public"."bodegas"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."inventario_movimientos"
    ADD CONSTRAINT "inventario_movimientos_empresa_id_documento_comercial_id_fkey" FOREIGN KEY ("empresa_id", "documento_comercial_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."inventario_movimientos"
    ADD CONSTRAINT "inventario_movimientos_empresa_id_lote_id_fkey" FOREIGN KEY ("empresa_id", "lote_id") REFERENCES "public"."inventario_lotes"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."inventario_movimientos"
    ADD CONSTRAINT "inventario_movimientos_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventario_movimientos"
    ADD CONSTRAINT "inventario_movimientos_empresa_id_ubicacion_destino_id_fkey" FOREIGN KEY ("empresa_id", "ubicacion_destino_id") REFERENCES "public"."inventario_ubicaciones"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."inventario_movimientos"
    ADD CONSTRAINT "inventario_movimientos_empresa_id_ubicacion_origen_id_fkey" FOREIGN KEY ("empresa_id", "ubicacion_origen_id") REFERENCES "public"."inventario_ubicaciones"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."inventario_reservas"
    ADD CONSTRAINT "inventario_reservas_empresa_id_documento_comercial_id_fkey" FOREIGN KEY ("empresa_id", "documento_comercial_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventario_reservas"
    ADD CONSTRAINT "inventario_reservas_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventario_reservas"
    ADD CONSTRAINT "inventario_reservas_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventario_saldos"
    ADD CONSTRAINT "inventario_saldos_empresa_id_bodega_id_fkey" FOREIGN KEY ("empresa_id", "bodega_id") REFERENCES "public"."bodegas"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventario_saldos"
    ADD CONSTRAINT "inventario_saldos_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."inventario_ubicaciones"
    ADD CONSTRAINT "inventario_ubicaciones_empresa_id_bodega_id_fkey" FOREIGN KEY ("empresa_id", "bodega_id") REFERENCES "public"."bodegas"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."invitaciones"
    ADD CONSTRAINT "invitaciones_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."invitaciones"
    ADD CONSTRAINT "invitaciones_invitado_por_fkey" FOREIGN KEY ("invitado_por") REFERENCES "public"."perfiles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."lineas_documento"
    ADD CONSTRAINT "lineas_documento_empresa_id_cuenta_contable_id_fkey" FOREIGN KEY ("empresa_id", "cuenta_contable_id") REFERENCES "public"."cuentas_contables"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."lineas_documento"
    ADD CONSTRAINT "lineas_documento_empresa_id_documento_id_fkey" FOREIGN KEY ("empresa_id", "documento_id") REFERENCES "public"."documentos_comerciales"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."lineas_documento"
    ADD CONSTRAINT "lineas_documento_empresa_id_impuesto_id_fkey" FOREIGN KEY ("empresa_id", "impuesto_id") REFERENCES "public"."impuestos"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."lineas_documento"
    ADD CONSTRAINT "lineas_documento_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."listas_precios"
    ADD CONSTRAINT "listas_precios_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."listas_precios"
    ADD CONSTRAINT "listas_precios_moneda_codigo_fkey" FOREIGN KEY ("moneda_codigo") REFERENCES "public"."monedas"("codigo");



ALTER TABLE ONLY "public"."marcas"
    ADD CONSTRAINT "marcas_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."origenes_cliente"
    ADD CONSTRAINT "origenes_cliente_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."origenes_cliente"
    ADD CONSTRAINT "origenes_cliente_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."origenes_cliente"
    ADD CONSTRAINT "origenes_cliente_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_invitado_por_fkey" FOREIGN KEY ("invitado_por") REFERENCES "public"."perfiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."plan_configuracion"
    ADD CONSTRAINT "plan_configuracion_caracteristica_id_fkey" FOREIGN KEY ("caracteristica_id") REFERENCES "public"."caracteristicas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."plan_configuracion"
    ADD CONSTRAINT "plan_configuracion_plan_id_fkey" FOREIGN KEY ("plan_id") REFERENCES "public"."planes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."politicas_comerciales"
    ADD CONSTRAINT "politicas_comerciales_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."precio_escalas"
    ADD CONSTRAINT "precio_escalas_empresa_id_precio_producto_id_fkey" FOREIGN KEY ("empresa_id", "precio_producto_id") REFERENCES "public"."precios_producto"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."precios_producto"
    ADD CONSTRAINT "precios_producto_empresa_id_lista_precio_id_fkey" FOREIGN KEY ("empresa_id", "lista_precio_id") REFERENCES "public"."listas_precios"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."precios_producto"
    ADD CONSTRAINT "precios_producto_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_atributos_valores"
    ADD CONSTRAINT "producto_atributos_valores_empresa_id_atributo_id_fkey" FOREIGN KEY ("empresa_id", "atributo_id") REFERENCES "public"."atributos_catalogo"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_atributos_valores"
    ADD CONSTRAINT "producto_atributos_valores_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_codigos_oficiales"
    ADD CONSTRAINT "producto_codigos_oficiales_catalogo_oficial_id_fkey" FOREIGN KEY ("catalogo_oficial_id") REFERENCES "public"."catalogos_oficiales"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_codigos_oficiales"
    ADD CONSTRAINT "producto_codigos_oficiales_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_compatibilidades"
    ADD CONSTRAINT "producto_compatibilidades_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_componentes"
    ADD CONSTRAINT "producto_componentes_empresa_id_producto_hijo_id_fkey" FOREIGN KEY ("empresa_id", "producto_hijo_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."producto_componentes"
    ADD CONSTRAINT "producto_componentes_empresa_id_producto_padre_id_fkey" FOREIGN KEY ("empresa_id", "producto_padre_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_embeddings"
    ADD CONSTRAINT "producto_embeddings_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_recursos"
    ADD CONSTRAINT "producto_recursos_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_relaciones"
    ADD CONSTRAINT "producto_relaciones_empresa_id_producto_destino_id_fkey" FOREIGN KEY ("empresa_id", "producto_destino_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_relaciones"
    ADD CONSTRAINT "producto_relaciones_empresa_id_producto_origen_id_fkey" FOREIGN KEY ("empresa_id", "producto_origen_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."producto_search_index"
    ADD CONSTRAINT "producto_search_index_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_empresa_id_categoria_id_fkey" FOREIGN KEY ("empresa_id", "categoria_id") REFERENCES "public"."categorias_producto"("empresa_id", "id");



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_empresa_id_grupo_fiscal_id_fkey" FOREIGN KEY ("empresa_id", "grupo_fiscal_id") REFERENCES "public"."grupos_fiscales"("empresa_id", "id");



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_empresa_id_marca_id_fkey" FOREIGN KEY ("empresa_id", "marca_id") REFERENCES "public"."marcas"("empresa_id", "id");



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_empresa_id_producto_padre_id_fkey" FOREIGN KEY ("empresa_id", "producto_padre_id") REFERENCES "public"."productos"("empresa_id", "id");



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_empresa_id_unidad_medida_id_fkey" FOREIGN KEY ("empresa_id", "unidad_medida_id") REFERENCES "public"."unidades_medida"("empresa_id", "id");



ALTER TABLE ONLY "public"."productos_fisicos"
    ADD CONSTRAINT "productos_fisicos_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."productos_servicios"
    ADD CONSTRAINT "productos_servicios_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."productos_suscripciones"
    ADD CONSTRAINT "productos_suscripciones_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."proveedores"
    ADD CONSTRAINT "proveedores_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recurso_chunks"
    ADD CONSTRAINT "recurso_chunks_empresa_id_recurso_id_fkey" FOREIGN KEY ("empresa_id", "recurso_id") REFERENCES "public"."producto_recursos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."search_reindex_queue"
    ADD CONSTRAINT "search_reindex_queue_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."search_reindex_queue"
    ADD CONSTRAINT "search_reindex_queue_empresa_id_producto_id_fkey" FOREIGN KEY ("empresa_id", "producto_id") REFERENCES "public"."productos"("empresa_id", "id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."sistema_eventos_bus"
    ADD CONSTRAINT "sistema_eventos_bus_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."sistema_observabilidad_logs"
    ADD CONSTRAINT "sistema_observabilidad_logs_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."suscripciones"
    ADD CONSTRAINT "suscripciones_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."suscripciones"
    ADD CONSTRAINT "suscripciones_plan_id_fkey" FOREIGN KEY ("plan_id") REFERENCES "public"."planes"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."tags"
    ADD CONSTRAINT "tags_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."tags"
    ADD CONSTRAINT "tags_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tags"
    ADD CONSTRAINT "tags_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."tenant_ia_limits"
    ADD CONSTRAINT "tenant_ia_limits_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tenant_ia_usage"
    ADD CONSTRAINT "tenant_ia_usage_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tenant_usage"
    ADD CONSTRAINT "tenant_usage_caracteristica_id_fkey" FOREIGN KEY ("caracteristica_id") REFERENCES "public"."caracteristicas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tenant_usage"
    ADD CONSTRAINT "tenant_usage_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tenant_usage"
    ADD CONSTRAINT "tenant_usage_suscripcion_id_fkey" FOREIGN KEY ("suscripcion_id") REFERENCES "public"."suscripciones"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tipos_cambio_historico"
    ADD CONSTRAINT "tipos_cambio_historico_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tipos_cambio_historico"
    ADD CONSTRAINT "tipos_cambio_historico_moneda_destino_fkey" FOREIGN KEY ("moneda_destino") REFERENCES "public"."monedas"("codigo");



ALTER TABLE ONLY "public"."tipos_cambio_historico"
    ADD CONSTRAINT "tipos_cambio_historico_moneda_origen_fkey" FOREIGN KEY ("moneda_origen") REFERENCES "public"."monedas"("codigo");



ALTER TABLE ONLY "public"."tipos_cliente"
    ADD CONSTRAINT "tipos_cliente_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."tipos_cliente"
    ADD CONSTRAINT "tipos_cliente_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tipos_cliente"
    ADD CONSTRAINT "tipos_cliente_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."unidades_medida"
    ADD CONSTRAINT "unidades_medida_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_transiciones"
    ADD CONSTRAINT "workflow_transiciones_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."zonas"
    ADD CONSTRAINT "zonas_empresa_id_created_by_fkey" FOREIGN KEY ("empresa_id", "created_by") REFERENCES "public"."perfiles"("empresa_id", "id");



ALTER TABLE ONLY "public"."zonas"
    ADD CONSTRAINT "zonas_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "public"."empresas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."zonas"
    ADD CONSTRAINT "zonas_empresa_id_updated_by_fkey" FOREIGN KEY ("empresa_id", "updated_by") REFERENCES "public"."perfiles"("empresa_id", "id");



CREATE POLICY "Delete_Blocked_categorias_fiscales" ON "public"."categorias_fiscales" FOR DELETE USING (false);



CREATE POLICY "Delete_Blocked_clientes" ON "public"."clientes" FOR DELETE USING (false);



CREATE POLICY "Delete_Blocked_contactos_cliente" ON "public"."contactos_cliente" FOR DELETE USING (false);



CREATE POLICY "Delete_Blocked_direcciones_cliente" ON "public"."direcciones_cliente" FOR DELETE USING (false);



CREATE POLICY "Delete_Blocked_industrias" ON "public"."industrias" FOR DELETE USING (false);



CREATE POLICY "Delete_Blocked_origenes_cliente" ON "public"."origenes_cliente" FOR DELETE USING (false);



CREATE POLICY "Delete_Blocked_tags" ON "public"."tags" FOR DELETE USING (false);



CREATE POLICY "Delete_Blocked_tipos_cliente" ON "public"."tipos_cliente" FOR DELETE USING (false);



CREATE POLICY "Delete_Blocked_zonas" ON "public"."zonas" FOR DELETE USING (false);



CREATE POLICY "Delete_cliente_tags" ON "public"."cliente_tags" FOR DELETE USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_Staff_bodegas" ON "public"."bodegas" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_condiciones_pago" ON "public"."condiciones_pago" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_cr_documentos_fiscales" ON "public"."cr_documentos_fiscales" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_cr_series_documentales" ON "public"."cr_series_documentales" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_cr_sucursales" ON "public"."cr_sucursales" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_cr_terminales" ON "public"."cr_terminales" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_cuentas_contables" ON "public"."cuentas_contables" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_cxc_transacciones" ON "public"."cxc_transacciones" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_cxp_transacciones" ON "public"."cxp_transacciones" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_documentos_comerciales" ON "public"."documentos_comerciales" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_documentos_historial_estados" ON "public"."documentos_historial_estados" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_documentos_versiones" ON "public"."documentos_versiones" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_empresa_suscripciones" ON "public"."empresa_suscripciones" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_finanzas_eventos" ON "public"."finanzas_eventos" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_impuestos" ON "public"."impuestos" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_inventario_lotes" ON "public"."inventario_lotes" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_inventario_movimientos" ON "public"."inventario_movimientos" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_inventario_reservas" ON "public"."inventario_reservas" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_inventario_saldos" ON "public"."inventario_saldos" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_inventario_ubicaciones" ON "public"."inventario_ubicaciones" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_lineas_documento" ON "public"."lineas_documento" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_sistema_eventos_bus" ON "public"."sistema_eventos_bus" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_sistema_observabilidad_logs" ON "public"."sistema_observabilidad_logs" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_Staff_workflow_transiciones" ON "public"."workflow_transiciones" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text")));



CREATE POLICY "Insert_categorias_fiscales" ON "public"."categorias_fiscales" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_cliente_tags" ON "public"."cliente_tags" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_clientes" ON "public"."clientes" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_contactos_cliente" ON "public"."contactos_cliente" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_direcciones_cliente" ON "public"."direcciones_cliente" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_industrias" ON "public"."industrias" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_origenes_cliente" ON "public"."origenes_cliente" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_tags" ON "public"."tags" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_tipos_cliente" ON "public"."tipos_cliente" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Insert_zonas" ON "public"."zonas" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Permitir lectura de tipos de identificacion a usuarios autentic" ON "public"."tipos_identificacion" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "RLS_Audit_Lectura" ON "public"."audit_eventos" FOR SELECT USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (( SELECT "perfiles"."rol"
   FROM "public"."perfiles"
  WHERE ("perfiles"."id" = "auth"."uid"())) = ANY (ARRAY['owner'::"public"."rol_enum", 'admin'::"public"."rol_enum"]))));



CREATE POLICY "RLS_Caracteristicas_Lectura_Autenticados" ON "public"."caracteristicas" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));



CREATE POLICY "RLS_Empresas_Actualizar" ON "public"."empresas" FOR UPDATE USING (("id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_Empresas_Eliminar" ON "public"."empresas" FOR DELETE USING (("id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_Empresas_Lectura" ON "public"."empresas" FOR SELECT USING ((("id" = "public"."fn_get_auth_tenant"()) AND ("deleted_at" IS NULL)));



CREATE POLICY "RLS_Eventos_Consumo_Actualizar" ON "public"."eventos_consumo" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"()))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_Eventos_Consumo_Eliminar" ON "public"."eventos_consumo" FOR DELETE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"())));



CREATE POLICY "RLS_Eventos_Consumo_Insertar" ON "public"."eventos_consumo" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"())));



CREATE POLICY "RLS_Eventos_Consumo_Lectura" ON "public"."eventos_consumo" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_Invitaciones_Lectura" ON "public"."invitaciones" FOR SELECT USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (( SELECT "perfiles"."rol"
   FROM "public"."perfiles"
  WHERE ("perfiles"."id" = "auth"."uid"())) = ANY (ARRAY['owner'::"public"."rol_enum", 'admin'::"public"."rol_enum"]))));



CREATE POLICY "RLS_Perfiles_Lectura" ON "public"."perfiles" FOR SELECT USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("deleted_at" IS NULL)));



CREATE POLICY "RLS_Plan_Config_Lectura_Autenticados" ON "public"."plan_configuracion" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));



CREATE POLICY "RLS_Planes_Lectura_Autenticados" ON "public"."planes" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));



CREATE POLICY "RLS_Suscripciones_Actualizar" ON "public"."suscripciones" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"()))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_Suscripciones_Eliminar" ON "public"."suscripciones" FOR DELETE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"())));



CREATE POLICY "RLS_Suscripciones_Insertar" ON "public"."suscripciones" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"())));



CREATE POLICY "RLS_Suscripciones_Lectura" ON "public"."suscripciones" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_Tenant_Usage_Actualizar" ON "public"."tenant_usage" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"()))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_Tenant_Usage_Eliminar" ON "public"."tenant_usage" FOR DELETE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"())));



CREATE POLICY "RLS_Tenant_Usage_Insertar" ON "public"."tenant_usage" FOR INSERT WITH CHECK ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND (NOT "public"."fn_tenant_bloqueado"())));



CREATE POLICY "RLS_Tenant_Usage_Lectura" ON "public"."tenant_usage" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_prod_prov_delete" ON "public"."producto_proveedores" FOR DELETE USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_prod_prov_insert" ON "public"."producto_proveedores" FOR INSERT WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_prod_prov_select" ON "public"."producto_proveedores" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "RLS_prod_prov_update" ON "public"."producto_proveedores" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_bodegas" ON "public"."bodegas" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_condiciones_pago" ON "public"."condiciones_pago" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_cr_documentos_fiscales" ON "public"."cr_documentos_fiscales" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_cr_series_documentales" ON "public"."cr_series_documentales" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_cr_sucursales" ON "public"."cr_sucursales" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_cr_terminales" ON "public"."cr_terminales" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_cuentas_contables" ON "public"."cuentas_contables" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_cxc_transacciones" ON "public"."cxc_transacciones" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_cxp_transacciones" ON "public"."cxp_transacciones" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_documentos_comerciales" ON "public"."documentos_comerciales" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_documentos_historial_estados" ON "public"."documentos_historial_estados" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_documentos_versiones" ON "public"."documentos_versiones" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_empresa_suscripciones" ON "public"."empresa_suscripciones" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_finanzas_eventos" ON "public"."finanzas_eventos" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_impuestos" ON "public"."impuestos" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_inventario_lotes" ON "public"."inventario_lotes" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_inventario_movimientos" ON "public"."inventario_movimientos" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_inventario_reservas" ON "public"."inventario_reservas" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_inventario_saldos" ON "public"."inventario_saldos" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_inventario_ubicaciones" ON "public"."inventario_ubicaciones" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_lineas_documento" ON "public"."lineas_documento" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_sistema_eventos_bus" ON "public"."sistema_eventos_bus" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_sistema_observabilidad_logs" ON "public"."sistema_observabilidad_logs" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Contador_workflow_transiciones" ON "public"."workflow_transiciones" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_Monedas" ON "public"."monedas" FOR SELECT USING (true);



CREATE POLICY "Select_TiposIdent" ON "public"."tipos_identificacion" FOR SELECT USING (true);



CREATE POLICY "Select_categorias_fiscales" ON "public"."categorias_fiscales" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_cliente_tags" ON "public"."cliente_tags" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_clientes" ON "public"."clientes" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_contactos_cliente" ON "public"."contactos_cliente" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_direcciones_cliente" ON "public"."direcciones_cliente" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_industrias" ON "public"."industrias" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_origenes_cliente" ON "public"."origenes_cliente" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_tags" ON "public"."tags" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_tipos_cliente" ON "public"."tipos_cliente" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Select_zonas" ON "public"."zonas" FOR SELECT USING (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_bodegas" ON "public"."bodegas" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_condiciones_pago" ON "public"."condiciones_pago" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_cr_documentos_fiscales" ON "public"."cr_documentos_fiscales" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_cr_series_documentales" ON "public"."cr_series_documentales" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_cr_sucursales" ON "public"."cr_sucursales" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_cr_terminales" ON "public"."cr_terminales" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_cuentas_contables" ON "public"."cuentas_contables" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_cxc_transacciones" ON "public"."cxc_transacciones" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_cxp_transacciones" ON "public"."cxp_transacciones" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_documentos_comerciales" ON "public"."documentos_comerciales" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_documentos_historial_estados" ON "public"."documentos_historial_estados" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_documentos_versiones" ON "public"."documentos_versiones" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_empresa_suscripciones" ON "public"."empresa_suscripciones" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_finanzas_eventos" ON "public"."finanzas_eventos" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_impuestos" ON "public"."impuestos" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_inventario_lotes" ON "public"."inventario_lotes" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_inventario_movimientos" ON "public"."inventario_movimientos" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_inventario_reservas" ON "public"."inventario_reservas" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_inventario_saldos" ON "public"."inventario_saldos" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_inventario_ubicaciones" ON "public"."inventario_ubicaciones" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_lineas_documento" ON "public"."lineas_documento" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_sistema_eventos_bus" ON "public"."sistema_eventos_bus" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_sistema_observabilidad_logs" ON "public"."sistema_observabilidad_logs" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_Staff_workflow_transiciones" ON "public"."workflow_transiciones" FOR UPDATE USING ((("empresa_id" = "public"."fn_get_auth_tenant"()) AND ("public"."fn_get_auth_role"() <> 'contador_externo'::"text"))) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_categorias_fiscales" ON "public"."categorias_fiscales" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_clientes" ON "public"."clientes" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_contactos_cliente" ON "public"."contactos_cliente" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_direcciones_cliente" ON "public"."direcciones_cliente" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_industrias" ON "public"."industrias" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_origenes_cliente" ON "public"."origenes_cliente" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_tags" ON "public"."tags" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_tipos_cliente" ON "public"."tipos_cliente" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Update_zonas" ON "public"."zonas" FOR UPDATE USING (("empresa_id" = "public"."fn_get_auth_tenant"())) WITH CHECK (("empresa_id" = "public"."fn_get_auth_tenant"()));



CREATE POLICY "Usuarios pueden ver su empresa" ON "public"."empresas" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Usuarios pueden ver su propio perfil" ON "public"."perfiles" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "id"));



ALTER TABLE "public"."atributos_catalogo" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."audit_eventos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."bodegas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cache_consultas_ia" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."caracteristicas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."catalogo_sinonimos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."catalogos_oficiales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."categorias_fiscales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."categorias_producto" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cliente_tags" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."clientes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."condiciones_pago" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."contactos_cliente" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."costos_producto" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cotizacion_aprobaciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cotizacion_eventos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cotizacion_grupos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cotizacion_lineas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cotizacion_narrativas_ia" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cotizaciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cpq_reglas_catalogo" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cr_catalogo_actividades" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cr_catalogo_cabys" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cr_documentos_fiscales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cr_empresa_actividades" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cr_series_documentales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cr_sucursales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cr_terminales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cuentas_contables" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cxc_transacciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cxp_transacciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."direcciones_cliente" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."documentos_comerciales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."documentos_historial_estados" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."documentos_versiones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."empresa_suscripciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."empresas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."eventos_consumo" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."finanzas_eventos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."grupos_fiscales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ia_feedback" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ia_prompts_externos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."impuestos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."industrias" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."inventario_lotes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."inventario_movimientos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."inventario_reservas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."inventario_saldos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."inventario_ubicaciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."invitaciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."lineas_documento" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."listas_precios" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."marcas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."monedas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."origenes_cliente" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."perfiles" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."plan_configuracion" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."planes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."politicas_comerciales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."precio_escalas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."precios_producto" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_atributos_valores" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_codigos_oficiales" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_compatibilidades" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_componentes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_embeddings" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_proveedores" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_recursos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_relaciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."producto_search_index" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."productos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."productos_fisicos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."productos_servicios" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."productos_suscripciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."proveedores" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."recurso_chunks" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."saas_planes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."search_reindex_queue" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."sistema_eventos_bus" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."sistema_observabilidad_logs" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."suscripciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tags" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tenant_ia_limits" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tenant_ia_usage" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tenant_usage" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tipos_cambio_historico" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tipos_cliente" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tipos_identificacion" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."unidades_medida" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflow_transiciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."zonas" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey16_in"("cstring") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey16_in"("cstring") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey16_in"("cstring") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey16_in"("cstring") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey16_out"("public"."gbtreekey16") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey16_out"("public"."gbtreekey16") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey16_out"("public"."gbtreekey16") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey16_out"("public"."gbtreekey16") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey2_in"("cstring") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey2_in"("cstring") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey2_in"("cstring") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey2_in"("cstring") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey2_out"("public"."gbtreekey2") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey2_out"("public"."gbtreekey2") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey2_out"("public"."gbtreekey2") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey2_out"("public"."gbtreekey2") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey32_in"("cstring") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey32_in"("cstring") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey32_in"("cstring") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey32_in"("cstring") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey32_out"("public"."gbtreekey32") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey32_out"("public"."gbtreekey32") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey32_out"("public"."gbtreekey32") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey32_out"("public"."gbtreekey32") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey4_in"("cstring") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey4_in"("cstring") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey4_in"("cstring") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey4_in"("cstring") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey4_out"("public"."gbtreekey4") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey4_out"("public"."gbtreekey4") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey4_out"("public"."gbtreekey4") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey4_out"("public"."gbtreekey4") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey8_in"("cstring") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey8_in"("cstring") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey8_in"("cstring") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey8_in"("cstring") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey8_out"("public"."gbtreekey8") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey8_out"("public"."gbtreekey8") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey8_out"("public"."gbtreekey8") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey8_out"("public"."gbtreekey8") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey_var_in"("cstring") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey_var_in"("cstring") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey_var_in"("cstring") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey_var_in"("cstring") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbtreekey_var_out"("public"."gbtreekey_var") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbtreekey_var_out"("public"."gbtreekey_var") TO "anon";
GRANT ALL ON FUNCTION "public"."gbtreekey_var_out"("public"."gbtreekey_var") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbtreekey_var_out"("public"."gbtreekey_var") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_in"("cstring") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_in"("cstring") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_in"("cstring") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_in"("cstring") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_out"("public"."gtrgm") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_out"("public"."gtrgm") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_out"("public"."gtrgm") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_out"("public"."gtrgm") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_in"("cstring", "oid", integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_in"("cstring", "oid", integer) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_in"("cstring", "oid", integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_in"("cstring", "oid", integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_out"("public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_out"("public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_out"("public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_out"("public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_recv"("internal", "oid", integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_recv"("internal", "oid", integer) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_recv"("internal", "oid", integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_recv"("internal", "oid", integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_send"("public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_send"("public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_send"("public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_send"("public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_typmod_in"("cstring"[]) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_typmod_in"("cstring"[]) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_typmod_in"("cstring"[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_typmod_in"("cstring"[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_in"("cstring", "oid", integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_in"("cstring", "oid", integer) TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_in"("cstring", "oid", integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_in"("cstring", "oid", integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_out"("public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_out"("public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_out"("public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_out"("public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_recv"("internal", "oid", integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_recv"("internal", "oid", integer) TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_recv"("internal", "oid", integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_recv"("internal", "oid", integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_send"("public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_send"("public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_send"("public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_send"("public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_typmod_in"("cstring"[]) TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_typmod_in"("cstring"[]) TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_typmod_in"("cstring"[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_typmod_in"("cstring"[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_in"("cstring", "oid", integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_in"("cstring", "oid", integer) TO "anon";
GRANT ALL ON FUNCTION "public"."vector_in"("cstring", "oid", integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_in"("cstring", "oid", integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_out"("public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_out"("public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_out"("public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_out"("public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_recv"("internal", "oid", integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_recv"("internal", "oid", integer) TO "anon";
GRANT ALL ON FUNCTION "public"."vector_recv"("internal", "oid", integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_recv"("internal", "oid", integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_send"("public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_send"("public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_send"("public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_send"("public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_typmod_in"("cstring"[]) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_typmod_in"("cstring"[]) TO "anon";
GRANT ALL ON FUNCTION "public"."vector_typmod_in"("cstring"[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_typmod_in"("cstring"[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_halfvec"(real[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(real[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(real[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(real[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(real[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(real[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(real[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(real[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_vector"(real[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_vector"(real[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_vector"(real[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_vector"(real[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_halfvec"(double precision[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(double precision[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(double precision[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(double precision[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(double precision[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(double precision[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(double precision[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(double precision[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_vector"(double precision[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_vector"(double precision[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_vector"(double precision[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_vector"(double precision[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_halfvec"(integer[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(integer[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(integer[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(integer[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(integer[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(integer[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(integer[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(integer[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_vector"(integer[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_vector"(integer[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_vector"(integer[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_vector"(integer[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_halfvec"(numeric[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(numeric[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(numeric[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_halfvec"(numeric[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(numeric[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(numeric[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(numeric[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_sparsevec"(numeric[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."array_to_vector"(numeric[], integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."array_to_vector"(numeric[], integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."array_to_vector"(numeric[], integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."array_to_vector"(numeric[], integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_to_float4"("public"."halfvec", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_to_float4"("public"."halfvec", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_to_float4"("public"."halfvec", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_to_float4"("public"."halfvec", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec"("public"."halfvec", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec"("public"."halfvec", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec"("public"."halfvec", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec"("public"."halfvec", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_to_sparsevec"("public"."halfvec", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_to_sparsevec"("public"."halfvec", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_to_sparsevec"("public"."halfvec", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_to_sparsevec"("public"."halfvec", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_to_vector"("public"."halfvec", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_to_vector"("public"."halfvec", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_to_vector"("public"."halfvec", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_to_vector"("public"."halfvec", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_to_halfvec"("public"."sparsevec", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_to_halfvec"("public"."sparsevec", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_to_halfvec"("public"."sparsevec", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_to_halfvec"("public"."sparsevec", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec"("public"."sparsevec", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec"("public"."sparsevec", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec"("public"."sparsevec", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec"("public"."sparsevec", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_to_vector"("public"."sparsevec", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_to_vector"("public"."sparsevec", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_to_vector"("public"."sparsevec", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_to_vector"("public"."sparsevec", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_to_float4"("public"."vector", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_to_float4"("public"."vector", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."vector_to_float4"("public"."vector", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_to_float4"("public"."vector", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_to_halfvec"("public"."vector", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_to_halfvec"("public"."vector", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."vector_to_halfvec"("public"."vector", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_to_halfvec"("public"."vector", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_to_sparsevec"("public"."vector", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_to_sparsevec"("public"."vector", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."vector_to_sparsevec"("public"."vector", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_to_sparsevec"("public"."vector", integer, boolean) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector"("public"."vector", integer, boolean) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector"("public"."vector", integer, boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."vector"("public"."vector", integer, boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector"("public"."vector", integer, boolean) TO "service_role";






















































































































































REVOKE ALL ON FUNCTION "public"."aceptar_invitacion"("p_token" "uuid") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."aceptar_invitacion"("p_token" "uuid") TO "authenticated";



GRANT ALL ON FUNCTION "public"."binary_quantize"("public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."binary_quantize"("public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."binary_quantize"("public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."binary_quantize"("public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."binary_quantize"("public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."binary_quantize"("public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."binary_quantize"("public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."binary_quantize"("public"."vector") TO "service_role";



REVOKE ALL ON FUNCTION "public"."cambiar_estado_usuario"("p_target_id" "uuid", "p_nuevo_estado" boolean) FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."cambiar_estado_usuario"("p_target_id" "uuid", "p_nuevo_estado" boolean) TO "authenticated";



REVOKE ALL ON FUNCTION "public"."cambiar_rol_usuario"("p_target_id" "uuid", "p_nuevo_rol" "public"."rol_enum") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."cambiar_rol_usuario"("p_target_id" "uuid", "p_nuevo_rol" "public"."rol_enum") TO "authenticated";



REVOKE ALL ON FUNCTION "public"."cancelar_invitacion"("p_invitacion_id" "uuid") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."cancelar_invitacion"("p_invitacion_id" "uuid") TO "authenticated";



GRANT ALL ON FUNCTION "public"."cash_dist"("money", "money") TO "postgres";
GRANT ALL ON FUNCTION "public"."cash_dist"("money", "money") TO "anon";
GRANT ALL ON FUNCTION "public"."cash_dist"("money", "money") TO "authenticated";
GRANT ALL ON FUNCTION "public"."cash_dist"("money", "money") TO "service_role";



GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."cosine_distance"("public"."vector", "public"."vector") TO "service_role";



REVOKE ALL ON FUNCTION "public"."crear_empresa_y_owner"("p_nombre_comercial" "text", "p_moneda_base" "text", "p_iva_default" numeric, "p_nombre_completo" "text", "p_plan_nombre" "text") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."crear_empresa_y_owner"("p_nombre_comercial" "text", "p_moneda_base" "text", "p_iva_default" numeric, "p_nombre_completo" "text", "p_plan_nombre" "text") TO "authenticated";



GRANT ALL ON FUNCTION "public"."date_dist"("date", "date") TO "postgres";
GRANT ALL ON FUNCTION "public"."date_dist"("date", "date") TO "anon";
GRANT ALL ON FUNCTION "public"."date_dist"("date", "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."date_dist"("date", "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."float4_dist"(real, real) TO "postgres";
GRANT ALL ON FUNCTION "public"."float4_dist"(real, real) TO "anon";
GRANT ALL ON FUNCTION "public"."float4_dist"(real, real) TO "authenticated";
GRANT ALL ON FUNCTION "public"."float4_dist"(real, real) TO "service_role";



GRANT ALL ON FUNCTION "public"."float8_dist"(double precision, double precision) TO "postgres";
GRANT ALL ON FUNCTION "public"."float8_dist"(double precision, double precision) TO "anon";
GRANT ALL ON FUNCTION "public"."float8_dist"(double precision, double precision) TO "authenticated";
GRANT ALL ON FUNCTION "public"."float8_dist"(double precision, double precision) TO "service_role";



REVOKE ALL ON FUNCTION "public"."fn_get_auth_tenant"() FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."fn_get_auth_tenant"() TO "authenticated";



REVOKE ALL ON FUNCTION "public"."fn_tenant_bloqueado"() FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."fn_tenant_bloqueado"() TO "authenticated";



GRANT ALL ON FUNCTION "public"."gbt_bit_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bit_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bit_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bit_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bit_consistent"("internal", bit, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bit_consistent"("internal", bit, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bit_consistent"("internal", bit, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bit_consistent"("internal", bit, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bit_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bit_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bit_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bit_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bit_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bit_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bit_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bit_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bit_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bit_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bit_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bit_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bit_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bit_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bit_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bit_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bool_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bool_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bool_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bool_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bool_consistent"("internal", boolean, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bool_consistent"("internal", boolean, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bool_consistent"("internal", boolean, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bool_consistent"("internal", boolean, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bool_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bool_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bool_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bool_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bool_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bool_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bool_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bool_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bool_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bool_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bool_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bool_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bool_same"("public"."gbtreekey2", "public"."gbtreekey2", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bool_same"("public"."gbtreekey2", "public"."gbtreekey2", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bool_same"("public"."gbtreekey2", "public"."gbtreekey2", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bool_same"("public"."gbtreekey2", "public"."gbtreekey2", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bool_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bool_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bool_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bool_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bpchar_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bpchar_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bpchar_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bpchar_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bpchar_consistent"("internal", character, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bpchar_consistent"("internal", character, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bpchar_consistent"("internal", character, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bpchar_consistent"("internal", character, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bytea_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bytea_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bytea_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bytea_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bytea_consistent"("internal", "bytea", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bytea_consistent"("internal", "bytea", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bytea_consistent"("internal", "bytea", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bytea_consistent"("internal", "bytea", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bytea_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bytea_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bytea_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bytea_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bytea_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bytea_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bytea_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bytea_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bytea_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bytea_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bytea_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bytea_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_bytea_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_bytea_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_bytea_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_bytea_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_cash_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_cash_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_cash_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_cash_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_cash_consistent"("internal", "money", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_cash_consistent"("internal", "money", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_cash_consistent"("internal", "money", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_cash_consistent"("internal", "money", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_cash_distance"("internal", "money", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_cash_distance"("internal", "money", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_cash_distance"("internal", "money", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_cash_distance"("internal", "money", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_cash_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_cash_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_cash_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_cash_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_cash_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_cash_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_cash_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_cash_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_cash_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_cash_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_cash_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_cash_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_cash_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_cash_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_cash_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_cash_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_cash_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_cash_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_cash_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_cash_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_date_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_date_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_date_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_date_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_date_consistent"("internal", "date", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_date_consistent"("internal", "date", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_date_consistent"("internal", "date", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_date_consistent"("internal", "date", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_date_distance"("internal", "date", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_date_distance"("internal", "date", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_date_distance"("internal", "date", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_date_distance"("internal", "date", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_date_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_date_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_date_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_date_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_date_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_date_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_date_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_date_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_date_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_date_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_date_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_date_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_date_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_date_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_date_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_date_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_date_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_date_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_date_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_date_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_decompress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_decompress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_decompress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_decompress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_enum_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_enum_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_enum_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_enum_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_enum_consistent"("internal", "anyenum", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_enum_consistent"("internal", "anyenum", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_enum_consistent"("internal", "anyenum", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_enum_consistent"("internal", "anyenum", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_enum_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_enum_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_enum_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_enum_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_enum_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_enum_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_enum_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_enum_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_enum_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_enum_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_enum_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_enum_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_enum_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_enum_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_enum_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_enum_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_enum_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_enum_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_enum_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_enum_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float4_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float4_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float4_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float4_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float4_consistent"("internal", real, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float4_consistent"("internal", real, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float4_consistent"("internal", real, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float4_consistent"("internal", real, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float4_distance"("internal", real, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float4_distance"("internal", real, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float4_distance"("internal", real, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float4_distance"("internal", real, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float4_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float4_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float4_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float4_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float4_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float4_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float4_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float4_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float4_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float4_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float4_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float4_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float4_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float4_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float4_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float4_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float4_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float4_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float4_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float4_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float8_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float8_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float8_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float8_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float8_consistent"("internal", double precision, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float8_consistent"("internal", double precision, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float8_consistent"("internal", double precision, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float8_consistent"("internal", double precision, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float8_distance"("internal", double precision, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float8_distance"("internal", double precision, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float8_distance"("internal", double precision, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float8_distance"("internal", double precision, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float8_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float8_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float8_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float8_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float8_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float8_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float8_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float8_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float8_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float8_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float8_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float8_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_float8_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_float8_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_float8_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_float8_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_inet_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_inet_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_inet_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_inet_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_inet_consistent"("internal", "inet", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_inet_consistent"("internal", "inet", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_inet_consistent"("internal", "inet", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_inet_consistent"("internal", "inet", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_inet_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_inet_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_inet_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_inet_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_inet_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_inet_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_inet_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_inet_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_inet_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_inet_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_inet_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_inet_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_inet_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_inet_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_inet_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_inet_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int2_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int2_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int2_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int2_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int2_consistent"("internal", smallint, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int2_consistent"("internal", smallint, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int2_consistent"("internal", smallint, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int2_consistent"("internal", smallint, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int2_distance"("internal", smallint, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int2_distance"("internal", smallint, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int2_distance"("internal", smallint, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int2_distance"("internal", smallint, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int2_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int2_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int2_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int2_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int2_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int2_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int2_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int2_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int2_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int2_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int2_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int2_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int2_same"("public"."gbtreekey4", "public"."gbtreekey4", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int2_same"("public"."gbtreekey4", "public"."gbtreekey4", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int2_same"("public"."gbtreekey4", "public"."gbtreekey4", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int2_same"("public"."gbtreekey4", "public"."gbtreekey4", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int2_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int2_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int2_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int2_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int4_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int4_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int4_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int4_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int4_consistent"("internal", integer, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int4_consistent"("internal", integer, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int4_consistent"("internal", integer, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int4_consistent"("internal", integer, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int4_distance"("internal", integer, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int4_distance"("internal", integer, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int4_distance"("internal", integer, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int4_distance"("internal", integer, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int4_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int4_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int4_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int4_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int4_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int4_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int4_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int4_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int4_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int4_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int4_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int4_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int4_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int4_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int4_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int4_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int4_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int4_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int4_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int4_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int8_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int8_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int8_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int8_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int8_consistent"("internal", bigint, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int8_consistent"("internal", bigint, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int8_consistent"("internal", bigint, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int8_consistent"("internal", bigint, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int8_distance"("internal", bigint, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int8_distance"("internal", bigint, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int8_distance"("internal", bigint, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int8_distance"("internal", bigint, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int8_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int8_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int8_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int8_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int8_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int8_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int8_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int8_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int8_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int8_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int8_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int8_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_int8_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_int8_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_int8_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_int8_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_consistent"("internal", interval, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_consistent"("internal", interval, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_consistent"("internal", interval, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_consistent"("internal", interval, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_decompress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_decompress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_decompress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_decompress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_distance"("internal", interval, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_distance"("internal", interval, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_distance"("internal", interval, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_distance"("internal", interval, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_same"("public"."gbtreekey32", "public"."gbtreekey32", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_same"("public"."gbtreekey32", "public"."gbtreekey32", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_same"("public"."gbtreekey32", "public"."gbtreekey32", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_same"("public"."gbtreekey32", "public"."gbtreekey32", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_intv_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_intv_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_intv_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_intv_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad8_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad8_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad8_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad8_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad8_consistent"("internal", "macaddr8", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad8_consistent"("internal", "macaddr8", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad8_consistent"("internal", "macaddr8", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad8_consistent"("internal", "macaddr8", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad8_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad8_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad8_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad8_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad8_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad8_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad8_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad8_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad8_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad8_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad8_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad8_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad8_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad8_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad8_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad8_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad8_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad_consistent"("internal", "macaddr", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad_consistent"("internal", "macaddr", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad_consistent"("internal", "macaddr", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad_consistent"("internal", "macaddr", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_macad_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_macad_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_macad_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_macad_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_numeric_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_numeric_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_numeric_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_numeric_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_numeric_consistent"("internal", numeric, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_numeric_consistent"("internal", numeric, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_numeric_consistent"("internal", numeric, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_numeric_consistent"("internal", numeric, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_numeric_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_numeric_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_numeric_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_numeric_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_numeric_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_numeric_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_numeric_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_numeric_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_numeric_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_numeric_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_numeric_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_numeric_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_numeric_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_numeric_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_numeric_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_numeric_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_oid_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_oid_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_oid_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_oid_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_oid_consistent"("internal", "oid", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_oid_consistent"("internal", "oid", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_oid_consistent"("internal", "oid", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_oid_consistent"("internal", "oid", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_oid_distance"("internal", "oid", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_oid_distance"("internal", "oid", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_oid_distance"("internal", "oid", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_oid_distance"("internal", "oid", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_oid_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_oid_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_oid_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_oid_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_oid_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_oid_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_oid_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_oid_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_oid_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_oid_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_oid_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_oid_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_oid_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_oid_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_oid_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_oid_same"("public"."gbtreekey8", "public"."gbtreekey8", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_oid_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_oid_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_oid_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_oid_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_text_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_text_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_text_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_text_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_text_consistent"("internal", "text", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_text_consistent"("internal", "text", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_text_consistent"("internal", "text", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_text_consistent"("internal", "text", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_text_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_text_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_text_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_text_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_text_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_text_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_text_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_text_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_text_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_text_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_text_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_text_same"("public"."gbtreekey_var", "public"."gbtreekey_var", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_text_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_text_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_text_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_text_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_time_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_time_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_time_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_time_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_time_consistent"("internal", time without time zone, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_time_consistent"("internal", time without time zone, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_time_consistent"("internal", time without time zone, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_time_consistent"("internal", time without time zone, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_time_distance"("internal", time without time zone, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_time_distance"("internal", time without time zone, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_time_distance"("internal", time without time zone, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_time_distance"("internal", time without time zone, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_time_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_time_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_time_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_time_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_time_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_time_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_time_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_time_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_time_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_time_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_time_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_time_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_time_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_time_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_time_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_time_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_time_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_time_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_time_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_time_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_timetz_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_timetz_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_timetz_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_timetz_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_timetz_consistent"("internal", time with time zone, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_timetz_consistent"("internal", time with time zone, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_timetz_consistent"("internal", time with time zone, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_timetz_consistent"("internal", time with time zone, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_ts_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_ts_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_ts_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_ts_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_ts_consistent"("internal", timestamp without time zone, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_ts_consistent"("internal", timestamp without time zone, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_ts_consistent"("internal", timestamp without time zone, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_ts_consistent"("internal", timestamp without time zone, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_ts_distance"("internal", timestamp without time zone, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_ts_distance"("internal", timestamp without time zone, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_ts_distance"("internal", timestamp without time zone, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_ts_distance"("internal", timestamp without time zone, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_ts_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_ts_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_ts_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_ts_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_ts_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_ts_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_ts_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_ts_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_ts_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_ts_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_ts_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_ts_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_ts_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_ts_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_ts_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_ts_same"("public"."gbtreekey16", "public"."gbtreekey16", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_ts_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_ts_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_ts_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_ts_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_tstz_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_tstz_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_tstz_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_tstz_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_tstz_consistent"("internal", timestamp with time zone, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_tstz_consistent"("internal", timestamp with time zone, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_tstz_consistent"("internal", timestamp with time zone, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_tstz_consistent"("internal", timestamp with time zone, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_tstz_distance"("internal", timestamp with time zone, smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_tstz_distance"("internal", timestamp with time zone, smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_tstz_distance"("internal", timestamp with time zone, smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_tstz_distance"("internal", timestamp with time zone, smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_uuid_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_uuid_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_uuid_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_uuid_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_uuid_consistent"("internal", "uuid", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_uuid_consistent"("internal", "uuid", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_uuid_consistent"("internal", "uuid", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_uuid_consistent"("internal", "uuid", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_uuid_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_uuid_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_uuid_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_uuid_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_uuid_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_uuid_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_uuid_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_uuid_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_uuid_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_uuid_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_uuid_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_uuid_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_uuid_same"("public"."gbtreekey32", "public"."gbtreekey32", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_uuid_same"("public"."gbtreekey32", "public"."gbtreekey32", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_uuid_same"("public"."gbtreekey32", "public"."gbtreekey32", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_uuid_same"("public"."gbtreekey32", "public"."gbtreekey32", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_uuid_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_uuid_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_uuid_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_uuid_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_var_decompress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_var_decompress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_var_decompress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_var_decompress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gbt_var_fetch"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gbt_var_fetch"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gbt_var_fetch"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gbt_var_fetch"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gin_extract_query_trgm"("text", "internal", smallint, "internal", "internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gin_extract_query_trgm"("text", "internal", smallint, "internal", "internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gin_extract_query_trgm"("text", "internal", smallint, "internal", "internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gin_extract_query_trgm"("text", "internal", smallint, "internal", "internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gin_extract_value_trgm"("text", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gin_extract_value_trgm"("text", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gin_extract_value_trgm"("text", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gin_extract_value_trgm"("text", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gin_trgm_consistent"("internal", smallint, "text", integer, "internal", "internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gin_trgm_consistent"("internal", smallint, "text", integer, "internal", "internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gin_trgm_consistent"("internal", smallint, "text", integer, "internal", "internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gin_trgm_consistent"("internal", smallint, "text", integer, "internal", "internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gin_trgm_triconsistent"("internal", smallint, "text", integer, "internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gin_trgm_triconsistent"("internal", smallint, "text", integer, "internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gin_trgm_triconsistent"("internal", smallint, "text", integer, "internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gin_trgm_triconsistent"("internal", smallint, "text", integer, "internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_compress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_compress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_compress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_compress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_consistent"("internal", "text", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_consistent"("internal", "text", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_consistent"("internal", "text", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_consistent"("internal", "text", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_decompress"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_decompress"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_decompress"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_decompress"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_distance"("internal", "text", smallint, "oid", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_distance"("internal", "text", smallint, "oid", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_distance"("internal", "text", smallint, "oid", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_distance"("internal", "text", smallint, "oid", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_options"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_options"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_options"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_options"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_penalty"("internal", "internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_penalty"("internal", "internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_penalty"("internal", "internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_penalty"("internal", "internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_picksplit"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_picksplit"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_picksplit"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_picksplit"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_same"("public"."gtrgm", "public"."gtrgm", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_same"("public"."gtrgm", "public"."gtrgm", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_same"("public"."gtrgm", "public"."gtrgm", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_same"("public"."gtrgm", "public"."gtrgm", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."gtrgm_union"("internal", "internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."gtrgm_union"("internal", "internal") TO "anon";
GRANT ALL ON FUNCTION "public"."gtrgm_union"("internal", "internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gtrgm_union"("internal", "internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_accum"(double precision[], "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_accum"(double precision[], "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_accum"(double precision[], "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_accum"(double precision[], "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_add"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_add"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_add"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_add"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_avg"(double precision[]) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_avg"(double precision[]) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_avg"(double precision[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_avg"(double precision[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_cmp"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_cmp"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_cmp"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_cmp"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_combine"(double precision[], double precision[]) TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_combine"(double precision[], double precision[]) TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_combine"(double precision[], double precision[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_combine"(double precision[], double precision[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_concat"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_concat"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_concat"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_concat"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_eq"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_eq"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_eq"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_eq"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_ge"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_ge"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_ge"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_ge"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_gt"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_gt"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_gt"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_gt"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_l2_squared_distance"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_l2_squared_distance"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_l2_squared_distance"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_l2_squared_distance"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_le"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_le"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_le"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_le"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_lt"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_lt"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_lt"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_lt"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_mul"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_mul"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_mul"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_mul"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_ne"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_ne"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_ne"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_ne"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_negative_inner_product"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_negative_inner_product"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_negative_inner_product"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_negative_inner_product"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_spherical_distance"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_spherical_distance"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_spherical_distance"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_spherical_distance"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."halfvec_sub"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."halfvec_sub"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."halfvec_sub"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."halfvec_sub"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."hamming_distance"(bit, bit) TO "postgres";
GRANT ALL ON FUNCTION "public"."hamming_distance"(bit, bit) TO "anon";
GRANT ALL ON FUNCTION "public"."hamming_distance"(bit, bit) TO "authenticated";
GRANT ALL ON FUNCTION "public"."hamming_distance"(bit, bit) TO "service_role";



GRANT ALL ON FUNCTION "public"."hnsw_bit_support"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."hnsw_bit_support"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."hnsw_bit_support"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."hnsw_bit_support"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."hnsw_halfvec_support"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."hnsw_halfvec_support"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."hnsw_halfvec_support"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."hnsw_halfvec_support"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."hnsw_sparsevec_support"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."hnsw_sparsevec_support"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."hnsw_sparsevec_support"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."hnsw_sparsevec_support"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."hnswhandler"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."hnswhandler"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."hnswhandler"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."hnswhandler"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."inner_product"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."inner_product"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."inner_product"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."inner_product"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."int2_dist"(smallint, smallint) TO "postgres";
GRANT ALL ON FUNCTION "public"."int2_dist"(smallint, smallint) TO "anon";
GRANT ALL ON FUNCTION "public"."int2_dist"(smallint, smallint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."int2_dist"(smallint, smallint) TO "service_role";



GRANT ALL ON FUNCTION "public"."int4_dist"(integer, integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."int4_dist"(integer, integer) TO "anon";
GRANT ALL ON FUNCTION "public"."int4_dist"(integer, integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."int4_dist"(integer, integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."int8_dist"(bigint, bigint) TO "postgres";
GRANT ALL ON FUNCTION "public"."int8_dist"(bigint, bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."int8_dist"(bigint, bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."int8_dist"(bigint, bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."interval_dist"(interval, interval) TO "postgres";
GRANT ALL ON FUNCTION "public"."interval_dist"(interval, interval) TO "anon";
GRANT ALL ON FUNCTION "public"."interval_dist"(interval, interval) TO "authenticated";
GRANT ALL ON FUNCTION "public"."interval_dist"(interval, interval) TO "service_role";



REVOKE ALL ON FUNCTION "public"."invitar_usuario"("p_email" "text", "p_rol" "public"."rol_enum") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."invitar_usuario"("p_email" "text", "p_rol" "public"."rol_enum") TO "authenticated";



GRANT ALL ON FUNCTION "public"."ivfflat_bit_support"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."ivfflat_bit_support"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."ivfflat_bit_support"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."ivfflat_bit_support"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."ivfflat_halfvec_support"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."ivfflat_halfvec_support"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."ivfflat_halfvec_support"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."ivfflat_halfvec_support"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."ivfflathandler"("internal") TO "postgres";
GRANT ALL ON FUNCTION "public"."ivfflathandler"("internal") TO "anon";
GRANT ALL ON FUNCTION "public"."ivfflathandler"("internal") TO "authenticated";
GRANT ALL ON FUNCTION "public"."ivfflathandler"("internal") TO "service_role";



GRANT ALL ON FUNCTION "public"."jaccard_distance"(bit, bit) TO "postgres";
GRANT ALL ON FUNCTION "public"."jaccard_distance"(bit, bit) TO "anon";
GRANT ALL ON FUNCTION "public"."jaccard_distance"(bit, bit) TO "authenticated";
GRANT ALL ON FUNCTION "public"."jaccard_distance"(bit, bit) TO "service_role";



GRANT ALL ON FUNCTION "public"."l1_distance"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."l1_distance"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."l1_distance"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l1_distance"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."l2_distance"("public"."halfvec", "public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."halfvec", "public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."halfvec", "public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."halfvec", "public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."l2_distance"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."l2_distance"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l2_distance"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."l2_norm"("public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."l2_norm"("public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."l2_norm"("public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l2_norm"("public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."l2_norm"("public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."l2_norm"("public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."l2_norm"("public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l2_norm"("public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."l2_normalize"("public"."vector") TO "service_role";



REVOKE ALL ON FUNCTION "public"."obtener_equipo"() FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."obtener_equipo"() TO "authenticated";



GRANT ALL ON FUNCTION "public"."oid_dist"("oid", "oid") TO "postgres";
GRANT ALL ON FUNCTION "public"."oid_dist"("oid", "oid") TO "anon";
GRANT ALL ON FUNCTION "public"."oid_dist"("oid", "oid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."oid_dist"("oid", "oid") TO "service_role";



REVOKE ALL ON FUNCTION "public"."promover_a_owner"("p_target_id" "uuid") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."promover_a_owner"("p_target_id" "uuid") TO "authenticated";



GRANT ALL ON FUNCTION "public"."set_limit"(real) TO "postgres";
GRANT ALL ON FUNCTION "public"."set_limit"(real) TO "anon";
GRANT ALL ON FUNCTION "public"."set_limit"(real) TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_limit"(real) TO "service_role";



GRANT ALL ON FUNCTION "public"."show_limit"() TO "postgres";
GRANT ALL ON FUNCTION "public"."show_limit"() TO "anon";
GRANT ALL ON FUNCTION "public"."show_limit"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."show_limit"() TO "service_role";



GRANT ALL ON FUNCTION "public"."show_trgm"("text") TO "postgres";
GRANT ALL ON FUNCTION "public"."show_trgm"("text") TO "anon";
GRANT ALL ON FUNCTION "public"."show_trgm"("text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."show_trgm"("text") TO "service_role";



GRANT ALL ON FUNCTION "public"."similarity"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."similarity"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."similarity"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."similarity"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."similarity_dist"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."similarity_dist"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."similarity_dist"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."similarity_dist"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."similarity_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."similarity_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."similarity_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."similarity_op"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_cmp"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_cmp"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_cmp"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_cmp"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_eq"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_eq"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_eq"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_eq"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_ge"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_ge"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_ge"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_ge"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_gt"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_gt"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_gt"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_gt"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_l2_squared_distance"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_l2_squared_distance"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_l2_squared_distance"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_l2_squared_distance"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_le"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_le"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_le"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_le"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_lt"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_lt"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_lt"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_lt"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_ne"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_ne"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_ne"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_ne"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sparsevec_negative_inner_product"("public"."sparsevec", "public"."sparsevec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sparsevec_negative_inner_product"("public"."sparsevec", "public"."sparsevec") TO "anon";
GRANT ALL ON FUNCTION "public"."sparsevec_negative_inner_product"("public"."sparsevec", "public"."sparsevec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sparsevec_negative_inner_product"("public"."sparsevec", "public"."sparsevec") TO "service_role";



GRANT ALL ON FUNCTION "public"."strict_word_similarity"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."strict_word_similarity"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."strict_word_similarity"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."strict_word_similarity"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."strict_word_similarity_commutator_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_commutator_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_commutator_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_commutator_op"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."strict_word_similarity_dist_commutator_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_dist_commutator_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_dist_commutator_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_dist_commutator_op"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."strict_word_similarity_dist_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_dist_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_dist_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_dist_op"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."strict_word_similarity_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."strict_word_similarity_op"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."subvector"("public"."halfvec", integer, integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."subvector"("public"."halfvec", integer, integer) TO "anon";
GRANT ALL ON FUNCTION "public"."subvector"("public"."halfvec", integer, integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."subvector"("public"."halfvec", integer, integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."subvector"("public"."vector", integer, integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."subvector"("public"."vector", integer, integer) TO "anon";
GRANT ALL ON FUNCTION "public"."subvector"("public"."vector", integer, integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."subvector"("public"."vector", integer, integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."time_dist"(time without time zone, time without time zone) TO "postgres";
GRANT ALL ON FUNCTION "public"."time_dist"(time without time zone, time without time zone) TO "anon";
GRANT ALL ON FUNCTION "public"."time_dist"(time without time zone, time without time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."time_dist"(time without time zone, time without time zone) TO "service_role";



GRANT ALL ON FUNCTION "public"."ts_dist"(timestamp without time zone, timestamp without time zone) TO "postgres";
GRANT ALL ON FUNCTION "public"."ts_dist"(timestamp without time zone, timestamp without time zone) TO "anon";
GRANT ALL ON FUNCTION "public"."ts_dist"(timestamp without time zone, timestamp without time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."ts_dist"(timestamp without time zone, timestamp without time zone) TO "service_role";



GRANT ALL ON FUNCTION "public"."tstz_dist"(timestamp with time zone, timestamp with time zone) TO "postgres";
GRANT ALL ON FUNCTION "public"."tstz_dist"(timestamp with time zone, timestamp with time zone) TO "anon";
GRANT ALL ON FUNCTION "public"."tstz_dist"(timestamp with time zone, timestamp with time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."tstz_dist"(timestamp with time zone, timestamp with time zone) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_accum"(double precision[], "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_accum"(double precision[], "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_accum"(double precision[], "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_accum"(double precision[], "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_add"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_add"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_add"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_add"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_avg"(double precision[]) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_avg"(double precision[]) TO "anon";
GRANT ALL ON FUNCTION "public"."vector_avg"(double precision[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_avg"(double precision[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_cmp"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_cmp"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_cmp"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_cmp"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_combine"(double precision[], double precision[]) TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_combine"(double precision[], double precision[]) TO "anon";
GRANT ALL ON FUNCTION "public"."vector_combine"(double precision[], double precision[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_combine"(double precision[], double precision[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_concat"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_concat"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_concat"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_concat"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_dims"("public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_dims"("public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_dims"("public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_dims"("public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_dims"("public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_dims"("public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_dims"("public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_dims"("public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_eq"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_eq"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_eq"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_eq"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_ge"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_ge"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_ge"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_ge"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_gt"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_gt"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_gt"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_gt"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_l2_squared_distance"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_l2_squared_distance"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_l2_squared_distance"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_l2_squared_distance"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_le"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_le"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_le"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_le"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_lt"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_lt"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_lt"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_lt"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_mul"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_mul"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_mul"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_mul"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_ne"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_ne"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_ne"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_ne"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_negative_inner_product"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_negative_inner_product"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_negative_inner_product"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_negative_inner_product"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_norm"("public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_norm"("public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_norm"("public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_norm"("public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_spherical_distance"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_spherical_distance"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_spherical_distance"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_spherical_distance"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."vector_sub"("public"."vector", "public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."vector_sub"("public"."vector", "public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."vector_sub"("public"."vector", "public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."vector_sub"("public"."vector", "public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."word_similarity"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."word_similarity"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."word_similarity"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."word_similarity"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."word_similarity_commutator_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."word_similarity_commutator_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."word_similarity_commutator_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."word_similarity_commutator_op"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."word_similarity_dist_commutator_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."word_similarity_dist_commutator_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."word_similarity_dist_commutator_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."word_similarity_dist_commutator_op"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."word_similarity_dist_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."word_similarity_dist_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."word_similarity_dist_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."word_similarity_dist_op"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."word_similarity_op"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."word_similarity_op"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."word_similarity_op"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."word_similarity_op"("text", "text") TO "service_role";












GRANT ALL ON FUNCTION "public"."avg"("public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."avg"("public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."avg"("public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."avg"("public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."avg"("public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."avg"("public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."avg"("public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."avg"("public"."vector") TO "service_role";



GRANT ALL ON FUNCTION "public"."sum"("public"."halfvec") TO "postgres";
GRANT ALL ON FUNCTION "public"."sum"("public"."halfvec") TO "anon";
GRANT ALL ON FUNCTION "public"."sum"("public"."halfvec") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sum"("public"."halfvec") TO "service_role";



GRANT ALL ON FUNCTION "public"."sum"("public"."vector") TO "postgres";
GRANT ALL ON FUNCTION "public"."sum"("public"."vector") TO "anon";
GRANT ALL ON FUNCTION "public"."sum"("public"."vector") TO "authenticated";
GRANT ALL ON FUNCTION "public"."sum"("public"."vector") TO "service_role";









GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."atributos_catalogo" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."atributos_catalogo" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."atributos_catalogo" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."audit_eventos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."audit_eventos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."audit_eventos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."bodegas" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."bodegas" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."bodegas" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cache_consultas_ia" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cache_consultas_ia" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cache_consultas_ia" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."caracteristicas" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."caracteristicas" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."caracteristicas" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."catalogo_sinonimos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."catalogo_sinonimos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."catalogo_sinonimos" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."catalogos_oficiales" TO "service_role";
GRANT SELECT ON TABLE "public"."catalogos_oficiales" TO "authenticated";
GRANT SELECT ON TABLE "public"."catalogos_oficiales" TO "anon";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."categorias_fiscales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."categorias_fiscales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."categorias_fiscales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."categorias_producto" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."categorias_producto" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."categorias_producto" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cliente_tags" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cliente_tags" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cliente_tags" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."clientes" TO "anon";
GRANT ALL ON TABLE "public"."clientes" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."clientes" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."condiciones_pago" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."condiciones_pago" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."condiciones_pago" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."contactos_cliente" TO "anon";
GRANT ALL ON TABLE "public"."contactos_cliente" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."contactos_cliente" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."costos_producto" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."costos_producto" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."costos_producto" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_aprobaciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_aprobaciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_aprobaciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_eventos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_eventos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_eventos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_grupos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_grupos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_grupos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_lineas" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_lineas" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_lineas" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_narrativas_ia" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_narrativas_ia" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizacion_narrativas_ia" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizaciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizaciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cotizaciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cpq_reglas_catalogo" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cpq_reglas_catalogo" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cpq_reglas_catalogo" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_catalogo_actividades" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_catalogo_actividades" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_catalogo_actividades" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_catalogo_cabys" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_catalogo_cabys" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_catalogo_cabys" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_documentos_fiscales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_documentos_fiscales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_documentos_fiscales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_empresa_actividades" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_empresa_actividades" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_empresa_actividades" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_series_documentales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_series_documentales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_series_documentales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_sucursales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_sucursales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_sucursales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_terminales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_terminales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cr_terminales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cuentas_contables" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cuentas_contables" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cuentas_contables" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cxc_transacciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cxc_transacciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cxc_transacciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cxp_transacciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cxp_transacciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."cxp_transacciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."direcciones_cliente" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."direcciones_cliente" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."direcciones_cliente" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_comerciales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_comerciales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_comerciales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_historial_estados" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_historial_estados" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_historial_estados" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_versiones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_versiones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."documentos_versiones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."empresa_suscripciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."empresa_suscripciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."empresa_suscripciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."empresas" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."empresas" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."empresas" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."eventos_consumo" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."eventos_consumo" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."eventos_consumo" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."finanzas_eventos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."finanzas_eventos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."finanzas_eventos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."grupos_fiscales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."grupos_fiscales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."grupos_fiscales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."ia_feedback" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."ia_feedback" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."ia_feedback" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."ia_prompts_externos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."ia_prompts_externos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."ia_prompts_externos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."impuestos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."impuestos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."impuestos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."industrias" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."industrias" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."industrias" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_lotes" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_lotes" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_lotes" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_movimientos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_movimientos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_movimientos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_reservas" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_reservas" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_reservas" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_saldos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_saldos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_saldos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_ubicaciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_ubicaciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."inventario_ubicaciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."invitaciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."invitaciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."invitaciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."lineas_documento" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."lineas_documento" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."lineas_documento" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."listas_precios" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."listas_precios" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."listas_precios" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."marcas" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."marcas" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."marcas" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."monedas" TO "service_role";
GRANT SELECT ON TABLE "public"."monedas" TO "authenticated";
GRANT SELECT ON TABLE "public"."monedas" TO "anon";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."origenes_cliente" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."origenes_cliente" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."origenes_cliente" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."perfiles" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."perfiles" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."perfiles" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."plan_configuracion" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."plan_configuracion" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."plan_configuracion" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."planes" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."planes" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."planes" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."politicas_comerciales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."politicas_comerciales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."politicas_comerciales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."precio_escalas" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."precio_escalas" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."precio_escalas" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."precios_producto" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."precios_producto" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."precios_producto" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_atributos_valores" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_atributos_valores" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_atributos_valores" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_codigos_oficiales" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_codigos_oficiales" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_codigos_oficiales" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_compatibilidades" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_compatibilidades" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_compatibilidades" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_componentes" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_componentes" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_componentes" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_embeddings" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_embeddings" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_embeddings" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_proveedores" TO "anon";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_proveedores" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_proveedores" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_recursos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_recursos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_recursos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_relaciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_relaciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_relaciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_search_index" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_search_index" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."producto_search_index" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_fisicos" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_fisicos" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_fisicos" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_servicios" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_servicios" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_servicios" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_suscripciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_suscripciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."productos_suscripciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."proveedores" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."proveedores" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."proveedores" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."recurso_chunks" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."recurso_chunks" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."recurso_chunks" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."saas_planes" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."saas_planes" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."saas_planes" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."search_reindex_queue" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."search_reindex_queue" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."search_reindex_queue" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."sistema_eventos_bus" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."sistema_eventos_bus" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."sistema_eventos_bus" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."sistema_observabilidad_logs" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."sistema_observabilidad_logs" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."sistema_observabilidad_logs" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."suscripciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."suscripciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."suscripciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tags" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tags" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tags" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_ia_limits" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_ia_limits" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_ia_limits" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_ia_usage" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_ia_usage" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_ia_usage" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_usage" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_usage" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tenant_usage" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tipos_cambio_historico" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tipos_cambio_historico" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tipos_cambio_historico" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tipos_cliente" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tipos_cliente" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tipos_cliente" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."tipos_identificacion" TO "service_role";
GRANT SELECT ON TABLE "public"."tipos_identificacion" TO "authenticated";
GRANT SELECT ON TABLE "public"."tipos_identificacion" TO "anon";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."unidades_medida" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."unidades_medida" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."unidades_medida" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."vw_inventario_disponibilidad" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."vw_inventario_disponibilidad" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."vw_inventario_disponibilidad" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."workflow_transiciones" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."workflow_transiciones" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."workflow_transiciones" TO "service_role";



GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."zonas" TO "anon";
GRANT SELECT,REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."zonas" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."zonas" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLES TO "service_role";



































