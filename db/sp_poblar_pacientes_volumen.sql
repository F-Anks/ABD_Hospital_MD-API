/*
=============================================================================
Nombre del archivo: sp_poblar_pacientes_volumen.sql
Descripción del archivo: Stored Procedure alternativo para inyección masiva de casos con parámetros genéricos, utilizado en versiones tempranas del proyecto.
Creado por: Agente AI Antigravity
Adaptado por: 
Supervisado por: 
=============================================================================
*/
-- Equipo : SICPES - Servicios Medicos (md_user)
-- Procedimiento almacenado para poblar las tablas: tbb_personas, tbb_personas_fisicas, tbb_pacientes
-- Base de datos: hospital_230758

DELIMITER $$

CREATE PROCEDURE sp_poblar_pacientes_volumen(
    IN p_cantidad VARCHAR(20),
    IN p_genero VARCHAR(10),
    IN p_edad_min VARCHAR(20),
    IN p_edad_max VARCHAR(20),
    IN p_status_vida VARCHAR(20),
    IN p_status_medico VARCHAR(150)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_cantidad INT;
    DECLARE v_min_edad INT DEFAULT 0;
    DECLARE v_max_edad INT DEFAULT 120;
    DECLARE v_persona_id INT;
    DECLARE v_edad INT;
    DECLARE v_tipo_edad VARCHAR(50);
    DECLARE v_genero_final VARCHAR(10);
    DECLARE v_nombre VARCHAR(60);
    DECLARE v_apellido1 VARCHAR(60);
    DECLARE v_apellido2 VARCHAR(60);
    DECLARE v_pais VARCHAR(50);
    DECLARE v_grupo_sangre VARCHAR(5);
    DECLARE v_fecha_nac DATE;
    DECLARE v_status_vida_final VARCHAR(20);
    DECLARE v_status_medico_final VARCHAR(150);
    DECLARE v_rand FLOAT;

    -- =============================================
    -- VALIDACIONES DE ENTRADA
    -- =============================================

    -- Validar cantidad
    IF p_cantidad IS NULL OR p_cantidad REGEXP '^[0-9]+$' = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La cantidad debe ser un numero entero valido.';
    END IF;

    SET v_cantidad = CAST(p_cantidad AS UNSIGNED);

    IF v_cantidad = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La cantidad debe ser mayor a 0.';
    END IF;

    -- Validar genero
    IF p_genero IS NOT NULL AND LOWER(p_genero) NOT IN ('hombre', 'mujer', 'n/b') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Genero invalido. Valores permitidos: hombre, mujer, n/b';
    END IF;

    -- Validar edades
    IF p_edad_min IS NOT NULL THEN
        IF p_edad_min REGEXP '^[0-9]+$' = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: edad_min debe ser un numero entero.';
        END IF;
        SET v_min_edad = CAST(p_edad_min AS UNSIGNED);
    END IF;

    IF p_edad_max IS NOT NULL THEN
        IF p_edad_max REGEXP '^[0-9]+$' = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: edad_max debe ser un numero entero.';
        END IF;
        SET v_max_edad = CAST(p_edad_max AS UNSIGNED);
    END IF;

    IF v_min_edad > v_max_edad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: edad_min no puede ser mayor que edad_max.';
    END IF;

    IF v_max_edad > 120 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: edad_max no puede superar 120.';
    END IF;

    -- Validar status_vida
    IF p_status_vida IS NOT NULL
       AND LOWER(p_status_vida) NOT IN ('vivo','finado','coma','vegetativo','desconocido') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: status_vida invalido. Valores: vivo, finado, coma, vegetativo, desconocido';
    END IF;

    -- =============================================
    -- BUCLE DE INSERCION
    -- =============================================

    WHILE i < v_cantidad DO

        -- ---- GENERO ----
        IF p_genero IS NOT NULL THEN
            SET v_genero_final = LOWER(p_genero);
        ELSE
            SET v_rand = RAND();
            IF v_rand < 0.48 THEN
                SET v_genero_final = 'Hombre';
            ELSEIF v_rand < 0.96 THEN
                SET v_genero_final = 'Mujer';
            ELSE
                SET v_genero_final = 'N/B';
            END IF;
        END IF;

        -- ---- PAIS DE ORIGEN ----
        SET v_pais = ELT(FLOOR(1 + RAND() * 5),
            'Mexico', 'Colombia', 'Argentina', 'Peru', 'Estados Unidos');

        -- ---- NOMBRES SEGUN GENERO ----
        IF v_genero_final IN ('Hombre', 'hombre') THEN
            SET v_nombre = ELT(FLOOR(1 + RAND() * 15),
                'Juan','Luis','Carlos','Jorge','Miguel',
                'Fernando','Eduardo','Diego','Mario','Raul',
                'Hector','Ivan','Gabriel','Daniel','Alejandro');
        ELSEIF v_genero_final IN ('Mujer', 'mujer') THEN
            SET v_nombre = ELT(FLOOR(1 + RAND() * 15),
                'Maria','Sofia','Fernanda','Andrea','Valeria',
                'Ximena','Camila','Renata','Natalia','Paola',
                'Carolina','Gabriela','Patricia','Laura','Daniela');
        ELSE
            SET v_nombre = ELT(FLOOR(1 + RAND() * 10),
                'Alexa','Ariel','Angeles','Guadalupe','Cruz',
                'Leslie','Dominique','Charlie','Dana','Robin');
        END IF;

        -- ---- APELLIDOS ----
        SET v_apellido1 = ELT(FLOOR(1 + RAND() * 20),
            'Hernandez','Garcia','Martinez','Lopez','Gonzalez',
            'Perez','Rodriguez','Sanchez','Ramirez','Cruz',
            'Flores','Gomez','Morales','Vazquez','Reyes',
            'Torres','Ruiz','Mendoza','Aguilar','Castillo');

        SET v_apellido2 = ELT(FLOOR(1 + RAND() * 20),
            'Hernandez','Garcia','Martinez','Lopez','Gonzalez',
            'Perez','Rodriguez','Sanchez','Ramirez','Cruz',
            'Flores','Gomez','Morales','Vazquez','Reyes',
            'Torres','Ruiz','Mendoza','Aguilar','Castillo');

        -- ---- EDAD Y FECHA NACIMIENTO ----
        SET v_edad = FLOOR(v_min_edad + RAND() * (v_max_edad - v_min_edad + 1));
        SET v_fecha_nac = DATE_SUB(CURDATE(), INTERVAL v_edad YEAR);
        SET v_fecha_nac = DATE_SUB(v_fecha_nac, INTERVAL FLOOR(RAND() * 365) DAY);

        -- ---- TIPO EDAD (calculado de la edad) ----
        SET v_tipo_edad = CASE
            WHEN v_edad = 0 THEN 'Neonato'
            WHEN v_edad BETWEEN 1 AND 2 THEN 'Infante'
            WHEN v_edad BETWEEN 3 AND 5 THEN 'Niñez'
            WHEN v_edad BETWEEN 6 AND 11 THEN 'Pre Adolescente'
            WHEN v_edad BETWEEN 12 AND 17 THEN 'Joven'
            WHEN v_edad BETWEEN 18 AND 25 THEN 'Adulto Joven'
            WHEN v_edad BETWEEN 26 AND 59 THEN 'Adulto'
            WHEN v_edad >= 60 THEN 'Adulto Mayor'
            ELSE 'Desconocido'
        END;

        -- ---- GRUPO SANGUINEO (distribucion LATAM) ----
        SET v_rand = RAND() * 100;
        SET v_grupo_sangre = CASE
            WHEN v_rand < 55.0  THEN 'O+'
            WHEN v_rand < 80.0  THEN 'A+'
            WHEN v_rand < 90.0  THEN 'B+'
            WHEN v_rand < 95.0  THEN 'O-'
            WHEN v_rand < 98.0  THEN 'A-'
            WHEN v_rand < 99.0  THEN 'AB+'
            WHEN v_rand < 99.8  THEN 'B-'
            ELSE 'AB-'
        END;

        -- ---- STATUS VIDA ----
        IF p_status_vida IS NOT NULL THEN
            SET v_status_vida_final = p_status_vida;
        ELSE
            SET v_rand = RAND();
            IF v_rand < 0.75 THEN
                SET v_status_vida_final = 'Vivo';
            ELSEIF v_rand < 0.85 THEN
                SET v_status_vida_final = 'Finado';
            ELSEIF v_rand < 0.92 THEN
                SET v_status_vida_final = 'Coma';
            ELSEIF v_rand < 0.97 THEN
                SET v_status_vida_final = 'Vegetativo';
            ELSE
                SET v_status_vida_final = 'Desconocido';
            END IF;
        END IF;

        -- ---- STATUS MEDICO (depende de status_vida) ----
        IF p_status_medico IS NOT NULL THEN
            SET v_status_medico_final = p_status_medico;
        ELSE
            IF v_status_vida_final = 'Finado' THEN
                SET v_status_medico_final = 'Fallecido';
            ELSEIF v_status_vida_final = 'Coma' THEN
                SET v_status_medico_final = 'Terapia Intensiva';
            ELSEIF v_status_vida_final = 'Vegetativo' THEN
                SET v_status_medico_final = 'Cuidados Paliativos';
            ELSE
                SET v_status_medico_final = ELT(FLOOR(1 + RAND() * 5),
                    'Estable', 'Observacion', 'Recuperacion',
                    'Terapia Intensiva', 'Tratamiento');
            END IF;
        END IF;

        -- =============================================
        -- INSERTS ENCADENADOS
        -- =============================================

        -- 1) tbb_personas
        INSERT INTO tbb_personas (tipo, pais_origen)
        VALUES ('Fisica', v_pais);

        SET v_persona_id = LAST_INSERT_ID();

        -- 2) tbb_personas_fisicas
        INSERT INTO tbb_personas_fisicas (
            ID, nombre, primer_apellido, segundo_apellido,
            genero, fecha_nacimiento, edad, tipo_edad,
            grupo_sanguineo, estatus
        )
        VALUES (
            v_persona_id, v_nombre, v_apellido1, v_apellido2,
            v_genero_final, v_fecha_nac, v_edad, v_tipo_edad,
            v_grupo_sangre, b'1'
        );

        -- 3) tbb_pacientes
        INSERT INTO tbb_pacientes (
            ID, status_medico, status_vida, fecha_ultima_citamedica
        )
        VALUES (
            v_persona_id,
            v_status_medico_final,
            v_status_vida_final,
            DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
        );

        SET i = i + 1;

    END WHILE;

    -- Retornar cantidad insertada
    SELECT v_cantidad AS registros_creados;

END$$

DELIMITER ;
