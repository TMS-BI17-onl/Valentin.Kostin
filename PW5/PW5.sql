--Exercise 1
SELECT ProductSubcategoryID
FROM Production.Product
WHERE Product.Weight > 150;

--Exercise 2
-- Option 1
SELECT TOP 1 WITH TIES Name, MAX(StandardCost)
FROM Production.Product
GROUP BY Name
ORDER BY MAX(StandardCost) DESC;

--Option 2
SELECT TOP 1 WITH TIES Name, StandardCost
FROM 
(SELECT Name, StandardCost, MAX(StandardCost) OVER (PARTITION BY StandardCost) AS max_cost
FROM Production.Product) t
where StandardCost = max_cost
ORDER BY StandardCost DESC

--Option 3
SELECT Name, StandardCost
FROM Production.Product
WHERE StandardCost = 
(SELECT MAX(StandardCost)
FROM Production.Product)

--Option 4
-

--Exercise 3
SELECT DimCustomers.customer_Id, FctOrders.Rent_date
FROM DimCustomers
JOIN FctOrders ON DimCustomers.ID_Customer=FctOrders.ID_customer
WHERE FctOrders.Rent_date IS NULL AND FctOrders.Rent_date > DATEADD(year,-1,GETDATE())
;

--Exercise 4
SELECT DimEmployees.Employee_number, FctMaintenance.Start_date
FROM DimEmployees
JOIN FctMaintenance ON DimEmployees.Employee_number=FctMaintenance.ID_Maintenance
WHERE FctOrders.Rent_date >= DATEADD(year,-5,GETDATE())
;

--Exercise 5
SELECT notifications.category
FROM notifications
JOIN users ON users.id=notifications.user_id
WHERE Users.email = 'alex@gmail.com' AND is_read = false
GROUP BY Notifications.category
HAVING COUNT(Notifications.category) > 50
;

Mark: 6
