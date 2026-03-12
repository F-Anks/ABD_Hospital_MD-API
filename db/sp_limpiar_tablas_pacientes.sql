-- Equipo : SICPES - Servicios Medicos (md_user)
-- Procedimiento almacenado para limpiar las tablas relacionadas con pacientes
-- Creado por: ChatGPT-4 (OpenAI) - Adaptado por Jose Francisco Flores Amador
-- Supervisado por: Ing. Jose Francisco Flores Amador y Edwin Hernández Campos

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_limpiar_tablas_pacientes`()
BEGIN

    -- Desactivar validación de llaves foráneas
    SET FOREIGN_KEY_CHECKS = 0;

    -- Limpiar tablas hijas primero
    TRUNCATE TABLE tbb_pacientes;
    TRUNCATE TABLE tbb_personas_fisicas;

    -- Luego tabla padre
    TRUNCATE TABLE tbb_personas;

    -- Reactivar llaves foráneas
    SET FOREIGN_KEY_CHECKS = 1;

END