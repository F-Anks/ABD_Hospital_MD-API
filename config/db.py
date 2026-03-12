import os
from dotenv import load_dotenv
import mysql.connector
from mysql.connector import Error

load_dotenv()

DB_CONFIG = {
    "host": os.getenv("DB_HOST", "127.0.0.1"),
    "user": os.getenv("DB_USER", "root"),
    "password": os.getenv("DB_PASS", ""),
    "database": os.getenv("DB_NAME", "hospital_api"),
    "port": int(os.getenv("DB_PORT", 3306)),
}

# Ruta a la carpeta db/
DB_SQL_PATH = os.path.join(os.path.dirname(os.path.dirname(__file__)), "db")


def get_db_connection():
    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        return connection
    except Error as e:
        print(f"Error al conectar a MySQL: {e}")
        raise e


def ejecutar_sql_file(connection, filename):
    """Lee un archivo .sql de la carpeta db/ y lo ejecuta en MySQL."""
    filepath = os.path.join(DB_SQL_PATH, filename)
    with open(filepath, "r", encoding="utf-8") as f:
        contenido = f.read()

    # Limpiar líneas de comentarios al inicio
    lineas = contenido.strip().split("\n")
    lineas_sql = [l for l in lineas if not l.strip().startswith("--")]
    sql_limpio = "\n".join(lineas_sql).strip()

    # Quitar DELIMITER si existe
    sql_limpio = sql_limpio.replace("DELIMITER $$", "").replace("DELIMITER ;", "")
    sql_limpio = sql_limpio.replace("$$", "").strip()

    return sql_limpio


def crear_sp_desde_archivo(connection, filename):
    """Lee el archivo .sql, dropea el SP si existe y lo crea de nuevo."""
    sql = ejecutar_sql_file(connection, filename)
    cursor = connection.cursor()

    # Extraer nombre del SP del CREATE PROCEDURE
    import re
    match = re.search(r'PROCEDURE\s+`?(\w+)`?', sql)
    if not match:
        raise Exception(f"No se encontró nombre de PROCEDURE en {filename}")

    sp_name = match.group(1)

    # Quitar DEFINER si existe
    sql = re.sub(r'CREATE\s+DEFINER=`[^`]+`@`[^`]+`\s+PROCEDURE', 'CREATE PROCEDURE', sql)

    cursor.execute(f"DROP PROCEDURE IF EXISTS {sp_name}")
    cursor.execute(sql)
    connection.commit()
    cursor.close()

    return sp_name


def inicializar_base_datos():
    """Ejecuta el script init_tables.sql para asegurar que las tablas y FKs existen."""
    connection = None
    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        
        filepath = os.path.join(DB_SQL_PATH, "init_tables.sql")
        with open(filepath, "r", encoding="utf-8") as f:
            sql_script = f.read()
            
        # Quitar líneas de comentarios completas para que no rompan el parser
        lineas = [l for l in sql_script.split('\n') if not l.strip().startswith('--')]
        script_limpio = '\n'.join(lineas)
        
        # Ejecutar cada statement separado por ';'
        for statement in script_limpio.split(';'):
            statement = statement.strip()
            if statement:
                cursor.execute(statement)
                
        connection.commit()
        print("Base de datos inicializada: tablas verificadas/creadas correctamente.")
    except Exception as e:
        print(f"Error al inicializar la BD: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
