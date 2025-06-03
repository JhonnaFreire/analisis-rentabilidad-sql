
# 📊 Proyecto 1 — Profitability analysis of companies in Colombia using SQL (Colombia)

## 📝 General description
This project explores the average profitability of companies grouped by city and sector in Colombia. Using SQL queries on a simulated database of 50 companies, the objective is to identify the most profitable sectors with the highest business density, useful for commercial strategies or market studies.

## 🎯 Goal
- Identify sectors and cities with the highest average profitability.
- Classify the groups according to the level of annual income.
- Learn and apply concepts such as `GROUP BY`, `HAVING`, aggregate functions (`AVG`, `COUNT`) and `CASE`.

## 🧰 Technologies used
- **MySQL** (SQL Workbench)
- **Mock database** (`empresas.sql`)
- **GitHub** for project storage

## 🗂️ Database structure

Nombre de la tabla: `empresas`

| Campo            | Tipo         | Descripción                            |
|------------------|--------------|----------------------------------------|
| id               | INT          | Unique company identifier      |
| nombre_empresa   | VARCHAR(100) | Company name                   |
| ciudad           | VARCHAR(50)  | City where the company operates          |
| sector           | VARCHAR(50)  | Economic sector                       |
| ingresos_anuales | INT          | Annual income in Colombian pesos  |

## 🧾 SQL query used

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

## 📊 Expected results (example)

| Ciudad     | Sector       | Empresas | Ingreso Promedio | Clasificación         |
|------------|--------------|----------|------------------|------------------------|
| Bogotá     | Salud        | 5        | $5,600,000 COP   | Rentabilidad Excelente |
| Medellín   | Tecnología   | 4        | $3,900,000 COP   | Alta Rentabilidad      |

## 🧠 Conclusions
- The cities with the highest business density in profitable sectors were Bogotá and Medellín.
- The health and technology sectors led in average income.
- This analysis allows you to make more informed investment or expansion decisions.

## 📎 Project resources
- `empresas.sql` – Script to load the database
- `consulta_rentabilidad.sql` – Query used in the analysis
- Simulated dataset with 50 fictitious companies
