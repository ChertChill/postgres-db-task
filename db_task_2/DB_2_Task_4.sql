WITH CarAverages AS (
    SELECT 
        c.name AS car_name,
        c.class AS car_class,
        AVG(r.position) AS average_position,
        COUNT(r.race) AS race_count
    FROM Cars c
    JOIN Results r ON c.name = r.car
    GROUP BY c.name, c.class
),
ClassAverages AS (
    SELECT 
        c.class AS car_class,
        AVG(r.position) AS avg_class_position,
        COUNT(DISTINCT c.name) AS car_count
    FROM Cars c
    JOIN Results r ON c.name = r.car
    GROUP BY c.class
)
SELECT 
    ca.car_name,
    ca.car_class,
    ROUND(ca.average_position, 4) AS average_position,
    ca.race_count,
    cl.country AS car_country
FROM CarAverages ca
JOIN ClassAverages cla ON ca.car_class = cla.car_class
JOIN Classes cl ON ca.car_class = cl.class
WHERE ca.average_position < cla.avg_class_position  
  AND cla.car_count > 1  
ORDER BY ca.car_class, ca.average_position;
