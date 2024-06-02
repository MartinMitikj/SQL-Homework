--Calculate the count of all grades per Teacher in the system
SELECT t.FirstName, t.LastName , COUNT(g.Grade) AS Grades
FROM [dbo].[Teacher] t
JOIN [dbo].[Grade] g ON t.ID = g.TeacherID
GROUP BY t.FirstName, t.LastName 
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT COUNT(*) AS Grades
FROM [dbo].[Teacher] t
JOIN [dbo].[Student] s ON t.ID = s.ID
WHERE s.ID < 100
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName , s.LastName, MAX(g.Grade) AS MaximalGrade , AVG(g.Grade) AS AverageGrade
FROM [dbo].[Student] s
JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY s.FirstName , s.LastName
GO

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName, t.LastName , COUNT(g.Grade) AS Grades
FROM [dbo].[Teacher] t
JOIN [dbo].[Grade] g ON t.ID = g.TeacherID
GROUP BY t.FirstName, t.LastName 
HAVING COUNT(g.Grade) > 200
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on
--all grades in the system. Filter only records where Maximal Grade is equal to
--Average Grade
SELECT s.FirstName , s.LastName, COUNT(g.Grade) AS TotalGrade, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade
FROM [dbo].[Student] s
JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY s.FirstName , s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

--List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName , s.LastName, COUNT(g.Grade) AS TotalGrade, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade
FROM [dbo].[Student] s
JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY s.FirstName , s.LastName
GO

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentsGrades 
AS
SELECT
	s.ID AS StudentId,
	COUNT(g.Grade) AS GradeCount
FROM [dbo].[Student] s
JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY s.ID
GO
SELECT * FROM vv_StudentsGrades
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentsGrades
AS
SELECT
	s.FirstName,
	s.LastName,
	COUNT(g.Grade) AS GradeCount
FROM [dbo].[Student] s
JOIN [dbo].[Grade] g ON s.ID = g.StudentID
GROUP BY s.FirstName , s.LastName
GO
SELECT * FROM vv_StudentsGrades
GO

--List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentsGrades
ORDER BY GradeCount DESC