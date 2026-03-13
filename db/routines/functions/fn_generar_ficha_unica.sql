-- Equipo : SICPES - Servicios Medicos (md_user)
-- Función para generar una fecha única aleatoria
-- Creado por: ChatGPT-4 (OpenAI) - Adaptado por Jose Francisco Flores Amador
-- Supervisado por: Ing. Jose Francisco Flores Amador 
CREATE FUNCTION fn_generar_fecha_unica()
RETURNS DATETIME
DETERMINISTIC
BEGIN
    RETURN NOW() 
    - INTERVAL FLOOR(RAND()*365) DAY
    - INTERVAL FLOOR(RAND()*24) HOUR
    - INTERVAL FLOOR(RAND()*60) MINUTE
    - INTERVAL FLOOR(RAND()*60) SECOND;
END;