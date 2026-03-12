/*
=============================================================================
Nombre del archivo: triggers_bitacora.sql
Descripción del archivo: Archivo deprecado — la lógica de bitácora se movió directamente a los Stored Procedures para registrar UNA sola entrada por operación masiva, en lugar de una por cada fila.
Creado por: Agente AI Antigravity
Adaptado por: 
Supervisado por: 
=============================================================================
*/

-- Los triggers fueron reemplazados por INSERTs directos dentro de:
--   sp_poblar_datos.sql          (registra 1 entrada por INSERT masivo)
--   sp_limpiar_tablas_pacientes.sql (registra 1 entrada por DELETE masivo)
