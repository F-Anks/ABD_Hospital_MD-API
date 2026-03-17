-- Equipo : SICPES - Servicios Medicos (md_user)
-- Procedimiento almacenado para limpiar las tablas relacionadas con pacientes
-- Creado por: ChatGPT-4 (OpenAI) - Adaptado por Jose Francisco Flores Amador
-- Supervisado por: Ing. Jose Francisco Flores Amador y Edwin Hernández Campos
-- NOTA: Se registra UNA sola entrada en tbi_bitacora por operación de limpieza.

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_limpiar_tablas_pacientes`(
    IN p_usuario_ip VARCHAR(100)
)
BEGIN

    DECLARE v_total_eliminados INT DEFAULT 0;

    -- Contar cuántos pacientes hay antes de borrar
    SELECT COUNT(*) INTO v_total_eliminados FROM tbb_pacientes;

    -- Desactivar validación de llaves foráneas
    SET FOREIGN_KEY_CHECKS = 0;

    -- Limpiar tablas (TRUNCATE es más rápido)
    TRUNCATE TABLE tbb_pacientes;
    TRUNCATE TABLE tbb_personas_fisicas;
    TRUNCATE TABLE tbb_personas;

    -- Reactivar llaves foráneas
    SET FOREIGN_KEY_CHECKS = 1;

    -- Registrar UNA sola entrada en bitacora por toda la operación de limpieza
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion, Fecha_Hora)
    VALUES (
        'tbb_pacientes',
        p_usuario_ip,
        'Delete',
        CONCAT('Se han eliminado ', v_total_eliminados, ' pacientes y sus registros asociados (personas_fisicas, personas).'),
        NOW()
    );

END