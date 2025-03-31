WITH ClientBookings AS (
    SELECT 
        c.ID_customer,
        c.name,
        COUNT(b.ID_booking) AS total_bookings,
        COUNT(DISTINCT h.ID_hotel) AS unique_hotels,
        SUM(r.price) AS total_spent
    FROM Booking b
    JOIN Customer c ON b.ID_customer = c.ID_customer
    JOIN Room r ON b.ID_room = r.ID_room
    JOIN Hotel h ON r.ID_hotel = h.ID_hotel
    GROUP BY c.ID_customer, c.name
    HAVING COUNT(b.ID_booking) > 2 AND COUNT(DISTINCT h.ID_hotel) > 1
),
ClientSpentMoreThan500 AS (
    SELECT 
        c.ID_customer,
        c.name,
        SUM(r.price) AS total_spent,
        COUNT(b.ID_booking) AS total_bookings
    FROM Booking b
    JOIN Customer c ON b.ID_customer = c.ID_customer
    JOIN Room r ON b.ID_room = r.ID_room
    GROUP BY c.ID_customer, c.name
    HAVING SUM(r.price) > 500
)

SELECT 
    cb.ID_customer,
    cb.name,
    cb.total_bookings,
    cb.total_spent,
    cb.unique_hotels
FROM ClientBookings cb
JOIN ClientSpentMoreThan500 csm ON cb.ID_customer = csm.ID_customer
ORDER BY cb.total_spent ASC;
