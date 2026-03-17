# 🏥 ABD Hospital MD API

API para la gestión y análisis de datos médicos hospitalarios.

Este servicio permite consultar y procesar información relacionada con pacientes, incluyendo distribución demográfica, estado clínico y métricas relevantes para análisis hospitalario.

El objetivo es centralizar los datos para su consumo por aplicaciones frontend, dashboards analíticos y sistemas de gestión hospitalaria.
### DASHBOARD CON DATOS DEL API
![Dashboard](/api/test/media/Dashboard_Api.jpeg)
---

# 📊 Características del sistema

La API permite obtener información para visualizar métricas como:

- Distribución de pacientes por **género**
- Distribución por **edad**
- **Estado de vida** del paciente
- **Estatus médico**
- Distribución por **grupo sanguíneo**
- Relación entre **edad y género**
- Relación entre **estado de vida y género**

Estos datos pueden ser consumidos por dashboards analíticos para apoyar la toma de decisiones médicas y administrativas.

---

# 📈 Visualización de datos

El sistema permite generar paneles analíticos que muestran:

- Distribución por género
- Estado de vida
- Estatus médico
- Grupos sanguíneos
- Rango de edad por género
- Estado de vida por género

Estas visualizaciones permiten interpretar de forma clara grandes volúmenes de información clínica.

---

# 🧠 Métricas disponibles

## Distribución por género

Permite analizar la proporción de pacientes:

- Hombre
- Mujer
- No especificado

---

## Estado de vida

Clasificación del estado actual del paciente:

- Vivo
- Fallecido
- Coma
- Estado vegetativo
- Desconocido

---

## Estatus médico

Seguimiento del tratamiento o condición médica:

- Estable
- Observación
- Recuperación
- Tratamiento
- Terapia intensiva
- Cuidados paliativos
- COVID-19 (aislamiento)
- Post-COVID
- Pre-diabetes

---

## Grupo sanguíneo

Distribución de pacientes según su tipo de sangre:

- O+
- A+
- B+
- O-
- A-
- AB+
- B-
- AB-

---

## Distribución por edad

Segmentación de pacientes en rangos como:

- Neonato
- Infante
- Niñez
- Pre-adolescente
- Joven
- Adulto joven
- Adulto
- Adulto mayor

---
# PRUEBAS

---
## Swagger UI - Población de datos

### Poblar 100,000 registros (parámetros generales)
![Swagger UI - Poblar 100000 registros](/api/test/media/image%20copy.png)

### Poblar 5,000 mujeres (20-25 años)
![Swagger UI - Poblar 5000 mujeres 20-25](/api/test/media/image%20copy%202.png)

### Poblar 300 hombres (7-11 años) con condición "discapacitado"
![Swagger UI - Poblar 300 hombres con condición discapacitado](/api/test/media/image%20copy%203.png)

### Poblar 1,500 registros (parámetros generales)
![Swagger UI - Poblar 1500 registros](/api/test/media/image%20copy%204.png)

### Poblar 325 registros con estado de vida "Finado"
![Swagger UI - Poblar 325 registros finado](/api/test/media/image%20copy%205.png)

### Poblar 832 registros con condición "diabético"
![Swagger UI - Poblar 832 registros diabético](/api/test/media/image%20copy%206.png)

### Poblar 625 registros con condición "pediátrico"
![Swagger UI - Poblar 625 registros pediátrico](/api/test/media/image%20copy%207.png)

### Poblar 111 registros con estado de vida "Coma"
![Swagger UI - Poblar 111 registros coma](/api/test/media/image%20copy%208.png)

### Poblar 23,000 registros (género "NB")
![Swagger UI - Poblar 23000 registros género NB](/api/test/media/image%20copy%209.png)

### Poblar 3,416 registros con condición "COVID"
![Swagger UI - Poblar 3416 registros COVID](/api/test/media/image%20copy%2010.png)

### Ejecución de /api/poblar (5,000 registros, mujeres 20-25 años)
![Swagger UI - Ejecución api/poblar 5000 registros](/api/test/media/image%20copy%2013.png)

---
## MySQL Workbench - Verificación de datos

### Consulta COUNT en tbb_personas
![MySQL Workbench - COUNT tbb_personas](/api/test/media/image.png)

### Resultado de COUNT en tbb_personas
![MySQL Workbench - COUNT con resultado](/api/test/media/image%20copy%2011.png)

### Bitácora de operaciones (tbb_bitacora)
![MySQL Workbench - Bitácora de operaciones](/api/test/media/image%20copy%2012.png)

---
### DASHBOARD PREVIO A ACTUALIZACION DEL API

![Dashboard](/api/test/media/Dashboard_old.jpeg)
