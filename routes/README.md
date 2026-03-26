# Carpeta de Rutas (routes)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación general del módulo de Rutas que expone los endpoints HTTP a través de FastAPI.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** Angel de Jesus Baños Tellez
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
├── config/                  # Módulos de conexión
├── db/                      # Scripts SQL
├── routes/                  <-- [Estás aquí]
│   ├── poblacion.py         # Endpoints FastAPI de inyección volumétrica y limpieza
│   └── README.md            # Este archivo
├── schemas/                 # Modelos de datos
├── main.py                  # Entrada principal
└── README.md                # Raíz del proyecto
```

## Contenido

Enlaza las operaciones HTTP (`GET`, `POST`, `DELETE`) hacia las lógicas del Negocio. El archivo `poblacion.py` intercepta los Requests desde Swagger o Clientes, deserializa el JSON con Pydantic, e invoca dinámicamente el `cursor.callproc()` de la Base de Datos con todos los argumentos solicitados.
