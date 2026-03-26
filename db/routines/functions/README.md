# Carpeta de Functions (db/routines/functions)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación de las funciones SQL reutilizables para generación de datos.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** Angel de Jesus Baños Tellez
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
└── db/
    └── routines/
        └── functions/                   <-- [Estás aquí]
            ├── fn_generar_apellido.sql  # Genera apellidos aleatorios
            ├── fn_generar_ficha_unica.sql # Genera identificadores únicos
            ├── fn_generar_nombre.sql    # Genera nombres según género
            └── README.md               # Este archivo
```

## Contenido

Funciones SQL auxiliares invocables desde los Stored Procedures para modularizar la generación de datos demográficos realistas.
