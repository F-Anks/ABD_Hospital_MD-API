from fastapi import APIRouter, HTTPException
from app.database import get_db_connection
from app.schemas import RequestVolumen, ResponseGenerico
from mysql.connector import Error

# Creamos el router para este módulo
router = APIRouter(
    prefix="/api/v1/pacientes",
    tags=["Pruebas de Volumen"]
)

@router.post("/poblar-volumen", response_model=ResponseGenerico)
async def poblar_pacientes_volumen(request: RequestVolumen):
    """
    Ejecuta el SP `sp_poblar_pacientes_volumen` para inyectar datos masivos.
    """
    connection = get_db_connection()
    if not connection:
        raise HTTPException(status_code=500, detail="Fallo la conexión a la base de datos.")

    try:
        cursor = connection.cursor()
        
        # Llamada directa al Procedimiento Almacenado en MySQL
        cursor.callproc('sp_poblar_pacientes_volumen', [request.cantidad])
        connection.commit()
        
        return ResponseGenerico(
            mensaje="Población masiva ejecutada correctamente.",
            registros_procesados=request.cantidad,
            estado="Éxito"
        )
        
    except Error as e:
        connection.rollback()
        raise HTTPException(status_code=400, detail=f"Error SQL: {str(e)}")
    
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

@router.delete("/limpiar", response_model=ResponseGenerico)
async def limpiar_tablas_pacientes():
    """
    Ejecuta el SP `sp_limpiar_tablas_pacientes` para truncar las tablas y dejarlas en cero.
    """
    connection = get_db_connection()
    if not connection:
        raise HTTPException(status_code=500, detail="Fallo la conexión a la base de datos.")

    try:
        cursor = connection.cursor()
        
        # Llamada directa al Procedimiento Almacenado de limpieza en MySQL
        cursor.callproc('sp_limpiar_tablas_pacientes')
        connection.commit()
        
        return ResponseGenerico(
            mensaje="Tablas truncadas exitosamente. La base de datos está limpia.",
            registros_procesados=0,
            estado="Éxito"
        )
        
    except Error as e:
        connection.rollback()
        raise HTTPException(status_code=400, detail=f"Error SQL: {str(e)}")
    
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()