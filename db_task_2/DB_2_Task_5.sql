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
LowPositionCars AS (
    SELECT 
        ca.car_name,
        ca.car_class,
        ca.average_position,
        ca.race_count
    FROM CarAverages ca
    WHERE ca.average_position > 3.0
),
ClassRaceCounts AS (
    SELECT 
        c.class AS car_class,
        COUNT(r.race) AS total_race_count
    FROM Cars c
    JOIN Results r ON c.name = r.car
    GROUP BY c.class
),
ClassLowPositionCounts AS (
    SELECT 
        lpc.car_class,
        COUNT(lpc.car_name) AS low_position_count
    FROM LowPositionCars lpc
    GROUP BY lpc.car_class
)
SELECT 
    lpc.car_name,
    lpc.car_class,
    ROUND(lpc.average_position, 4) AS average_position,
    lpc.race_count,
    cl.country,
    crc.total_race_count,
    clpc.low_position_count
FROM LowPositionCars lpc
JOIN ClassLowPositionCounts clpc ON lpc.car_class = clpc.car_class
JOIN Classes cl ON lpc.car_class = cl.class
JOIN ClassRaceCounts crc ON lpc.car_class = crc.car_class
ORDER BY clpc.low_position_count DESC, lpc.average_position DESC;
