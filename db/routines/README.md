# Carpeta de Rutinas (db/routines)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación general del módulo de rutinas SQL (Stored Procedures y Functions).
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** 
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
└── db/
    └── routines/                <-- [Estás aquí]
        ├── functions/           # Funciones SQL reutilizables
        │   ├── fn_generar_apellido.sql
        │   ├── fn_generar_ficha_unica.sql
        │   └── fn_generar_nombre.sql
        ├── stored procedures/   # Procedimientos almacenados del negocio
        │   ├── sp_limpiar_tablas_pacientes.sql
        │   ├── sp_mil_grupos_sanguineos.sql
        │   ├── sp_poblar_datos.sql
        │   ├── sp_poblar_pacientes_volumen.sql
        │   └── sp_pruebas_naturaleza.sql
        └── README.md            # Este archivo
```

## Contenido

Centraliza toda la lógica programática de MySQL dividida en dos subcarpetas:
- **`functions/`**: Funciones auxiliares para generar datos realistas (nombres, apellidos, fichas).
- **`stored procedures/`**: Procedimientos almacenados que ejecutan la lógica de negocio principal (inserción masiva, limpieza de tablas, pruebas).
