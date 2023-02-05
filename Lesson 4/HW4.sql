-- Exercise 3
/*If the values that the expression that the window ORDER BY clause specifies are unique within a window, then all three functions return
the same value for each row.They return different values only when the ordering results in ties. The fact that this family has three members reflects 
the three possible ways to handle ties.
*/

--Exercise 4a 
--THERE IS NO DATA IN COLUMN "UnitMeasureCode" STARTING FROM "T"
INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT1' , 'Test 1' , '2020-09-20 00:00:00:000'),('TT2', 'Test 2' , getdate());

--Exercise 4b
SELECT UnitMeasureCode, Name, ModifiedDate
INTO Production.UnitMeasureTest
FROM Production.UnitMeasure
WHERE UnitMeasureCode = 'CAN'
ORDER BY UnitMeasureCode;

--Exercise 4c
UPDATE Production.UnitMeasureTest
SET UnitMeasureCode = 'TTT';

--Exercise 4d
DELETE
FROM Production.UnitMeasureTest;

-- Exercise 4e
SELECT 
AVG(LineTotal) OVER (PARTITION BY SalesOrderID) AS AVG_Line_total, 
MIN(LineTotal) OVER (PARTITION BY SalesOrderID) AS Min_Line_total,
MAX(LineTotal) OVER (PARTITION BY SalesOrderID) AS Max_Line_total
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = '43659' OR SalesOrderID = '43664';

--Exercise 4f
SELECT  
CONCAT(UPPER(LEFT(Sales.vSalesPerson.LastName, 3)),'login', TerritoryGroup) AS Login,
Sales.vSalesPerson.BusinessEntityID, 
Sales.vSalesPerson.FirstName, 
Sales.vSalesPerson.LastName, 
Sales.vSalesPerson.SalesYTD, 
Sales.vSalesPerson.SalesLastYear,
	RANK() over (ORDER BY SalesLastYear DESC) as Rank_Sales_last_year,
	RANK() over (ORDER BY SalesYTD DESC) as Rank_SalesYTD_this_year
FROM Sales.vSalesPerson;

--Exercise 4g
SELECT (CASE
        WHEN DATENAME(WEEKDAY, dateadd(mm, DATEDIFF(MM, 0, getdate()), 0)) = 'Saturday'
            THEN dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) + 2
        WHEN DATENAME(WEEKDAY, dateadd(mm, DATEDIFF(MM, 0, getdate()), 0)) = 'Sunday'
            THEN dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) + 1
        ELSE dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) 
        END) AS First_month_day;

--Exercise 5
/*
count (1)
 4
count (*)
 4
count (id)
 4
count (name)
 2
*/