--Create new procedure called CreateGrade;
--Procedure should create only Grade header info (not Grade Details);
--Procedure should return the total number of grades in the system for
--the Student on input (from the CreateGrade);
--Procedure should return second resultset with the MAX Grade of all
--grades for the Student and Teacher on input (regardless the Course).
CREATE OR ALTER PROCEDURE usp_CreateGrade
(
	@StudentID INT,
    @TeacherID INT,
    @Grade INT,
    @Comment NVARCHAR(MAX),
    @CreatedDate DATETIME
)
AS
BEGIN
INSERT INTO dbo.Grade(StudentId,TeacherId,Grade,Comment,CreatedDate)
VALUES(@StudentID,@TeacherID,@Grade,@Comment,@CreatedDate)
SELECT COUNT(g.StudentID) AS TotalGrade
FROM [dbo].[Grade] g

SELECT MAX(g.Grade) AS MaxGrade
FROM [dbo].[Grade] g
WHERE StudentID = @StudentID AND TeacherID = @TeacherID
END
GO
EXEC usp_CreateGrade
	@StudentID = 50, 
    @TeacherID = 1, 
    @Grade = 9, 
    @Comment = 'Excellent performance', 
    @CreatedDate = '2024-05-30'
GO
