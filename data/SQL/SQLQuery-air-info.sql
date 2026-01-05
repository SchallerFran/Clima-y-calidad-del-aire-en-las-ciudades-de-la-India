-- 1.¿Cuál es el valor promedio de cada contaminante (CO, NO₂, O₃, SO₂) por ciudad?
SELECT city, AVG(co) as 'CO promedio', AVG(no2) as 'NO₂ promedio', AVG(o3) as 'O₃ promedio', AVG(so2) as 'SO₂ promedio'
FROM [air-info]
GROUP BY city
ORDER BY city;

-- 2.¿Cuáles son las 5 ciudades con mayor concentración promedio de PM2.5 y PM10?
SELECT TOP(5) city, AVG(pm2_5) as 'PM 2.5 promedio', AVG(pm10) as 'PM 10 promedio' 
FROM [air-info]
GROUP BY city
ORDER BY AVG(pm2_5) DESC, AVG(pm10) DESC;

-- 3.Relación viento–contaminación.
SELECT
    city,
    AVG(wind_speed) AS 'Vel. de viento Promedio',
    AVG(pm2_5) AS 'PM2.5 Promedio',
	AVG(pm10) AS 'PM10 Promedio',
    AVG(co) AS 'CO Promedio',
	AVG(O3) AS 'Ozono Promedio'
FROM [air-info]
GROUP BY city
ORDER BY AVG(wind_speed) DESC;

-- 4.Clasificar de ciudades según niveles promedio de O3 (Bajo, Moderado, Alto).
SELECT city, AVG(o3) AS 'O₃ promedio', CASE
											  WHEN AVG(o3) <= (SELECT MAX(o3) / 3 FROM [air-info]) THEN 'Bajo'
											  WHEN AVG(o3) <= (SELECT MAX(o3) * 2 / 3 FROM [air-info]) THEN 'Moderado'
											  ELSE 'Alto'
										  END AS 'Nivel Ozono'
FROM [air-info]
GROUP BY city
ORDER BY AVG(o3) DESC;

-- 5.Ciudad más contaminada por cada contaminante.
SELECT contaminante, city, valor_promedio
FROM (
    -- CO
    SELECT 'CO' AS contaminante, city, AVG(co) AS valor_promedio, ROW_NUMBER() OVER (PARTITION BY 'CO' ORDER BY AVG(co) DESC) AS rn
    FROM [air-info]
    GROUP BY city

    UNION ALL

    -- NO2
    SELECT 'NO2', city, AVG(no2), ROW_NUMBER() OVER (PARTITION BY 'NO2' ORDER BY AVG(no2) DESC)
    FROM [air-info]
    GROUP BY city

    UNION ALL

    -- O3
    SELECT 'O3', city, AVG(o3), ROW_NUMBER() OVER (PARTITION BY 'O3' ORDER BY AVG(o3) DESC)
    FROM [air-info]
    GROUP BY city

    UNION ALL

    -- SO2
    SELECT 'SO2', city, AVG(so2), ROW_NUMBER() OVER (PARTITION BY 'SO2' ORDER BY AVG(so2) DESC)
    FROM [air-info]
    GROUP BY city

    UNION ALL

    -- PM2.5
    SELECT 'PM2.5', city, AVG(pm2_5), ROW_NUMBER() OVER (PARTITION BY 'PM2.5' ORDER BY AVG(pm2_5) DESC)
    FROM [air-info]
    GROUP BY city

    UNION ALL

    -- PM10
    SELECT 'PM10', city, AVG(pm10), ROW_NUMBER() OVER (PARTITION BY 'PM10' ORDER BY AVG(pm10) DESC)
    FROM [air-info]
    GROUP BY city
) t
WHERE rn = 1;