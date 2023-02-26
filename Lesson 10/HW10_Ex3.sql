--Exercise 3
SELECT YEAR, January, February, December
FROM
	(SELECT YEAR (DueDate) AS YEAR, DATENAME (MONTH, DueDate) AS MONTH, OrderQty
		FROM Production.WorkOrder) AS SourceTable
PIVOT
(SUM (OrderQty) FOR MONTH IN (January, February, December)) AS pivot_table
ORDER BY YEAR;