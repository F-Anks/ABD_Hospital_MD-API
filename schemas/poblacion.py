"""
=============================================================================
Nombre del archivo: poblacion.py
Descripción del archivo: Modelos de Pydantic que definen la estructura y validación de los datos entrantes (Request) y salientes (Response) de la API.
Creado por: Agente AI Antigravity
Adaptado por: 
Supervisado por: 
=============================================================================
"""
from pydantic import BaseModel, Field


from typing import Optional

class EliminarResponse(BaseModel):
    mensaje: str


class PoblarRequest(BaseModel):
    cantidad: int = Field(default=100000, description="Cantidad de registros a generar", ge=1)
    genero: Optional[str] = Field(default=None, description="Género (Hombre, Mujer, N/B). Si se manda null o vacío, será aleatorio realista.")
    edad_min: Optional[int] = Field(default=None, description="Edad mínima. Si se presiona Execute tal cual, se usará la distribución de hospital.")
    edad_max: Optional[int] = Field(default=None, description="Edad máxima. Si se presiona Execute tal cual, se usará la distribución de hospital.")
    status_vida: Optional[str] = Field(default=None, description="Forzar status de vida (Vivo, Finado, etc). Dejar en null para aleatorio.")
    condicion: Optional[str] = Field(default=None, description="Condición médica a forzar: 'discapacitado', 'diabetico', 'pediatrico', 'covid'.")


class PoblarResponse(BaseModel):
    mensaje: str
