from fastapi import FastAPI
from app.routers import pacientes

app = FastAPI(
    title="API Servicios Médicos - Hospital",
    description="API robusta para inyección masiva de datos y pruebas de naturaleza.",
    version="1.0.0"
)

# Conectar el router de pacientes a la aplicación principal
app.include_router(pacientes.router)

if __name__ == "__main__":
    import uvicorn
    # Levantamos el servidor
    uvicorn.run("app.main:app", host="0.0.0.0", port=8000, reload=True)