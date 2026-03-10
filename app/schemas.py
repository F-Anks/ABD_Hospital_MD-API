from pydantic import BaseModel, Field

class RequestVolumen(BaseModel):
    cantidad: int = Field(..., gt=0, le=1000000, description="Número de pacientes a generar. Rango: 1 a 1,000,000")

class ResponseGenerico(BaseModel):
    mensaje: str
    registros_procesados: int
    estado: str