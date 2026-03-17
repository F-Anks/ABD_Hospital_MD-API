"""
=============================================================================
Nombre del archivo: main.py
Descripción del archivo: Punto de entrada principal de la aplicación FastAPI. Configura la inicialización de la BD, CORS y enlaza las rutas del API.
Creado por: Agente AI Antigravity
Adaptado por: 
Supervisado por: 
=============================================================================
"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes.poblacion import router as poblacion_router
from config.db import inicializar_base_datos
from contextlib import asynccontextmanager
import uvicorn

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup logic
    print("Verificando existencia de tablas en MySQL...")
    inicializar_base_datos()
    yield
    # Shutdown logic

app = FastAPI(
    title="Hospital MD - API",
    description="API para poblar y limpiar las tablas tbb_personas, tbb_personas_fisicas y tbb_pacientes.",
    version="1.0.0",
    lifespan=lifespan
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(poblacion_router)


if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True, reload_excludes=[".venv"])
