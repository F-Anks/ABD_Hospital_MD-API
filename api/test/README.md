# Documentación de Pruebas de Carga - API Hospital MD

Este documento detalla las pruebas de inyección masiva de datos realizadas para validar la robustez y capacidad de respuesta de la API y la base de datos.

## Resumen de Ejecución
Se realizaron **10 pruebas** consecutivas con diferentes parámetros de volumen, género, edad y condiciones médicas.

- **Contador Inicial:** 0 registros.
- **Contador Final:** 135,109 registros totales procesados.

---

## Estado Inicial del Sistema
Antes de comenzar las pruebas, se verificó que las tablas de pacientes estuvieran vacías para asegurar la limpieza de los datos de prueba.

![Contador Inicial](media/image.png)
*Figura 1: Contador en 0 antes de iniciar las pruebas.*

---

## Detalle de las 10 Pruebas

### Prueba 1: Inyección Masiva Base
- **Cantidad:** 100,000 registros
- **Filtros:** Ninguno (aleatorio)
- **Objetivo:** Validar la capacidad de inserción masiva en una sola transacción.

![Prueba 1](media/image%20copy.png)

### Prueba 2: Segmento Femenino Adulto
- **Cantidad:** 5,000 registros
- **Género:** Mujer
- **Rango de Edad:** 20 - 50 años
- **Objetivo:** Inyectar datos específicos de pacientes femeninos en edad laboral.

![Prueba 2](media/image%20copy%202.png)

### Prueba 3: Pacientes Discapacitados
- **Cantidad:** 300 registros
- **Género:** Hombre
- **Condición:** Discapacitado
- **Objetivo:** Probar la flag de condición especial en pacientes masculinos.

![Prueba 3](media/image%20copy%203.png)

### Prueba 4: Pacientes Neonatos
- **Cantidad:** 1,500 registros
- **Rango de Edad:** 0 - 0 años
- **Objetivo:** Generar registros de recién nacidos para pruebas de pediatría.

![Prueba 4](media/image%20copy%204.png)

### Prueba 5: Casos de Fallecimiento
- **Cantidad:** 325 registros
- **Estatus Vida:** Finado
- **Objetivo:** Validar la lógica de estados de vida en la base de datos.

![Prueba 5](media/image%20copy%205.png)

### Prueba 6: Segmento Diabético
- **Cantidad:** 832 registros
- **Rango de Edad:** 5 - 22 años
- **Condición:** Diabético
- **Objetivo:** Inyectar pacientes jóvenes con condiciones crónicas.

![Prueba 6](media/image%20copy%206.png)

### Prueba 7: Segmento Pediátrico Masculino
- **Cantidad:** 625 registros
- **Género:** Hombre
- **Rango de Edad:** 1 - 14 años
- **Condición:** Pediátrico
- **Objetivo:** Validar la categorización automática de edad en el rango infantil.

![Prueba 7](media/image%20copy%207.png)

### Prueba 8: Casos de Coma
- **Cantidad:** 111 registros
- **Estatus Vida:** Coma
- **Objetivo:** Probar estados críticos de salud.

![Prueba 8](media/image%20copy%208.png)

### Prueba 9: Diversidad de Género (N/B)
- **Cantidad:** 23,000 registros
- **Género:** N/B
- **Objetivo:** Validar la inclusión de identidades no binarias en el sistema.

![Prueba 9](media/image%20copy%209.png)

### Prueba 10: Contingencia COVID
- **Cantidad:** 3,416 registros
- **Condición:** COVID
- **Objetivo:** Simular carga de datos durante una emergencia sanitaria.

![Prueba 10](media/image%20copy%2010.png)

---

## Resultado Final de las Pruebas
Tras completar las 10 ejecuciones, el sistema procesó un total de **135,109** registros exitosamente, reflejados en la tabla `tbb_personas`.

![Contador Final](media/image%20copy%2011.png)
*Figura 2: Verificación final del volumen de datos en MySQL Workbench.*
