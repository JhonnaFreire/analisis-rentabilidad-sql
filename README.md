
# 📊 Proyecto 1 — Análisis de Rentabilidad por Ciudad y Sector (Colombia)

## 📝 Descripción general
Este proyecto explora la rentabilidad promedio de empresas agrupadas por ciudad y sector en Colombia. Utilizando consultas SQL sobre una base de datos simulada de 50 empresas, el objetivo es identificar los sectores más rentables y con mayor densidad empresarial, útil para estrategias comerciales o estudios de mercado.

## 🎯 Objetivo
- Identificar sectores y ciudades con mayor rentabilidad promedio.
- Clasificar los grupos según el nivel de ingresos anuales.
- Aprender y aplicar conceptos como `GROUP BY`, `HAVING`, funciones agregadas (`AVG`, `COUNT`) y `CASE`.

## 🧰 Tecnologías usadas
- **MySQL** (SQL Workbench)
- **Base de datos simulada** (`empresas.sql`)
- **GitHub** para almacenamiento del proyecto

## 🗂️ Estructura de la base de datos

| Campo            | Tipo         | Descripción                            |
|------------------|--------------|----------------------------------------|
| id               | INT          | Identificador único de la empresa      |
| nombre_empresa   | VARCHAR(100) | Nombre de la empresa                   |
| ciudad           | VARCHAR(50)  | Ciudad donde opera la empresa          |
| sector           | VARCHAR(50)  | Sector económico                       |
| ingresos_anuales | INT          | Ingresos anuales en pesos colombianos  |

## 🧾 Consulta SQL utilizada

```sql
SELECT 
    ciudad,
    sector,
    COUNT(*) AS cantidad_empresas,
    CONCAT('$', FORMAT(AVG(ingresos_anuales), 0), ' COP') AS ingreso_promedio,
    CASE
        WHEN AVG(ingresos_anuales) > 4000000 THEN 'Rentabilidad Excelente'
        WHEN AVG(ingresos_anuales) > 3000000 THEN 'Alta Rentabilidad'
        ELSE 'Moderada o Baja'
    END AS clasificacion
FROM
    empresas
GROUP BY ciudad, sector
HAVING COUNT(*) > 3
ORDER BY AVG(ingresos_anuales) DESC;
```

## 📊 Resultados esperados (ejemplo)

| Ciudad     | Sector       | Empresas | Ingreso Promedio | Clasificación         |
|------------|--------------|----------|------------------|------------------------|
| Bogotá     | Salud        | 5        | $5,600,000 COP   | Rentabilidad Excelente |
| Medellín   | Tecnología   | 4        | $3,900,000 COP   | Alta Rentabilidad      |

## 🧠 Conclusiones
- Las ciudades con mayor densidad empresarial en sectores rentables fueron Bogotá y Medellín.
- El sector salud y tecnología lideraron en ingreso promedio.
- Este análisis permite tomar decisiones de inversión o expansión más informadas.

## 📎 Recursos del proyecto
- `empresas.sql` – Script para cargar la base de datos
- `consulta_rentabilidad.sql` – Consulta de análisis principal
