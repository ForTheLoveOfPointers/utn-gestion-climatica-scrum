# Trabajo Práctico: Gestión Colaborativa, Control de Versiones y Organización Empresarial

* **Institución:** Universidad Tecnológica Nacional (UTN)
* **Carrera:** Tecnicatura Universitaria en Programación (TUP) - Modalidad a Distancia
* **Cátedra:** Organización Empresarial (Ciclo Lectivo 2026)
* **Escenario Seleccionado:** Escenario A - Análisis de Datos Climáticos Globales

---

## 👥 Integrantes y Roles (Célula Ágil Simulada)
Este proyecto ha sido desarrollado bajo una modalidad individual, simulando el flujo de trabajo de una célula de desarrollo ágil con los siguientes roles asignados:
* **Hugo (Líder / Organizador):** Responsable del repositorio, inicialización de estructuras y Jira.
* **Paco (Desarrollador Técnico):** Responsable del desarrollo del script en R y la generación de gráficos estadísticos.
* **Luis (Revisor / QA):** Responsable de la auditoría de seguridad, control de calidad del código mediante *Peer Review* y validación de criterios de aceptación.

---

## 📊 Descripción del Dataset Utilizado
Se seleccionó el dataset histórico de **GISTEMP (Global Temperature Anomalies)** provisto por la NASA. 
* **Origen de los datos:** `https://datahub.io/core/global-temp`
* **Variables analizadas:**
  * `Source`: Fuente de la medición (`GISTEMP` para series globales integradas o `GCAG`).
  * `Date`: Fecha del registro mensualizado.
  * `Mean`: Anomalía o desviación térmica registrada en grados Celsius (°C) respecto a la media histórica base.

---

## 📁 Estructura del Repositorio
El proyecto se estructura de la siguiente manera:

```text
├── datos/          # Contiene el archivo CSV original de datos climáticos.
├── scripts/        # Alberga el archivo 'script.R'.
├── resultados/     # Almacena los gráficos y reportes generados por el script.
├── .gitignore      # Archivo de exclusión de temporales y archivos del sistema.
└── README.md       # Documentación general del proyecto (este archivo).
```

## 🛠️ Instrucciones de Ejecución

El entorno de desarrollo y ejecución principal es **Google Colab** configurado con el motor nativo de R (`colab.to/r`). Para replicar el análisis de manera local o remota en el servidor, siga estrictamente los siguientes pasos:

### 1. Preparación del Entorno y Repositorio
Clone el repositorio central en su entorno de trabajo y acceda al directorio del proyecto:
```bash
git clone [https://github.com/ForTheLoveOfPointers/utn-gestion-climatica-scrum.git](https://github.com/ForTheLoveOfPointers/utn-gestion-climatica-scrum.git)
cd utn-gestion-climatica-scrum
```

### 2. Suministro de Datos
Asegúrese de que el dataset mensual (monthly.csv) descargado desde la fuente oficial esté ubicado en la carpeta de entrada de datos:

Ruta requerida: datos/monthly.csv

### 3. Ejecución del Análisis
Desde la terminal de comandos, y desde dentro de la carpeta /scripts, invoque el intérprete de R para procesar el script principal:

```bash
Rscript scripts/analisis_clima.R
```

### 4. Verificación de Productos y Outputs
Una vez finalizada la ejecución, el script imprimirá por consola las métricas clave (Promedio, Máximo, Mínimo y la Pendiente de tendencia por década). De forma simultánea, se exportarán automáticamente los siguientes archivos a la carpeta de salidas:

* `resultados/anomalia_mensual.png`: Gráfico de línea temporal con la evolución de la anomalía y la línea de promedio global.
* `resultados/tendencia_decadas.png`: Gráfico de barras que representa el promedio por década junto a su línea de tendencia calculada mediante el modelo de regresión lineal.
