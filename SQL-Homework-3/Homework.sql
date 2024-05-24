USE SEDC_ACADEMY_HOMEWORK
GO

--Create Foreign key constraints from diagram or with script

ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Student] 
FOREIGN KEY(StudentID) REFERENCES [dbo].Student(ID)
GO

ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Course] 
FOREIGN KEY(CourseID) REFERENCES [dbo].Course(ID)
GO

ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Teacher] 
FOREIGN KEY(TeacherID) REFERENCES [dbo].Teacher(ID)
GO

ALTER TABLE [dbo].[GradeDetails]
ADD CONSTRAINT [FK_GradeDetails_Grade] 
FOREIGN KEY(GradeID) REFERENCES [dbo].Grade(ID)
GO

ALTER TABLE [dbo].[GradeDetails]
ADD CONSTRAINT [FK_GradeDetails_AchievementType] 
FOREIGN KEY(AchievementTypeID) REFERENCES [dbo].AchievementType(ID)
GO


--List all possible combinations of Courses names and AchievementTypenames that can be passed by student
SELECT c.Name AS CourseName, a.Name AS AchivmentTypeName FROM [dbo].[Course] c
CROSS JOIN [dbo].[AchievementType] a
GO

--List all Teachers without exam Grade
SELECT t.* FROM [dbo].[Teacher] t
LEFT JOIN [dbo].[Grade] g ON g.TeacherID = t.ID AND g.ID IS NULL
GO