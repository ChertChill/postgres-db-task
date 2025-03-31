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
MinClassAvg AS (
    SELECT 
        car_class,
        MIN(average_position) AS min_avg_position
    FROM CarAverages
    GROUP BY car_class
)
SELECT 
    ca.car_name,
    ca.car_class,
    ROUND(ca.average_position, 4) AS average_position,
    ca.race_count
FROM CarAverages ca
JOIN MinClassAvg mca ON ca.car_class = mca.car_class 
                     AND ca.average_position = mca.min_avg_position
ORDER BY average_position;
