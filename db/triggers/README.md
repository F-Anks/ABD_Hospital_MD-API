# Carpeta de Triggers (db/triggers)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación de los triggers del sistema de auditoría.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** Angel de Jesus Baños Telles
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
└── db/
    └── triggers/                        <-- [Estás aquí]
        ├── triggers_bitacora.sql        # Archivo de referencia (deprecado)
        └── README.md                    # Este archivo
```

## Contenido

Carpeta reservada para los triggers de la base de datos. Actualmente la lógica de bitácora se ejecuta directamente dentro de los Stored Procedures para registrar **una sola entrada por operación masiva** en lugar de una por cada fila afectada.
