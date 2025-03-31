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
MinAvg AS (
    SELECT 
        MIN(average_position) AS min_avg_position
    FROM CarAverages
)
SELECT 
    ca.car_name,
    ca.car_class,
    ROUND(ca.average_position, 4) AS average_position,
    ca.race_count,
    cl.country
FROM CarAverages ca
JOIN MinAvg ma ON ca.average_position = ma.min_avg_position
JOIN Classes cl ON ca.car_class = cl.class
ORDER BY ca.car_name
LIMIT 1;
