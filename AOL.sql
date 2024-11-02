CREATE DATABASE AOL_DB
GO

USE AOL_DB
GO

CREATE TABLE MsCustomer (
	CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(100) NOT NULL,
	CustomerPhone VARCHAR(15) NOT NULL,
	CustomerAddress VARCHAR(100) NOT NULL,
	CustomerAge INT NOT NULL
);

INSERT INTO MsCustomer VALUES
('CU001', 'Yeremia', '0812983746523', 'Jl. Sadar 53', 45),
('CU002', 'Ivan', '087534649350', 'Jl. Pingsan 64', 23),
('CU003', 'Nessa', '0876395683677', 'Jl. Angsa 77', 28),
('CU004', 'Kujos', '0843690394284', 'Jl. Bebek 89', 30),
('CU005', 'Sepani', '0892762470388', 'Jl. Rusak 68', 44),
('CU006', 'George', '088537583543', 'Jl. Bagus 87', 27),
('CU007', 'Jorji', '086194841759', 'Jl. Sore 34', 54),
('CU008', 'Steve', '0861935425059', 'Jl. Pagi 23', 37),
('CU009', 'Lielie', '0864565633423', 'Jl. Siang 65', 52),
('CU010', 'Cardo', '086468247046', 'Jl. Jalan 32', 48);

CREATE TABLE MsStaff (
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(100) NOT NULL,
	StaffGender VARCHAR(10) NOT NULL,
	StaffAge INT NOT NULL
);

INSERT INTO MsStaff VALUES
('ST001', 'Pane', 'Male', 30),
('ST002', 'Zuri', 'Male', 35),
('ST003', 'Anan', 'Female', 40);

CREATE TABLE MsRoom (
	RoomID CHAR(5) PRIMARY KEY CHECK(RoomID LIKE 'RM[0-9][0-9][0-9]'),
	RoomName VARCHAR(20) NOT NULL,
	RoomCapacity INT NOT NULL,
	RoomPrice INT NOT NULL
);

INSERT INTO MsRoom VALUES
('RM001', 'VVIP', 30, 500000),
('RM002', 'VIP', 50, 300000),
('RM003', 'Class 1', 100, 100000);

CREATE TABLE MsGenre (
	GenreID CHAR(5) PRIMARY KEY CHECK(GenreID LIKE 'GN[0-9][0-9][0-9]'),
	GenreName VARCHAR(100) NOT NULL
);

INSERT INTO MsGenre VALUES
('GN001', 'Comedy'),
('GN002', 'Adventure'),
('GN003', 'Horror'),
('GN004', 'Romance');

CREATE TABLE MsMovie (
	MovieID CHAR(5) PRIMARY KEY CHECK(MovieID LIKE 'MV[0-9][0-9][0-9]'),
	MovieName VARCHAR(100) NOT NULL,
	MovieRating FLOAT NOT NULL,
	MoviePrice INT NOT NULL,
	GenreID CHAR(5) FOREIGN KEY REFERENCES MsGenre(GenreID) NOT NULL
);

INSERT INTO MsMovie VALUES
('MV001', 'Avenger: Paranormal', 9.4, 50000, 'GN003'),
('MV002', 'The Man Called Rasyad', 8.8, 70000, 'GN002'),
('MV003', 'Tetanggaku Bernama Nayla', 8.7, 80000, 'GN004'),
('MV004', 'Yeremia The Assassin', 8.6, 60000, 'GN001');

CREATE TABLE TransactionHeader (
	TransactionID CHAR(5) PRIMARY KEY CHECK(TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	TransactionDate DATE NOT NULL,
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) NOT NULL
);

INSERT INTO TransactionHeader VALUES
('TR001', '2023-01-02', 'ST001', 'CU001'),
('TR002', '2023-01-03', 'ST002', 'CU002'),
('TR003', '2023-01-04', 'ST003', 'CU003'),
('TR004', '2023-01-05', 'ST003', 'CU004'),
('TR005', '2023-01-06', 'ST002', 'CU005'),
('TR006', '2023-01-07', 'ST002', 'CU006'),
('TR007', '2023-01-08', 'ST001', 'CU007'),
('TR008', '2023-01-09', 'ST002', 'CU008'),
('TR009', '2023-01-10', 'ST003', 'CU009'),
('TR010', '2023-01-11', 'ST003', 'CU010');

CREATE TABLE TransactionDetail (
	TransactionID CHAR(5) FOREIGN KEY REFERENCES TransactionHeader(TransactionID) NOT NULL,
	MovieID CHAR(5) FOREIGN KEY REFERENCES MsMovie(MovieID) NOT NULL,
	RoomID CHAR(5) FOREIGN KEY REFERENCES MsRoom(RoomID) NOT NULL,
	Seat VARCHAR(5) NOT NULL,
	ShowTime TIME NOT NULL
);

INSERT INTO TransactionDetail VALUES
('TR001', 'MV001', 'RM001', 'A5', '18:30:00'),
('TR001', 'MV001', 'RM001', 'A6', '18:30:00'),
('TR001', 'MV001', 'RM001', 'A7', '18:30:00'),
('TR002', 'MV002', 'RM002', 'A2', '18:30:00'),
('TR002', 'MV002', 'RM002', 'A3', '18:30:00'),
('TR002', 'MV002', 'RM002', 'A4', '18:30:00'),
('TR003', 'MV003', 'RM003', 'B6', '12:30:00'),
('TR003', 'MV003', 'RM003', 'C8', '15:30:00'),
('TR004', 'MV001', 'RM002', 'E3', '20:30:00'),
('TR004', 'MV001', 'RM002', 'E4', '20:30:00'),
('TR005', 'MV001', 'RM003', 'J9', '20:30:00'),
('TR005', 'MV001', 'RM003', 'J10', '20:30:00'),
('TR006', 'MV003', 'RM002', 'E4', '22:30:00'),
('TR006', 'MV003', 'RM002', 'E5', '22:30:00'),
('TR006', 'MV003', 'RM002', 'E6', '22:30:00'),
('TR007', 'MV004', 'RM001', 'B4', '20:30:00'),
('TR007', 'MV004', 'RM001', 'B5', '20:30:00'),
('TR008', 'MV002', 'RM001', 'C9', '22:30:00'),
('TR008', 'MV002', 'RM001', 'C10', '22:30:00'),
('TR009', 'MV002', 'RM002', 'A8', '16:30:00'),
('TR009', 'MV002', 'RM002', 'C3', '19:30:00'),
('TR010', 'MV004', 'RM003', 'C3', '22:30:00'),
('TR010', 'MV004', 'RM003', 'C4', '22:30:00'),
('TR010', 'MV004', 'RM003', 'C5', '22:30:00');

SELECT * FROM TransactionHeader;
SELECT * FROM TransactionDetail;
SELECT * FROM MsCustomer;
SELECT * FROM MsStaff;
SELECT * FROM MsMovie;
SELECT * FROM MsGenre;
SELECT * FROM MsRoom;

-- USE master; DROP DATABASE AOL_DB;