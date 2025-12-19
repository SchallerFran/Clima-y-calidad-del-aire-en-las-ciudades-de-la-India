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

-- 3.Clasificar de ciudades según niveles promedio de O3 (Bajo, Moderado, Alto)
SELECT city, AVG(o3) AS 'O₃ promedio', CASE
											  WHEN AVG(o3) <= (SELECT MAX(o3) / 3 FROM [air-info]) THEN 'Bajo'
											  WHEN AVG(o3) <= (SELECT MAX(o3) * 2 / 3 FROM [air-info]) THEN 'Moderado'
											  ELSE 'Alto'
										  END AS 'Nivel Ozono'
FROM [air-info]
GROUP BY city
ORDER BY AVG(o3) DESC;