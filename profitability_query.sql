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
