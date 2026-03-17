"""
=============================================================================
Nombre del archivo: db.py
Descripción del archivo: Módulo para la conexión y gestión de la base de datos MySQL. Contiene funciones para leer ejecutar archivos .sql de forma programática.
Creado por: Agente AI Antigravity
Adaptado por: 
Supervisado por: 
=============================================================================
"""
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

# Rutas a las subcarpetas de db/
DB_SQL_PATH = os.path.join(os.path.dirname(os.path.dirname(__file__)), "db")
DB_BACKUPS_PATH = os.path.join(DB_SQL_PATH, "backups")
DB_SP_PATH = os.path.join(DB_SQL_PATH, "routines", "stored procedures")
DB_FN_PATH = os.path.join(DB_SQL_PATH, "routines", "functions")
DB_TRIGGERS_PATH = os.path.join(DB_SQL_PATH, "triggers")


def get_db_connection():
    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        return connection
    except Error as e:
        print(f"Error al conectar a MySQL: {e}")
        raise e


def ejecutar_sql_file(connection, filename, carpeta=None):
    """Lee un archivo .sql de la carpeta indicada y lo ejecuta en MySQL."""
    base = carpeta if carpeta else DB_SP_PATH
    filepath = os.path.join(base, filename)
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
    """Lee el archivo .sql de db/routines/stored procedures/, dropea el SP si existe y lo crea de nuevo."""
    sql = ejecutar_sql_file(connection, filename, DB_SP_PATH)
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
        
        # Crear tablas desde db/backups/init_tables.sql
        filepath = os.path.join(DB_BACKUPS_PATH, "init_tables.sql")
        with open(filepath, "r", encoding="utf-8") as f:
            sql_script = f.read()
            
        # Quitar líneas de comentarios completas para que no rompan el parser
        lineas = [l for l in sql_script.split('\n') if not l.strip().startswith('--')]
        # Quitar bloques de comentarios /* ... */
        import re
        script_limpio = '\n'.join(lineas)
        script_limpio = re.sub(r'/\*.*?\*/', '', script_limpio, flags=re.DOTALL)
        
        # Ejecutar cada statement separado por ';'
        for statement in script_limpio.split(';'):
            statement = statement.strip()
            if statement:
                cursor.execute(statement)
                
        connection.commit()
        print("Base de datos inicializada: tablas verificadas/creadas correctamente.")

        # Limpiar triggers residuales si existieran de versiones anteriores
        for trg in ['trg_pacientes_after_insert', 'trg_pacientes_after_update', 'trg_pacientes_after_delete']:
            cursor.execute(f"DROP TRIGGER IF EXISTS {trg}")
        connection.commit()

    except Exception as e:
        print(f"Error al inicializar la BD: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
