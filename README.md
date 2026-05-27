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