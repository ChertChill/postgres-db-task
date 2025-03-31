WITH ClassAverages AS (
    SELECT 
        c.class AS car_class,
        AVG(r.position) AS avg_class_position,
        COUNT(r.race) AS total_race_count
    FROM Cars c
    JOIN Results r ON c.name = r.car
    GROUP BY c.class
), 
MinAvg AS (
    SELECT MIN(avg_class_position) AS min_avg_position
    FROM ClassAverages
), 
SelectedClasses AS (
    SELECT ca.car_class, ca.avg_class_position, ca.total_race_count
    FROM ClassAverages ca
    JOIN MinAvg ma ON ca.avg_class_position = ma.min_avg_position
)
SELECT 
    ca.car_name,
    ca.car_class,
    ROUND(ca.average_position, 4) AS average_position,
    ca.race_count,
    cl.country,
    sc.total_race_count AS total_races
FROM (
    SELECT 
        c.name AS car_name,
        c.class AS car_class,
        AVG(r.position) AS average_position,
        COUNT(r.race) AS race_count
    FROM Cars c
    JOIN Results r ON c.name = r.car
    GROUP BY c.name, c.class
) ca
JOIN SelectedClasses sc ON ca.car_class = sc.car_class
JOIN Classes cl ON ca.car_class = cl.class
ORDER BY average_position, car_name;
