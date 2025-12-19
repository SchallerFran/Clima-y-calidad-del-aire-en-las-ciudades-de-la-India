# 🌍 Análisis de Calidad del Aire y Variables Meteorológicas

Este proyecto analiza la **calidad del aire** y su relación con variables **meteorológicas** a partir de un conjunto de datos ambientales correspondientes a ciudades de la India. El dataset incluye información de clima, calidad del aire, viento y variables astronómicas, recolectadas mediante la **Weatherstack API** el **13 de diciembre de 2025**.

El objetivo principal es realizar un **Análisis Exploratorio de Datos (EDA)** que permita identificar patrones, correlaciones y comportamientos relevantes entre contaminantes atmosféricos y condiciones climáticas, con foco especial en el **ozono (O₃)**.

El proyecto combina análisis en Python, consultas en SQL y una visualización interactiva mediante un dashboard.

---

## 📁 Estructura del proyecto

```
CLIMA-Y-CALIDAD-DEL-AIRE-EN-LAS-CIUDADES-DE-LA-INDIA
│   README.md
│
├───data
│   ├───processed
│   │       indian_weather_data.csv
│   │
│   └───raw
│           indian_weather_data.csv
│
└───src
    │   EDA.ipynb
    │
    └───Dashboard
            Argos Palette.json
```

* **data/raw**: datos originales sin procesar.
* **data/processed**: datos limpios y transformados para el análisis.
* **src/EDA.ipynb**: notebook con el análisis exploratorio de datos (EDA), visualizaciones y conclusiones.

---

## 📊 Variables del dataset

### 📍 Información geográfica

| Columna | Descripción |
| ------- | ----------- |
| `city`  | Ciudad      |
| `lat`   | Latitud     |
| `lon`   | Longitud    |

### 🌡️ Variables meteorológicas

| Columna       | Descripción                   |
| ------------- | ----------------------------- |
| `temperature` | Temperatura (°C)              |
| `feelslike`   | Sensación térmica             |
| `humidity`    | Humedad                       |
| `pressure`    | Presión atmosférica           |
| `precip`      | Precipitación                 |
| `cloudcover`  | Cobertura nubosa              |
| `wind_speed`  | Velocidad del viento          |
| `wind_degree` | Dirección del viento (grados) |
| `wind_dir`    | Dirección del viento          |
| `uv_index`    | Índice UV                     |
| `visibility`  | Visibilidad                   |

### 🌅 Variables astronómicas

| Columna    | Descripción               |
| ---------- | ------------------------- |
| `sunrise`  | Hora de salida del sol    |
| `sunset`   | Hora de puesta del sol    |
| `moonrise` | Hora de salida de la luna |
| `moonset`  | Hora de puesta de la luna |

### 🏭 Contaminantes atmosféricos

| Columna | Descripción                |
| ------- | -------------------------- |
| `co`    | Monóxido de carbono (CO)   |
| `no2`   | Dióxido de nitrógeno (NO₂) |
| `o3`    | Ozono (O₃)                 |
| `so2`   | Dióxido de azufre (SO₂)    |
| `pm2_5` | Material particulado PM2.5 |
| `pm10`  | Material particulado PM10  |

---

## 🔍 Análisis Exploratorio (EDA)

El notebook incluye:

* Limpieza y transformación de datos
* Conversión de variables horarias
* Análisis de correlaciones (heatmap)
* Visualizaciones 2D y 3D
* Análisis de la relación entre **O₃ y otros contaminantes**
* Ajustes polinómicos para explorar tendencias no lineales

Se presta especial atención a la relación entre **ozono (O₃)** y contaminantes primarios como **CO, NO₂ y SO₂**, destacando similitudes en su comportamiento debidas a fuentes de emisión comunes.

---

## 🗄️ Consultas SQL

El archivo de SQL contiene consultas para:

* Exploración general del dataset
* Filtrado por ciudad y contaminante
* Agregaciones y estadísticas descriptivas
* Preparación de datos para visualización

---

## 📈 Dashboard

El dashboard permite:

* Visualizar contaminantes por ciudad
* Explorar relaciones entre variables
* Analizar patrones de contaminación de forma interactiva

Está pensado como una herramienta de apoyo para el análisis y la comunicación de resultados.

---

## 🧠 Conclusiones principales

* El **ozono (O₃)** presenta relaciones complejas con contaminantes primarios y variables meteorológicas.
* **NO₂ y CO** muestran comportamientos similares frente al O₃ debido a fuentes de emisión compartidas.
* **SO₂ no actúa como precursor directo del ozono**, aunque puede presentar correlaciones indirectas.
* El viento y la temperatura influyen significativamente en la concentración de contaminantes.

---

## 🛠️ Tecnologías utilizadas

* Python (Pandas, NumPy, Matplotlib, Seaborn, Plotly)
* SQL
* Jupyter Notebook / VS Code

---

## 🚀 Próximos pasos

* Incorporar análisis temporal
* Modelos predictivos para O₃
* Integración con nuevas fuentes de datos
* Mejora del dashboard interactivo

---

📌 *Proyecto orientado al análisis de datos ambientales y calidad del aire, con fines académicos y exploratorios.*
