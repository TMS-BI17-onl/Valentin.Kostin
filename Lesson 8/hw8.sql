--Exercise 1
CREATE DATABASE ITSchool;

USE ITSchool;

CREATE TABLE dim_students
(
    student_id     INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    name		   VARCHAR(45) NOT NULL,
	lastname       VARCHAR(45) NOT NULL,
    dob	           DATE NOT NULL, 
    passport_id	   UNIQUEIDENTIFIER UNIQUE DEFAULT NEWID(),
    phone_number   VARCHAR(45) NOT NULL,
    email          AS CONCAT (LEFT(UPPER(name),1),LEFT(LOWER(lastname),3),'@gmail.com'),
    start_date	   DATE NOT NULL,
	end_date	   DATE NOT NULL,
  );



  CREATE TABLE dim_teachers
(
    teacher_id     INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    name		   VARCHAR(45) NOT NULL,
	lastname       VARCHAR(45) NOT NULL,
    dob	           DATE NOT NULL,
	speciality	   NVARCHAR(225) NOT NULL,
      );


  CREATE TABLE dim_lessons
(
    lesson_id      INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	name		   NVARCHAR(90) NOT NULL,
    course_name	   NVARCHAR(100) NOT NULL,
	description	   NVARCHAR(225) NOT NULL,
      );


   CREATE TABLE fct_attendance_and_mark
(
    attendmark_id  INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    student_id	   INT NOT NULL,
	attendance     BIT NOT NULL,
    date           DATE NOT NULL,
	lesson_id      INT NOT NULL,
	mark	       INT NOT NULL,
	CONSTRAINT FK_student_id FOREIGN KEY (student_id)
    REFERENCES dim_students(student_id),
	CONSTRAINT FK_lesson_id FOREIGN KEY (lesson_id)
    REFERENCES dim_lessons(lesson_id),
);
   
      CREATE TABLE fct_timetable
(
    ID_timetable   INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    student_id	   INT NOT NULL,
	date_time      DATETIME NOT NULL,
	lesson_id      INT NOT NULL,
	teacher_id     INT NOT NULL,
	room	       VARCHAR(45) NOT NULL,
	CONSTRAINT FK_student_id2 FOREIGN KEY (student_id)
    REFERENCES dim_students(student_id),
	CONSTRAINT FK_lesson_id2 FOREIGN KEY (lesson_id)
    REFERENCES dim_lessons(lesson_id),
	CONSTRAINT FK_teacher_id  FOREIGN KEY (teacher_id )
    REFERENCES dim_teachers(teacher_id ),
);

--Exercise 2
USE AdventureWorks2017
GO
SELECT TOP 1000000
      c1.first_name,
      c2.last_name
   FROM dbo.Random_names c1
CROSS JOIN
 dbo.Random_names c2
 ;

 --Exercise 3
 /*A common table expression or CTE (Common Table Expressions) is a temporary result set of data that can be accessed in subsequent queries.
 The WITH statement is used to write a generalized table expression. 
 A WITH expression is considered "temporary" because the result is not stored somewhere permanently in the database schema,
 but acts as a temporary representation that exists only for the duration of the query, i.e. it is available only during the execution of the SELECT,
 INSERT statements , UPDATE, DELETE, or MERGE. It is only valid in the query to which it belongs,
 allowing for improved query structure without polluting the global namespace. This clause can also be used in a CREATE VIEW statement as part of
 the SELECT statement that defines it. Generic table expressions have been added to SQL to simplify complex long queries,
 especially those with multiple subqueries. Their main task is to improve readability, ease of writing queries and their further support. 
 It does this by hiding large and complex queries in named expressions, which are then used in the main query.*/