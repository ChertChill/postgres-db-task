-- Создание таблицы Vehicle
 
CREATE TABLE Vehicle (
	maker VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	type VARCHAR(20) NOT NULL CHECK (type IN ('Car', 'Motorcycle', 'Bicycle')),
	PRIMARY KEY (model)
);
 
-- Создание таблицы Car
 
CREATE TABLE Car (
	vin VARCHAR(17) NOT NULL,
	model VARCHAR(100) NOT NULL,
	engine_capacity DECIMAL(4, 2) NOT NULL, -- объем двигателя в литрах
	horsepower INT NOT NULL,             	-- мощность в лошадиных силах
	price DECIMAL(10, 2) NOT NULL,       	-- цена в долларах
	transmission VARCHAR(20) NOT NULL CHECK (transmission IN ('Automatic', 'Manual')), -- тип трансмиссии
	PRIMARY KEY (vin),
	FOREIGN KEY (model) REFERENCES Vehicle(model)
);
 
-- Создание таблицы Motorcycle
 
CREATE TABLE Motorcycle (
	vin VARCHAR(17) NOT NULL,
	model VARCHAR(100) NOT NULL,
	engine_capacity DECIMAL(4, 2) NOT NULL, -- объем двигателя в литрах
	horsepower INT NOT NULL,             	-- мощность в лошадиных силах
	price DECIMAL(10, 2) NOT NULL,       	-- цена в долларах
	type VARCHAR(20) NOT NULL CHECK (type IN ('Sport', 'Cruiser', 'Touring')), -- тип мотоцикла
	PRIMARY KEY (vin),
	FOREIGN KEY (model) REFERENCES Vehicle(model)
);
 
-- Создание таблицы Bicycle
 
CREATE TABLE Bicycle (
	serial_number VARCHAR(20) NOT NULL,
	model VARCHAR(100) NOT NULL,
	gear_count INT NOT NULL,             	-- количество передач
	price DECIMAL(10, 2) NOT NULL,       	-- цена в долларах
	type VARCHAR(20) NOT NULL CHECK (type IN ('Mountain', 'Road', 'Hybrid')), -- тип велосипеда
	PRIMARY KEY (serial_number),
	FOREIGN KEY (model) REFERENCES Vehicle(model)
);


-- Вставка данных в таблицу Vehicle
INSERT INTO Vehicle (maker, model, type) VALUES
('Toyota', 'Camry', 'Car'),
('Honda', 'Civic', 'Car'),
('Ford', 'Mustang', 'Car'),
('Yamaha', 'YZF-R1', 'Motorcycle'),
('Harley-Davidson', 'Sportster', 'Motorcycle'),
('Kawasaki', 'Ninja', 'Motorcycle'),
('Trek', 'Domane', 'Bicycle'),
('Giant', 'Defy', 'Bicycle'),
('Specialized', 'Stumpjumper', 'Bicycle');
-- Вставка данных в таблицу Car
INSERT INTO Car (vin, model, engine_capacity, horsepower, price, transmission) VALUES
('1HGCM82633A123456', 'Camry', 2.5, 203, 24000.00, 'Automatic'),
('2HGFG3B53GH123456', 'Civic', 2.0, 158, 22000.00, 'Manual'),
('1FA6P8CF0J1234567', 'Mustang', 5.0, 450, 55000.00, 'Automatic');
-- Вставка данных в таблицу Motorcycle
INSERT INTO Motorcycle (vin, model, engine_capacity, horsepower, price, type) VALUES
('JYARN28E9FA123456', 'YZF-R1', 1.0, 200, 17000.00, 'Sport'),
('1HD1ZK3158K123456', 'Sportster', 1.2, 70, 12000.00, 'Cruiser'),
('JKBVNAF156A123456', 'Ninja', 0.9, 150, 14000.00, 'Sport');
-- Вставка данных в таблицу Bicycle
INSERT INTO Bicycle (serial_number, model, gear_count, price, type) VALUES
('SN123456789', 'Domane', 22, 3500.00, 'Road'),
('SN987654321', 'Defy', 20, 3000.00, 'Road'),
('SN456789123', 'Stumpjumper', 30, 4000.00, 'Mountain');
