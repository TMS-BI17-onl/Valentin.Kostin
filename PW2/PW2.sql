--Exercise 1
SELECT Person.Person.FirstName, Person.Person.LastName, Person.PersonPhone.PhoneNumber
FROM Person.Person
LEFT JOIN Person.PersonPhone
ON Person.BusinessEntityID=PersonPhone.BusinessEntityID
WHERE PersonPhone.PhoneNumber LIKE '4_5%';

--Exercise 2
SELECT NationalIDNumber, BirthDate, YEAR(GETDATE()) - YEAR(BirthDate) AS Age,
		CASE 
		WHEN YEAR(GETDATE()) - YEAR(BirthDate) BETWEEN 17 AND 20 THEN 'Adolescence'
		WHEN YEAR(GETDATE()) - YEAR(BirthDate)BETWEEN 21 AND 59 THEN 'Adults'
		WHEN YEAR(GETDATE()) - YEAR(BirthDate) BETWEEN 60 AND 75 THEN 'Elderly'
		WHEN YEAR(GETDATE()) - YEAR(BirthDate) BETWEEN 76 AND 90 THEN 'Senile'
		ELSE 'Othhers'
		END AS Age
FROM HumanResources.Employee
;

--Exercise 3
SELECT Name, Color, StandardCost
FROM (SELECT Name, Color, StandardCost, MAX(StandardCost) OVER (PARTITION BY Color)  as max_cost FROM Production.Product) temp
WHERE StandardCost=max_cost;
