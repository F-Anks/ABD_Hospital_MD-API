-- Equipo : SICPES - Servicios Medicos (md_user)
-- Función para generar un nombre aleatorio basado en el género
-- Creado por: ChatGPT-4 (OpenAI) - Adaptado por Jose Francisco Flores Amador
-- Supervisado por: Ing. Jose Francisco Flores Amador
CREATE FUNCTION fn_generar_nombre(p_genero CHAR(1))
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
    DECLARE v_nombre VARCHAR(60);

    IF p_genero = 'H' THEN
        SET v_nombre = ELT(FLOOR(1 + RAND()*20),
        'Juan','Luis','Carlos','Jorge','Miguel',
        'Fernando','Eduardo','Diego','Mario','Raul',
        'Hector','Ivan','Gabriel','Manuel','Jose',
        'Ricardo','Andres','Antonio','Daniel','Alejandro');
    ELSE
        SET v_nombre = ELT(FLOOR(1 + RAND()*20),
        'Maria','Sofia','Fernanda','Andrea','Valeria',
        'Ximena','Camila','Renata','Natalia','Paola',
        'Carolina','Gabriela','Patricia','Rosa','Laura',
        'Claudia','Daniela','Adriana','Monserrat','Elena');
    END IF;

    RETURN v_nombre;
END;