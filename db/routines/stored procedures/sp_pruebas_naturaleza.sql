-- Equipo : SICPES - Servicios Medicos (md_user)
-- Procedimiento almacenado para realizar pruebas de naturaleza con validaciones
-- Creado por: ChatGPT-4 (OpenAI) - Adaptado por Jose Francisco Flores Amador
-- Supervisado por: Ing. Jose Francisco Flores Amador y Edwin Hernández Campos


CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pruebas_naturaleza`(
    vcantidad_raw VARCHAR(20), 
    vgnero VARCHAR(10),
    vedad_minima_raw VARCHAR(20), 
    vedad_maxima_raw VARCHAR(20), 
    vstatus_vida VARCHAR(20),
    vtipo_edad VARCHAR(20)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_cantidad_final INT;
    DECLARE v_min_final INT DEFAULT 0;
    DECLARE v_max_final INT DEFAULT 120;
    DECLARE v_edad_simulada INT;
    DECLARE v_status_medico_final VARCHAR(150);

    -- VALIDAR CANTIDAD
    IF vcantidad_raw IS NULL OR vcantidad_raw REGEXP '^[0-9]+$' = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cantidad invalida';
    END IF;

    SET v_cantidad_final = CAST(vcantidad_raw AS UNSIGNED);

    IF v_cantidad_final = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cantidad debe ser mayor a 0';
    END IF;

    -- VALIDAR GENERO
    IF vgnero IS NOT NULL AND vgnero NOT IN ('hombre','mujer','n/b') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Genero invalido';
    END IF;

    -- VALIDAR STATUS VIDA
    IF vstatus_vida IS NOT NULL AND 
       vstatus_vida NOT IN ('vivo','finado','coma','vegetativo','desconocido') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Status vida invalido';
    END IF;

    -- VALIDAR TIPO EDAD
    IF vtipo_edad IS NOT NULL AND 
       vtipo_edad NOT IN (
       'neonato','infante','niñez','pre adolecente',
       'joven','adulto joven','adulto','adulto mayor',
       'paliativo'
       ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Tipo edad invalido';
    END IF;

    -- VALIDAR EDADES
    IF vedad_minima_raw IS NOT NULL THEN
        SET v_min_final = CAST(vedad_minima_raw AS UNSIGNED);
    END IF;

    IF vedad_maxima_raw IS NOT NULL THEN
        SET v_max_final = CAST(vedad_maxima_raw AS UNSIGNED);
    END IF;

    IF v_min_final > v_max_final OR v_max_final > 120 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rango edad invalido';
    END IF;

    -- SIMULACION
    WHILE i < v_cantidad_final DO

        -- EDAD RANDOM
        SET v_edad_simulada = FLOOR(
            v_min_final + RAND() * (v_max_final - v_min_final + 1)
        );

        -- LOGICA STATUS MEDICO (TEST 14)
        IF vtipo_edad = 'paliativo' THEN
            SET v_status_medico_final = 'Cuidados Paliativos';
        ELSE
            SET v_status_medico_final = ELT(
                FLOOR(1 + RAND()*3),
                'Estable',
                'Observacion',
                'Tratamiento'
            );
        END IF;

        -- OUTPUT SIMULACION
        SELECT CONCAT_WS(" | ",
            CONCAT("Paciente: ", i+1),
            CONCAT("Genero: ", IFNULL(vgnero,'N/D')),
            CONCAT("Status Vida: ", IFNULL(vstatus_vida,'N/D')),
            CONCAT("Tipo Edad: ", IFNULL(vtipo_edad,'N/D')),
            CONCAT("Status Medico: ", v_status_medico_final),
            CONCAT("Edad Generada: ", v_edad_simulada)
        ) AS simulacion_paciente;

        SET i = i + 1;

    END WHILE;

END