WITH HotelCategories AS (
    SELECT 
        h.ID_hotel,
        CASE
            WHEN AVG(r.price) < 175 THEN 'Дешевый'
            WHEN AVG(r.price) BETWEEN 175 AND 300 THEN 'Средний'
            WHEN AVG(r.price) > 300 THEN 'Дорогой'
        END AS hotel_category
    FROM Hotel h
    JOIN Room r ON h.ID_hotel = r.ID_hotel
    GROUP BY h.ID_hotel
),
CustomerPreferences AS (
    SELECT 
        b.ID_customer,
        MAX(CASE 
            WHEN hc.hotel_category = 'Дорогой' THEN 'Дорогой'
            WHEN hc.hotel_category = 'Средний' THEN 'Средний'
            WHEN hc.hotel_category = 'Дешевый' THEN 'Дешевый'
            ELSE NULL
        END) AS preferred_hotel_type,
        STRING_AGG(DISTINCT h.name, ', ') AS visited_hotels
    FROM Booking b
    JOIN Room r ON b.ID_room = r.ID_room
    JOIN Hotel h ON r.ID_hotel = h.ID_hotel
    JOIN HotelCategories hc ON h.ID_hotel = hc.ID_hotel
    GROUP BY b.ID_customer
)

SELECT 
    cp.ID_customer,
	c.name,
    cp.preferred_hotel_type,
    cp.visited_hotels
FROM CustomerPreferences cp
JOIN Customer c ON cp.ID_customer = c.ID_customer
ORDER BY 
    CASE cp.preferred_hotel_type
        WHEN 'Дешевый' THEN 1
        WHEN 'Средний' THEN 2
        WHEN 'Дорогой' THEN 3
    END;
