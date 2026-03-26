# Carpeta de Configuración (config)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación general del módulo de configuración que gestiona la conexión a la base de datos MySQL.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** Angel de Jesus Baños Tellez
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
├── config/                  <-- [Estás aquí]
│   ├── db.py                # Lógica de conexión y acceso a .sql
│   └── README.md            # Este archivo
├── db/                      # Scripts SQL
├── routes/                  # Endpoints del API
├── schemas/                 # Modelos de datos
├── main.py                  # Entrada principal
└── README.md                # Raíz del proyecto
```

## Contenido

Esta carpeta centraliza toda la lógica de acceso a datos a nivel de capa lógica. El archivo `db.py` no solo se encarga de instanciar y despachar las conexiones de `mysql.connector`, sino que provee funciones para inyectar y ejecutar sentencias `.sql` a demanda y manejar la regeneración de Stored Procedures dinámicamente antes de cada inserción volumétrica.
