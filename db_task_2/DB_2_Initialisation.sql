-- Создание таблицы Classes
CREATE TABLE Classes (
	class VARCHAR(100) NOT NULL,
	type VARCHAR(20) NOT NULL CHECK (type IN ('Racing', 'Street')), -- тип класса
	country VARCHAR(100) NOT NULL,
	numDoors INT NOT NULL,
	engineSize DECIMAL(3, 1) NOT NULL, -- размер двигателя в литрах
	weight INT NOT NULL,            	-- вес автомобиля в килограммах
	PRIMARY KEY (class)
);
 
-- Создание таблицы Cars
CREATE TABLE Cars (
	name VARCHAR(100) NOT NULL,
	class VARCHAR(100) NOT NULL,
	year INT NOT NULL,
	PRIMARY KEY (name),
	FOREIGN KEY (class) REFERENCES Classes(class)
);
 
-- Создание таблицы Races
CREATE TABLE Races (
	name VARCHAR(100) NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (name)
);
 
-- Создание таблицы Results
CREATE TABLE Results (
	car VARCHAR(100) NOT NULL,
	race VARCHAR(100) NOT NULL,
	position INT NOT NULL,
	PRIMARY KEY (car, race),
	FOREIGN KEY (car) REFERENCES Cars(name),
	FOREIGN KEY (race) REFERENCES Races(name)
);

-- Вставка данных в таблицу Classes
INSERT INTO Classes (class, type, country, numDoors, engineSize, weight) VALUES
('SportsCar', 'Racing', 'USA', 2, 3.5, 1500),
('Sedan', 'Street', 'Germany', 4, 2.0, 1200),
('SUV', 'Street', 'Japan', 4, 2.5, 1800),
('Hatchback', 'Street', 'France', 5, 1.6, 1100),
('Convertible', 'Racing', 'Italy', 2, 3.0, 1300),
('Coupe', 'Street', 'USA', 2, 2.5, 1400),
('Luxury Sedan', 'Street', 'Germany', 4, 3.0, 1600),
('Pickup', 'Street', 'USA', 2, 2.8, 2000);
-- Вставка данных в таблицу Cars
INSERT INTO Cars (name, class, year) VALUES
('Ford Mustang', 'SportsCar', 2020),
('BMW 3 Series', 'Sedan', 2019),
('Toyota RAV4', 'SUV', 2021),
('Renault Clio', 'Hatchback', 2020),
('Ferrari 488', 'Convertible', 2019),
('Chevrolet Camaro', 'Coupe', 2021),
('Mercedes-Benz S-Class', 'Luxury Sedan', 2022),
('Ford F-150', 'Pickup', 2021),
('Audi A4', 'Sedan', 2018),
('Nissan Rogue', 'SUV', 2020);
-- Вставка данных в таблицу Races
INSERT INTO Races (name, date) VALUES
('Indy 500', '2023-05-28'),
('Le Mans', '2023-06-10'),
('Monaco Grand Prix', '2023-05-28'),
('Daytona 500', '2023-02-19'),
('Spa 24 Hours', '2023-07-29'),
('Bathurst 1000', '2023-10-08'),
('Nürburgring 24 Hours', '2023-06-17'),
('Pikes Peak International Hill Climb', '2023-06-25');
-- Вставка данных в таблицу Results
INSERT INTO Results (car, race, position) VALUES
('Ford Mustang', 'Indy 500', 1),
('BMW 3 Series', 'Le Mans', 3),
('Toyota RAV4', 'Monaco Grand Prix', 2),
('Renault Clio', 'Daytona 500', 5),
('Ferrari 488', 'Le Mans', 1),
('Chevrolet Camaro', 'Monaco Grand Prix', 4),
('Mercedes-Benz S-Class', 'Spa 24 Hours', 2),
('Ford F-150', 'Bathurst 1000', 6),
('Audi A4', 'Nürburgring 24 Hours', 8),
('Nissan Rogue', 'Pikes Peak International Hill Climb', 3);
