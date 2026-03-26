# Hospital MD - API Data Generator

=============================================================================
- **Nombre del archivo:** README.md (Raíz)
- **Descripción del archivo:** Documentación general del proyecto FastAPI y Stored Procedures para población volumétrica de datos biográficos y médicos.
- **Creado por:** Agente AI Antigravity
- **Adaptado por:** Angel de Jesus Baños Tellez, Al Farias Leyva, Jesus Alejandro Artiaga, Francisco Garcia Garcia
- **Supervisado por:** 
=============================================================================

---

## Descripción del Proyecto

API RESTful desarrollada con **FastAPI** y **MySQL** que permite inyectar datos realistas de forma masiva en las tablas `tbb_personas`, `tbb_personas_fisicas` y `tbb_pacientes` de un sistema hospitalario. El motor lógico reside en un Stored Procedure inteligente capaz de generar nombres, apellidos, CURP, RFC, grupos sanguíneos, edades con distribución demográfica, estatus de vida y condiciones médicas específicas (discapacidad, diabetes, pediatría, COVID-19) a través de un único endpoint unificado.

---

## Diagrama de Árbol Completo

```text
ABD_Hospital_MD-API/
├── .venv/                   # Entorno virtual de Python (no se sube al repo)
├── config/                  
│   ├── db.py                # Conexión a MySQL y ejecución dinámica de .sql
│   └── README.md            # Documentación del módulo
├── db/                      
│   ├── init_tables.sql      # Estructura DDL de tablas (Personas, Físicas, Pacientes)
│   ├── sp_poblar_datos.sql  # Stored Procedure principal (10 pruebas)
│   ├── sp_poblar_pacientes_volumen.sql  # Versión alternativa de respaldo
│   ├── sp_limpiar_tablas_pacientes.sql  # SP para limpiar tablas
│   └── README.md            # Documentación del módulo
├── routes/                  
│   ├── poblacion.py         # Endpoints /api/poblar y /api/eliminar
│   └── README.md            # Documentación del módulo
├── schemas/                 
│   ├── poblacion.py         # Modelos Pydantic (Request/Response)
│   └── README.md            # Documentación del módulo
├── main.py                  # Punto de entrada de FastAPI
├── requirements.txt         # Dependencias del proyecto
└── README.md                # Este archivo
```

---

## Prerequisitos

- **Python** 3.10 o superior
- **MySQL** 8.0 o superior (con usuario y base de datos ya creados)
- **pip** (gestor de paquetes de Python)

---

## Instalación y Configuración

### 1. Clonar o abrir el proyecto

```bash
cd C:\Users\Andro\OneDrive\Escritorio\Trabajo\ABD_Hospital_MD-API
```

### 2. Crear el entorno virtual de Python

```bash
python -m venv .venv
```

### 3. Activar el entorno virtual

**Windows (PowerShell):**
```powershell
.venv\Scripts\Activate.ps1
```

**Windows (CMD):**
```cmd
.venv\Scripts\activate.bat
```

### 4. Instalar dependencias

```bash
pip install -r requirements.txt
```

> Las dependencias principales son: `fastapi`, `uvicorn`, `mysql-connector-python`, `python-dotenv`, `pydantic`.

### 5. Configurar variables de entorno

Crear un archivo `.env` en la raíz del proyecto con las credenciales de tu base de datos MySQL:

```env
DB_HOST=127.0.0.1
DB_USER=root
DB_PASS=tu_contraseña
DB_NAME=hospital_api
DB_PORT=3306
```

---

## Levantar el Servidor

### Opción 1: Ejecutar directamente desde el archivo principal

```bash
python main.py
```

### Opción 2: Usar Uvicorn manualmente

```bash
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

Una vez levantado, accede a la documentación interactiva Swagger en:

- **Local:** [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)
- **Red LAN (otros dispositivos):** `http://<TU_IP_LOCAL>:8000/docs`

---

## Endpoints Disponibles

| Método   | Ruta              | Descripción                                                  |
|----------|-------------------|--------------------------------------------------------------|
| `POST`   | `/api/poblar`     | Inserta pacientes masivamente según los parámetros enviados  |
| `DELETE` | `/api/eliminar`   | Limpia las 3 tablas (pacientes, personas físicas, personas)  |

---

## Parámetros del Endpoint `/api/poblar`

| Campo         | Tipo     | Default | Descripción                                                              |
|---------------|----------|---------|--------------------------------------------------------------------------|
| `cantidad`    | `int`    | 100000  | Cantidad de registros a generar (mínimo 1)                               |
| `genero`      | `string` | `null`  | `Hombre`, `Mujer`, `N/B`. Si es null, distribución aleatoria realista    |
| `edad_min`    | `int`    | `null`  | Edad mínima. Si es null, distribución hospitalaria automática            |
| `edad_max`    | `int`    | `null`  | Edad máxima. Si es null, distribución hospitalaria automática            |
| `status_vida` | `string` | `null`  | `Vivo`, `Finado`, `Coma`, `Vegetativo`, `Desconocido`. Null = aleatorio  |
| `condicion`   | `string` | `null`  | `discapacitado`, `diabetico`, `pediatrico`, `covid`. Null = ninguna      |

---

## Pruebas de Sistema (JSON para Swagger)

A continuación se presentan las 10 pruebas preconfiguradas. Copia y pega cada bloque JSON en el body del endpoint `POST /api/poblar` desde la interfaz de Swagger.

### Prueba 1 — 100K Pacientes (Población General)
> Distribución realista del hospital: todas las edades, géneros, estatus de vida y casos especiales (Paciente Zero, DOA).

```json
{
  "cantidad": 100000,
  "genero": null,
  "edad_min": null,
  "edad_max": null,
  "status_vida": null,
  "condicion": null
}
```

### Prueba 2 — 5K Mujeres entre 20 y 50 años
> Filtro estricto de género femenino y rango de edad adulta.

```json
{
  "cantidad": 5000,
  "genero": "Mujer",
  "edad_min": 20,
  "edad_max": 50,
  "status_vida": null,
  "condicion": null
}
```

### Prueba 3 — 300 Hombres con Discapacidad
> Varones con condiciones de invalidez inyectadas en `status_medico`.

```json
{
  "cantidad": 300,
  "genero": "Hombre",
  "edad_min": null,
  "edad_max": null,
  "status_vida": null,
  "condicion": "discapacitado"
}
```

### Prueba 4 — 1,500 Neonatos (Recién Nacidos)
> Edad forzada a 0. Sin RFC, sin CURP. Nombre: "Recien Nacido Sin Nombre".

```json
{
  "cantidad": 1500,
  "genero": null,
  "edad_min": 0,
  "edad_max": 0,
  "status_vida": null,
  "condicion": null
}
```

### Prueba 5 — 325 Neonatos Finados
> Recién nacidos fallecidos. `status_vida` = Finado, `status_medico` = Fallecido.

```json
{
  "cantidad": 325,
  "genero": null,
  "edad_min": 0,
  "edad_max": 0,
  "status_vida": "Finado",
  "condicion": null
}
```

### Prueba 6 — 832 Pacientes Diabéticos (5-22 años)
> Jóvenes con diagnósticos de Diabetes Tipo 1, Crisis Hiperglucémica o Pie Diabético.

```json
{
  "cantidad": 832,
  "genero": null,
  "edad_min": 5,
  "edad_max": 22,
  "status_vida": null,
  "condicion": "diabetico"
}
```

### Prueba 7 — 625 Hombres Pediátricos
> Varones de 1-14 años con enfermedades infantiles (asma, varicela, otitis, etc.).

```json
{
  "cantidad": 625,
  "genero": "Hombre",
  "edad_min": 1,
  "edad_max": 14,
  "status_vida": null,
  "condicion": "pediatrico"
}
```

### Prueba 8 — 111 Pacientes en Estado de Coma
> Todas las edades y géneros. `status_vida` = Coma, `status_medico` = Terapia Intensiva.

```json
{
  "cantidad": 111,
  "genero": null,
  "edad_min": null,
  "edad_max": null,
  "status_vida": "Coma",
  "condicion": null
}
```

### Prueba 9 — 23K Pacientes No Binarios
> Género forzado a N/B con distribución general de edad y estatus.

```json
{
  "cantidad": 23000,
  "genero": "N/B",
  "edad_min": null,
  "edad_max": null,
  "status_vida": null,
  "condicion": null
}
```

### Prueba 10 — 3,416 Pacientes con COVID-19 (Vivos y Muertos)
> Diagnósticos de SARS-CoV-2 que cruzan con el estatus de vida automáticamente.

```json
{
  "cantidad": 3416,
  "genero": null,
  "edad_min": null,
  "edad_max": null,
  "status_vida": null,
  "condicion": "covid"
}
```

---

## Tecnologías Utilizadas

| Tecnología               | Versión    | Uso                                        |
|--------------------------|------------|--------------------------------------------|
| Python                   | 3.10+      | Lenguaje base del API                      |
| FastAPI                  | 0.128.0    | Framework web asíncrono                    |
| Uvicorn                  | 0.40.0     | Servidor ASGI de alto rendimiento          |
| MySQL                    | 8.0+       | Motor de base de datos relacional          |
| mysql-connector-python   | 8.3.0      | Driver nativo de MySQL para Python         |
| Pydantic                 | 2.12.5     | Validación de esquemas de datos            |
| python-dotenv            | 1.2.1      | Carga de variables de entorno desde .env   |

---

## Firmas

| Rol              | Nombre                     |
|------------------|----------------------------|
| **Creado por**       | Agente AI Antigravity      |
| **Adaptado por**     | Angel de Jesus Baños Tellez, Al Farias Leyva, Jesus Alejandro Artiaga, Francisco Garcia Garcia |
| **Supervisado por**  | Angel de Jesus Baños Tellez |

---

> **Equipo:** SICPES - Servicios Médicos