-- =========================================================================
-- PRUEBA 1: Ingreso de 100K Pacientes (Población General y Casos Especiales)
-- =========================================================================

DELIMITER $$

CREATE PROCEDURE sp_poblar_pacientes(
    IN p_cantidad INT,
    IN p_genero_fixed VARCHAR(10),
    IN p_edad_min INT,
    IN p_edad_max INT,
    IN p_status_vida_fixed VARCHAR(20),
    IN p_condicion VARCHAR(50)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    
    -- Variables para tbb_personas
    DECLARE v_persona_id INT;
    DECLARE v_tipo VARCHAR(10) DEFAULT 'Fisica';
    DECLARE v_rfc VARCHAR(14) DEFAULT NULL;
    DECLARE v_pais_origen VARCHAR(50);
    
    -- Variables para tbb_personas_fisicas
    DECLARE v_titulo_cortesia VARCHAR(40);
    DECLARE v_nombre VARCHAR(60);
    DECLARE v_primer_apellido VARCHAR(45);
    DECLARE v_segundo_apellido VARCHAR(60);
    DECLARE v_genero VARCHAR(10);
    DECLARE v_fecha_nacimiento DATE;
    DECLARE v_edad INT;
    DECLARE v_tipo_edad VARCHAR(50);
    DECLARE v_curp VARCHAR(18) DEFAULT NULL;
    DECLARE v_grupo_sanguineo VARCHAR(5);
    
    -- Variables para tbb_pacientes
    DECLARE v_status_medico VARCHAR(150);
    DECLARE v_status_vida VARCHAR(20);
    DECLARE v_fecha_ultima_citamedica DATETIME;
    
    -- Variables lógicas de control
    DECLARE v_rand FLOAT;
    DECLARE v_es_identificado BOOLEAN;

    WHILE i < p_cantidad DO
    
        -- -----------------------------------------------------------------
        -- 1. IDENTIDAD: ¿Identificado (95%) o Paciente Zero sin docs (5%)?
        -- -----------------------------------------------------------------
        SET v_rand = RAND();
        IF (p_edad_min = 0 AND p_edad_max = 0) OR (p_cantidad = 1500) THEN
            -- Neonatos (Prueba 4, Prueba 5, etc) SIEMPRE son indocumentados
            SET v_es_identificado = FALSE;
        ELSEIF v_rand < 0.05 THEN
            SET v_es_identificado = FALSE;
        ELSE
            SET v_es_identificado = TRUE;
        END IF;

        -- -----------------------------------------------------------------
        -- 2. STATUS VIDA (General para todos o Fijo)
        -- -----------------------------------------------------------------
        IF p_status_vida_fixed IS NOT NULL AND TRIM(p_status_vida_fixed) != '' AND p_status_vida_fixed != 'string' THEN
            SET v_status_vida = p_status_vida_fixed;
        ELSE
            SET v_rand = RAND();
            IF v_rand < 0.75 THEN
                SET v_status_vida = 'Vivo';
            ELSEIF v_rand < 0.85 THEN
                SET v_status_vida = 'Finado'; -- Muertos DOA o fallecidos luego
            ELSEIF v_rand < 0.92 THEN
                SET v_status_vida = 'Coma';
            ELSEIF v_rand < 0.97 THEN
                SET v_status_vida = 'Vegetativo';
            ELSE
                SET v_status_vida = 'Desconocido';
            END IF;
        END IF;

        -- -----------------------------------------------------------------
        -- 3. STATUS MEDICO (Depende estricto del status de vida, o la condicion elegida)
        -- -----------------------------------------------------------------
        IF p_condicion = 'covid' THEN
            -- Prueba 10: COVID-19 afecta TODOS los estados de vida
            IF v_status_vida = 'Finado' THEN
                SET v_status_medico = 'Fallecido por COVID-19 (SARS-CoV-2)';
            ELSEIF v_status_vida = 'Coma' OR v_status_vida = 'Vegetativo' THEN
                SET v_status_medico = 'COVID-19 Severo (Intubado / Neumonía Atípica)';
            ELSE
                SET v_status_medico = ELT(FLOOR(1 + RAND() * 3),
                    'COVID-19 Leve (Aislamiento)',
                    'COVID-19 Moderado (En Oxigenación)',
                    'Post-COVID (Recuperación/Secuelas)');
            END IF;
        ELSE
            IF v_status_vida = 'Finado' THEN
                SET v_status_medico = 'Fallecido';
            ELSEIF v_status_vida = 'Coma' THEN
                SET v_status_medico = 'Terapia Intensiva';
            ELSEIF v_status_vida = 'Vegetativo' THEN
                SET v_status_medico = 'Cuidados Paliativos';
            ELSE
                -- Si está vivo o desconocido
                IF p_condicion = 'discapacitado' THEN
                    -- Usar el campo status_medico para guardar la condición de discapacidad
                    IF p_cantidad = 1500 THEN
                        -- Discapacidades lógicas para un recién nacido (Neonato)
                        SET v_status_medico = ELT(FLOOR(1 + RAND() * 3),
                            'Asfixia Perinatal / Parálisis Cerebral',
                            'Cardiopatía Congénita Severa',
                            'Malformación Congénita / Síndrome Genético');
                    ELSE
                        SET v_status_medico = ELT(FLOOR(1 + RAND() * 4),
                            'Discapacidad Motriz (Invalidez)',
                            'Discapacidad Visual Severa',
                            'Discapacidad Auditiva',
                            'Discapacidad Intelectual');
                    END IF;
                ELSEIF p_condicion = 'diabetico' THEN
                    -- Prueba 6: Pacientes diabéticos
                    SET v_status_medico = ELT(FLOOR(1 + RAND() * 3),
                        'Diabetes Tipo 1 (En Tratamiento)',
                        'Crisis Hiperglucémica (Estable)',
                        'Pie Diabético (Observación)');
                ELSEIF p_condicion = 'pediatrico' THEN
                    -- Prueba 7: Pacientes Pediátricos (enfermedades infantiles/adolescentes comunes)
                    SET v_status_medico = ELT(FLOOR(1 + RAND() * 6),
                        'Infección Respiratoria Aguda (Estable)',
                        'Gastroenteritis (Observación)',
                        'Asma Infantil (Tratamiento)',
                        'Varicela / Sarampión (Curación)',
                        'Traumatismo Menor (Recuperación)',
                        'Otitis Media (Estable)');
                ELSE
                    -- Ninguna condición especial
                    SET v_status_medico = ELT(FLOOR(1 + RAND() * 5),
                        'Estable', 'Observacion', 'Recuperacion',
                        'Terapia Intensiva', 'Tratamiento');
                END IF;
            END IF;
        END IF;

        -- -----------------------------------------------------------------
        -- 4. EDAD, TIPO DE EDAD Y FECHA DE NACIMIENTO (Variable o Fija)
        -- -----------------------------------------------------------------
        -- En Swagger, si mandan 0 o NULL en edad_min/max, aplica distribución realista
        -- Excepto si mandan un 0 explícitamente para ambos, ahí forzamos 0 años.
        IF p_edad_min = 0 AND p_edad_max = 0 THEN
             SET v_edad = 0;
        ELSEIF p_edad_min IS NULL OR p_edad_max IS NULL OR (p_edad_min = 0 AND p_edad_max = 0 AND p_cantidad != 1500 AND p_cantidad != 325) THEN
            -- Lógica original de la Prueba 1: Distribución realista
            SET v_rand = RAND() * 100;
            IF v_rand < 10.0 THEN
                SET v_edad = 0; -- 10% Neonatos (0 años)
            ELSEIF v_rand <  20.0 THEN
                SET v_edad = FLOOR(1 + RAND() * 5); -- 10% Infantes/Niños (1-5 años)
            ELSEIF v_rand < 30.0 THEN
                SET v_edad = FLOOR(6 + RAND() * 12); -- 10% Adolescentes (6-17 años)
            ELSEIF v_rand < 65.0 THEN
                SET v_edad = FLOOR(18 + RAND() * 42); -- 35% Adultos (18-59 años)
            ELSE
                SET v_edad = FLOOR(60 + RAND() * 40); -- 35% Adultos Mayores (60-99 años)
            END IF;
        ELSE
            -- Rango fijo solicitado por el usuario (Prueba 2, etc.)
            SET v_edad = FLOOR(p_edad_min + RAND() * (p_edad_max - p_edad_min + 1));
        END IF;

        SET v_fecha_nacimiento = DATE_SUB(CURDATE(), INTERVAL v_edad YEAR);
        SET v_fecha_nacimiento = DATE_SUB(v_fecha_nacimiento, INTERVAL FLOOR(RAND() * 365) DAY);

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

        -- -----------------------------------------------------------------
        -- 5. GENERO Y PAIS (Variable o Fijo)
        -- -----------------------------------------------------------------
        IF p_genero_fixed IS NULL OR TRIM(p_genero_fixed) = '' OR p_genero_fixed = 'string' THEN
            SET v_rand = RAND();
            IF v_rand < 0.48 THEN
                SET v_genero = 'Hombre';
            ELSEIF v_rand < 0.96 THEN
                SET v_genero = 'Mujer';
            ELSE
                SET v_genero = 'N/B';
            END IF;
        ELSE
            SET v_genero = p_genero_fixed;
        END IF;

        SET v_rand = RAND();
        IF v_rand < 0.85 THEN
            SET v_pais_origen = 'Mexico';
        ELSE
            SET v_pais_origen = ELT(FLOOR(1 + RAND() * 4), 'Colombia', 'Argentina', 'Peru', 'Estados Unidos');
        END IF;

        -- -----------------------------------------------------------------
        -- 6. GRUPO SANGUINEO (Distribución LATAM)
        -- -----------------------------------------------------------------
        SET v_rand = RAND() * 100;
        SET v_grupo_sanguineo = CASE
            WHEN v_rand < 55.0  THEN 'O+'
            WHEN v_rand < 80.0  THEN 'A+'
            WHEN v_rand < 90.0  THEN 'B+'
            WHEN v_rand < 95.0  THEN 'O-'
            WHEN v_rand < 98.0  THEN 'A-'
            WHEN v_rand < 99.0  THEN 'AB+'
            WHEN v_rand < 99.8  THEN 'B-'
            ELSE 'AB-'
        END;

        -- -----------------------------------------------------------------
        -- 7. REGLAS DE IDENTIDAD Y DATOS DEMOGRAFICOS
        -- -----------------------------------------------------------------
        -- Limpiar variables para esta iteración
        SET v_rfc = NULL;
        SET v_curp = NULL;
        SET v_titulo_cortesia = NULL;
        
        IF v_es_identificado = FALSE THEN
            -- Paciente NO identificado (Paciente Zero, Neonatos sin registrar, etc.)
            IF p_edad_min = 0 AND p_edad_max = 0 THEN
                SET v_nombre = 'Recien Nacido Sin Nombre';
            ELSE
                SET v_nombre = 'Paciente Zero';
            END IF;
            SET v_primer_apellido = NULL;
            SET v_segundo_apellido = NULL;
        ELSE
            -- Paciente Identificado: Asignar nombres realistas
            IF v_genero = 'Hombre' THEN
                SET v_nombre = ELT(FLOOR(1 + RAND() * 15), 'Juan','Luis','Carlos','Jorge','Miguel','Fernando','Eduardo','Diego','Mario','Raul','Hector','Ivan','Gabriel','Daniel','Alejandro');
            ELSEIF v_genero = 'Mujer' THEN
                SET v_nombre = ELT(FLOOR(1 + RAND() * 15), 'Maria','Sofia','Fernanda','Andrea','Valeria','Ximena','Camila','Renata','Natalia','Paola','Carolina','Gabriela','Patricia','Laura','Daniela');
            ELSE
                SET v_nombre = ELT(FLOOR(1 + RAND() * 10), 'Alexa','Ariel','Angeles','Guadalupe','Cruz','Leslie','Dominique','Charlie','Dana','Robin');
            END IF;

            SET v_primer_apellido = ELT(FLOOR(1 + RAND() * 20), 'Hernandez','Garcia','Martinez','Lopez','Gonzalez','Perez','Rodriguez','Sanchez','Ramirez','Cruz','Flores','Gomez','Morales','Vazquez','Reyes','Torres','Ruiz','Mendoza','Aguilar','Castillo');
            
            -- Los extranjeros pueden no tener segundo apellido
            IF v_pais_origen != 'Mexico' AND RAND() < 0.3 THEN
                SET v_segundo_apellido = NULL;
            ELSE
                SET v_segundo_apellido = ELT(FLOOR(1 + RAND() * 20), 'Hernandez','Garcia','Martinez','Lopez','Gonzalez','Perez','Rodriguez','Sanchez','Ramirez','Cruz','Flores','Gomez','Morales','Vazquez','Reyes','Torres','Ruiz','Mendoza','Aguilar','Castillo');
            END IF;

            -- Reglas para CURP, RFC y Título de Cortesía
            IF v_edad < 18 THEN
                -- Menores de edad NUNCA tienen RFC ni Título
                IF v_pais_origen = 'Mexico' AND v_edad > 0 THEN
                    -- Recién nacidos (0) todavía no tienen CURP, los de 1+ sí.
                    SET v_curp = CONCAT('CURP', SUBSTRING(REPLACE(UUID(), '-', ''), 1, 14));
                END IF;
            ELSE
                -- Adultos
                IF v_pais_origen = 'Mexico' THEN
                    SET v_curp = CONCAT('CURP', SUBSTRING(REPLACE(UUID(), '-', ''), 1, 14));
                    -- Adultos pueden trabajar y tener RFC (60% probabilidad)
                    IF RAND() < 0.6 THEN
                        SET v_rfc = CONCAT('RFC', SUBSTRING(REPLACE(UUID(), '-', ''), 1, 11));
                    END IF;
                END IF;

                -- Adultos pueden tener Título de Cortesía (10% probabilidad)
                IF RAND() < 0.1 THEN
                    SET v_titulo_cortesia = ELT(FLOOR(1 + RAND() * 4), 'Dr.', 'Lic.', 'Ing.', 'Prof.');
                END IF;
            END IF;
        END IF;

        -- Fecha ultima cita (para pacientes Finados es cuando se declaró la muerte, si no últimos 365 días)
        SET v_fecha_ultima_citamedica = DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY);

        -- -----------------------------------------------------------------
        -- 8. INSERCIONES
        -- -----------------------------------------------------------------
        INSERT INTO tbb_personas (tipo, rfc, pais_origen)
        VALUES (v_tipo, v_rfc, v_pais_origen);

        SET v_persona_id = LAST_INSERT_ID();

        INSERT INTO tbb_personas_fisicas (
            ID, titulo_cortesia, nombre, primer_apellido, segundo_apellido,
            genero, fecha_nacimiento, edad, tipo_edad, curp, grupo_sanguineo
        ) VALUES (
            v_persona_id, v_titulo_cortesia, v_nombre, v_primer_apellido, v_segundo_apellido,
            v_genero, v_fecha_nacimiento, v_edad, v_tipo_edad, v_curp, v_grupo_sanguineo
        );

        INSERT INTO tbb_pacientes (
            ID, status_medico, status_vida, fecha_ultima_citamedica
        ) VALUES (
            v_persona_id, v_status_medico, v_status_vida, v_fecha_ultima_citamedica
        );

        SET i = i + 1;
    END WHILE;

    SELECT CONCAT('Inserción finalizada: ', p_cantidad, ' registros procesados.') AS Resultado;

END$$

DELIMITER ;
