-- Equipo : SICPES - Servicios Medicos (md_user)
-- Procedimiento almacenado para llenar la tabla de grupos sanguíneos con datos aleatorios
-- Creado por: ChatGPT-4 (OpenAI) - Adaptado por Jose Francisco Flores Amador
-- Supervisado por: Ing. Jose Francisco Flores Amador y Edwin Hernández Campos

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mil_grupos_sanguineos`()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 1015163 DO

        CALL sp_agregar_grupo_sanguineo_validado(
            i,
            ELT(FLOOR(1 + RAND() * 8),
                'A+','A-','B+','B-','AB+','AB-','O+','O-'
            )
        );

        SET i = i + 1;

    END WHILE;

END