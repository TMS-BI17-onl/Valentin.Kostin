--Exercise 3
USE AdventureWorks2017
GO 

CREATE PROCEDURE HumanResources.EmployeeUpdate
    @BusinessEntityID INT,
    @NationalIDNumber NVARCHAR(15)
AS
BEGIN
UPDATE HumanResources.Employee 
SET NationalIDNumber = @NationalIDNumber 
WHERE BusinessEntityID = @BusinessEntityID
END;

EXEC HumanResources.[EmployeeUpdate] 15, '879341111';

--DROP PROCEDURE HumanResources.EmployeeUpdate

/*SELECT *
FROM HumanResources.Employee
WHERE BusinessEntityID = 15;*/