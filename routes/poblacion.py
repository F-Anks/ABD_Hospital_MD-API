"""
=============================================================================
Nombre del archivo: poblacion.py
Descripción del archivo: Define los endpoints RESTful (/api/poblar, /api/eliminar) para invocar los stored procedures que manipulan los datos de los pacientes.
Creado por: Agente AI Antigravity
Adaptado por: 
Supervisado por: 
=============================================================================
"""
from fastapi import APIRouter, HTTPException, Request
from config.db import get_db_connection, crear_sp_desde_archivo
from schemas.poblacion import EliminarResponse, PoblarRequest, PoblarResponse
from mysql.connector import Error

router = APIRouter(
    prefix="/api",
    tags=["Población de Datos"]
)


@router.delete(
    "/eliminar",
    response_model=EliminarResponse,
    summary="Eliminar datos de las 3 tablas",
    description="Lee y ejecuta db/sp_limpiar_tablas_pacientes.sql para hacer TRUNCATE "
                "de tbb_pacientes, tbb_personas_fisicas y tbb_personas."
)
def eliminar_datos(request: Request):
    connection = None
    try:
        connection = get_db_connection()
        client_ip = request.client.host if request.client else 'Desconocido'

        # Crear SP desde el archivo .sql
        sp_name = crear_sp_desde_archivo(connection, "sp_limpiar_tablas_pacientes.sql")

        # Llamar al SP pasando la IP del cliente
        cursor = connection.cursor()
        cursor.callproc(sp_name, [client_ip])
        connection.commit()
        cursor.close()

        return EliminarResponse(
            mensaje="Tablas limpiadas exitosamente (tbb_pacientes, tbb_personas_fisicas, tbb_personas)."
        )
    except Error as e:
        raise HTTPException(status_code=500, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if connection and connection.is_connected():
            connection.close()


@router.post(
    "/poblar",
    response_model=PoblarResponse,
    summary="Poblar Datos (Múltiples escenarios)",
    description="Inserta pacientes. Puedes elegir género y rango de edad para las 10 pruebas."
)
def ejecutar_poblacion(request: PoblarRequest, http_request: Request):
    connection = None
    try:
        connection = get_db_connection()
        client_ip = http_request.client.host if http_request.client else 'Desconocido'

        # Crear/Actualizar SP desde el archivo .sql
        sp_name = crear_sp_desde_archivo(connection, "sp_poblar_datos.sql")

        # Llamar al SP con los nuevos parámetros
        cursor = connection.cursor()
        cursor.callproc(sp_name, [
            request.cantidad,
            request.genero,
            request.edad_min,
            request.edad_max,
            request.status_vida,
            request.condicion,
            client_ip
        ])
        
        # Obtener el resultado
        mensaje = "Proceso finalizado."
        for result in cursor.stored_results():
            row = result.fetchone()
            if row:
                mensaje = row[0]
                
        connection.commit()
        cursor.close()

        return PoblarResponse(mensaje=mensaje)
    except Error as e:
        raise HTTPException(status_code=500, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if connection and connection.is_connected():
            connection.close()

