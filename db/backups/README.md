# Carpeta de Backups (db/backups)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación de la carpeta de respaldos y scripts de inicialización DDL.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** 
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
└── db/
    ├── backups/                 <-- [Estás aquí]
    │   ├── init_tables.sql      # CREATE TABLE IF NOT EXISTS (DDL)
    │   └── README.md            # Este archivo
    ├── routines/
    ├── triggers/
    └── test/
```

## Contenido

Contiene los scripts DDL base para la creación de las tablas del sistema hospitalario:
- **`init_tables.sql`**: Crea las tablas `tbb_personas`, `tbb_personas_fisicas`, `tbb_pacientes` y `tbi_bitacora` con sus llaves foráneas en cascada. Se ejecuta automáticamente al levantar el servidor FastAPI.
