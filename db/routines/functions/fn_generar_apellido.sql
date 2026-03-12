-- Equipo : SICPES - Servicios Medicos (md_user)
-- Función para generar un apellido aleatorio
-- Creado por: ChatGPT-4 (OpenAI) - Adaptado por Jose Francisco Flores Amador
-- Supervisado por: Ing. Jose Francisco Flores Amador
CREATE FUNCTION fn_generar_apellido()
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
    RETURN ELT(FLOOR(1 + RAND()*20),
    'Hernandez','Garcia','Martinez','Lopez','Gonzalez',
    'Perez','Rodriguez','Sanchez','Ramirez','Cruz',
    'Flores','Gomez','Morales','Vazquez','Reyes',
    'Torres','Ruiz','Mendoza','Aguilar','Castillo');
END;