# Carpeta de Base de Datos (db)

=============================================================================
- **Nombre del archivo:** README.md
- **Descripción del archivo:** Documentación general del módulo de Scripts y Procedimientos Almacenados de la Base de Datos.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** Angel de Jesus Baños Tellez
- **Supervisado por:** 
=============================================================================

## Diagrama de Árbol

```text
ABD_Hospital_MD-API/
├── config/                  # Módulos de conexión
├── db/                      <-- [Estás aquí]
│   ├── init_tables.sql      # Creación de tablas base (tbb_personas, tbb_personas_fisicas, tbb_pacientes)
│   ├── sp_poblar_datos.sql  # Stored Procedure principal con algoritmos de simulación médica
│   ├── sp_poblar_pacientes_volumen.sql # Versión alternativa o de respaldo 
│   └── README.md            # Este archivo
├── routes/                  # Endpoints del API
├── schemas/                 # Modelos de datos
├── main.py                  # Entrada principal
└── README.md                # Raíz del proyecto
```

## Contenido

Esta carpeta contiene el código más crítico para la generación de la Data Blanca y Población Volumétrica:
- **`init_tables.sql`**: Levanta todo el esqueleto de tablas y llaves foráneas.
- **`sp_poblar_datos.sql`**: Motor matemático y lógico en MySQL capaz de cruzar aleatoriamente apellidos de LATAM, porcentajes vivos/muertos, asignar discapacidades, pediatrías y COVID a través de iteradores que insertan genéricamente en paralelo sin agotar el ORM de Python.
