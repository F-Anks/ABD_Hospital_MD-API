import os
import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv

# Cargar las variables del archivo .env
load_dotenv()

def get_db_connection():
    """Establece y retorna la conexión a MySQL."""
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),
            port=os.getenv("DB_PORT"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            database=os.getenv("DB_NAME")
        )
        return connection
    except Error as e:
        print(f"Error crítico conectando a MySQL: {e}")
        return None