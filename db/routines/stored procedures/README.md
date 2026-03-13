# Carpeta de Stored Procedures (db/routines/stored procedures)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación de los Procedimientos Almacenados que ejecutan la lógica de negocio del hospital.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** 
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
└── db/
    └── routines/
        └── stored procedures/                   <-- [Estás aquí]
            ├── sp_limpiar_tablas_pacientes.sql   # Limpieza masiva + bitácora
            ├── sp_mil_grupos_sanguineos.sql      # Prueba de grupos sanguíneos
            ├── sp_poblar_datos.sql               # Motor principal (10 pruebas)
            ├── sp_poblar_pacientes_volumen.sql   # Versión alternativa
            ├── sp_pruebas_naturaleza.sql         # Pruebas de naturaleza
            └── README.md                         # Este archivo
```

## Contenido

Contiene los procedimientos almacenados principales del sistema:
- **`sp_poblar_datos.sql`**: Motor inteligente de generación masiva con soporte para 10 escenarios de prueba.
- **`sp_limpiar_tablas_pacientes.sql`**: Limpia las 3 tablas y registra la acción en bitácora.
- **`sp_poblar_pacientes_volumen.sql`**: Versión alternativa de inserción masiva.
- **`sp_mil_grupos_sanguineos.sql`**: Pruebas con distribución de grupos sanguíneos.
- **`sp_pruebas_naturaleza.sql`**: Pruebas adicionales de naturaleza.
