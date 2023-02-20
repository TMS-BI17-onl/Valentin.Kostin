--Exercise 2
/*
Table 
ID		FirstName	LastName	ParentName	ID_Father	ID_Mother
1		Иван		Иванов		Петр		4			7
2		Дмитрий		Петров		Иван		8			9
3		Петр		Сидоров		Виктор		2			12
*/

SELECT 
CONCAT(LEFT(t1.LastName,1),LEFT(t1.FirstName,1),LEFT(t1.ParentName,1)) AS ChildName, 
CONCAT(LEFT(t2.LastName,1),LEFT(t2.FirstName,1),LEFT(t2.ParentName,1)) AS FatherName
FROM People2 t1 JOIN People2 t2 ON t1.ID_Father=t2.ID
WHERE t1.FirstName = 'Дмитрий'
;
