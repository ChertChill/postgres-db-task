SELECT v.maker, c.model, c.horsepower, c.engine_capacity, 'Car' AS vehicle_type
FROM Vehicle v
JOIN Car c ON v.model = c.model
WHERE c.horsepower > 150 
  AND c.price < 35000.00
  AND c.engine_capacity < 3
  
UNION ALL

SELECT v.maker, m.model, m.horsepower, m.engine_capacity, 'Motorcycle' AS vehicle_type
FROM Vehicle v
JOIN Motorcycle m ON v.model = m.model
WHERE m.horsepower > 150 
  AND m.price < 20000.00 
  AND m.engine_capacity < 1.5

UNION ALL

SELECT v.maker, b.model, NULL AS horsepower, NULL AS engine_capacity,  'Bicycle' AS vehicle_type
FROM Vehicle v
JOIN Bicycle b ON v.model = b.model
WHERE b.gear_count > 18 
  AND b.price < 20000.00 

ORDER BY horsepower DESC NULLS LAST
  ;
