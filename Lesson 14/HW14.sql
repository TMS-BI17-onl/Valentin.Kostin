-- Ex1
CREATE VIEW TOP50Teachers as
SELECT TOP 50 WITH TIES  Name,LastName, SUM(Mark) as SumMark,
DENSE_RANK() OVER (ORDER BY SUM(Mark) DESC) as rnk
FROM
(SELECT [dbo].[dim_teachers].name, [dbo].[dim_teachers].lastname, [dbo].[fct_timetable].date_time,
(CASE   WHEN COUNT ([dbo].[fct_timetable].lesson_id )>=10 THEN 3
	 WHEN COUNT ([dbo].[fct_timetable].lesson_id ) BETWEEN 5 AND 10 THEN 2
	 WHEN COUNT([dbo].[fct_timetable].lesson_id )<5 THEN 1
END) as Mark
FROM [dbo].[dim_teachers] JOIN [dbo].[fct_timetable] ON [dbo].[dim_teachers].[teacher_id] =[dbo].[fct_timetable].[teacher_id]
GROUP BY [dbo].[dim_teachers].name, [dbo].[dim_teachers].lastname, [dbo].[fct_timetable].date_time ) as r
GROUP BY name,lastname
ORDER BY SumMark DESC;

--Ex2
/*
Предложения по улучшению графиков:
a) - поменять фон на нейтральный, например белый
- убрать подписи под столбиками, либо легенду справа от них
- убрать тень
- убрать подпись вертикальной шкалы (Number of Calories), т.к. из названия графика и так понятно, что отображено по вертикали
b) -сделать 2д столбики
- поменять форму столбиков
- единицы измерения указать в отметках на шкале, вместо заголовка (in billions)
c) - подписи стобликов сделать горизонтальными
- сократить заголовок
*/