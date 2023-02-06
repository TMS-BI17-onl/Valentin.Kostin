--Exercise 6
CREATE TABLE Patients 
	(ID int IDENTITY(1,1) PRIMARY KEY, 
	LastName VARCHAR (225) NOT NULL, 
	FirstName VARCHAR (225) NOT NULL, 
	SSN INT NOT NULL,  
	Email AS (CONCAT(UPPER(LEFT(FirstName, 1)), (LOWER(SUBSTRING(LastName, 3, 1))), '@mail.com')),
	Temp INT NOT NULL,
	CreatedDate DATE NOT NULL
	UNIQUE (LastName, Email, SSN));
	
--Exercise 7
 INSERT INTO dbo.Patients( LastName, FirstName, SSN, Temp, CreatedDate)
 VALUES 
	('Torres', 'Daniele', '567459087', 37.7, '2023-01-05'), 
	('Smith', 'Sam', '567459236', 36.6, '2023-01-04'), 
	('Jackson', 'Kate','192567896', 35.8, '2023-01-02'), 
	('Lothner', 'Jacob', '192670980', 39.0, '2023-01-01'),
    ('Jafferson', 'Lion', '198789054', 40.2, '2022-12-30'), 
	('Moss', 'Kate', '192799000', 37.0, '2022-11-26'), 
	('Johanson', 'Isaac', '190123456', 42.0, '2023-11-10'),
	('Potter', 'Harry', '198453222', 36.0, '2022-11-16'),
	('Cavil', 'Henry', '192005872', 37.4, '2023-01-03'), 
	('Evans', 'Chris', '207891673', 35.0, '2023-01-05');

--Exercise 8
ALTER TABLE dbo.Patients
ADD TempType AS (CASE
	WHEN Patients.Temp <= 37.0 THEN '< 37°C’'
	ELSE '> 37°C’'
	END);

--Exercise 9
CREATE VIEW Patients_v
AS SELECT Temp AS Temp_F
FROM dbo.Patients
WHERE Temp = Temp * 9 / 5 + 32;

--Exercise 10
SELECT ROUND(dbo.Patients.Temp,1)
FROM dbo.Patients;

CREATE FUNCTION F1(
	@Temp DEC(5,1)
)
RETURNS DEC(5,1) AS
BEGIN
RETURN @Temp * 9 / 5 + 32
END;

--Exercise 11
-- I DON'T HAVE ANY IDEA HOW TO DO IT USING VARIABLE
