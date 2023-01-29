-- Exercise 1a
SELECT *
FROM Sales.SalesTerritory;

-- Exercise 1b
SELECT TerritoryID, Name
FROM Sales.SalesTerritory;

--Exercise 1c
SELECT LastName
FROM Person.Person
WHERE LastName = 'Norman';

--Exercise 1c
SELECT EmailPromotion
FROM Person.Person
WHERE EmailPromotion != 2;

--Exercise 3
/*
Transact-SQL предоставляет следующие агрегатные функции:

APPROX_COUNT_DISTINCT
AVG
CHECKSUM_AGG
COUNT
COUNT_BIG

GROUPING
SELECT SalesQuota, SUM(SalesYTD) 'TotalSalesYTD', GROUPING(SalesQuota) AS 'Grouping'  
FROM Sales.SalesPerson  
GROUP BY SalesQuota WITH ROLLUP; 

GROUPING_ID
MAX
MIN
STDEV
STDEVP
STRING_AGG
SUM

VAR
SELECT VAR(DISTINCT SalesAmountQuota)AS Distinct_Values, VAR(SalesAmountQuota) AS All_Values  
FROM dbo.FactSalesQuota; 

VARP
*/

--Exercise 4A (Answer is 6)
SELECT PersonType
FROM Person.Person
WHERE LastName = 'M%' OR EmailPromotion !=1
GROUP BY PersonType;

--Exercise 4B
SELECT top 3 MAX (DiscountPct) AS Max_disc_pct, SpecialOfferID
FROM Sales.SpecialOffer
WHERE StartDate >= '2013-01-01' AND EndDate <= '2014-01-01'
GROUP BY SpecialOfferID;

--Exercise 4C
SELECT ProductID, 
	MIN(Weight) AS Min_Weight, 
	MAX(Size) AS Max_Size
FROM Production.Product
WHERE Weight>0
GROUP BY ProductID, Weight, Size
ORDER BY Weight ASC, Size DESC;

--Exercise 4D
SELECT ProductSubcategoryID,
	MIN (Weight) AS Min_weight,
	MAX (Size) AS Max_size
FROM Production.Product
--WHERE Weight IS NOT NULL AND Size IS NOT NULL (if needed) 
GROUP BY ProductSubcategoryID, Weight, Size
ORDER BY Weight ASC, Size DESC;

--Exercise 4E
SELECT ProductSubcategoryID,
	MIN (Weight) AS Min_weight,
	MAX (Size) AS Max_size, 
	Color
FROM Production.Product
--WHERE Weight IS NOT NULL AND Size IS NOT NULL (if needed)
WHERE Color IS NOT NULL
GROUP BY ProductSubcategoryID, Color, Weight, Size
ORDER BY Weight ASC, Size DESC;
