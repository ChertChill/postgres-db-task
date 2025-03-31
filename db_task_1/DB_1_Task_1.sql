SELECT v.maker, m.model
FROM Vehicle v
JOIN Motorcycle m ON v.model = m.model
WHERE m.horsepower > 150 
  AND m.price < 20000.00 
  AND m.type = 'Sport';
