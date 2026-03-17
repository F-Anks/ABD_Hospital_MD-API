# Carpeta de Modelos de Datos (schemas)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación general del módulo de Esquemas de Pydantic para el tipado, seguridad y validación.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** 
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
├── config/                  # Módulos de conexión
├── db/                      # Scripts SQL
├── routes/                  # Endpoints del API
├── schemas/                 <-- [Estás aquí]
│   ├── poblacion.py         # Clases y validaciones de datos (PoblarRequest, EliminarResponse)
│   └── README.md            # Este archivo
├── main.py                  # Entrada principal
└── README.md                # Raíz del proyecto
```

## Contenido

Garantiza la integridad y formato del JSON entrante. Al utilizar Pydantic, cualquier request que llegue con un formato incorrecto a FastAPI, es rebotado antes siquiera de agotar una conexión en la Base de Datos. El archivo `poblacion.py` incluye en sus esquemas auto-documentación nativa para la interfaz interactiva de Swagger, proveyendo hints visuales.
