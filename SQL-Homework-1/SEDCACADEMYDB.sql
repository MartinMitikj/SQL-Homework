CREATE DATABASE [SEDCHome]
GO

CREATE TABLE [Student](
	Id int IDENTITY(1,1),
	FirstName nvarchar(20) NOT NULL,
	LastName nvarchar(20) NOT NULL,
	DateOfBirth date NOT NULL,
	EnrolledDate date NOT NULL,
	Gender varchar NOT NULL,
	NationalIDNumber int NOT NULL,
	StudentCardNUmber int NOT NULL
)

CREATE TABLE [Teacher](
	Id int IDENTITY(1,1),
	FirstName nvarchar(20) NOT NULL,
	LastName nvarchar(20) NOT NULL,
	DateOfBirth date NOT NULL,
	AcademicRank int NOT NULL,
	HireDate date NOT NULL
)

CREATE TABLE [Grade](
	Id int IDENTITY(1,1),
	StudentID int NOT NULL,
	CourseID int NOT NULL,
	TeacherID int NOT NULL,
	Grade int NOT NULL,
	Comment nvarchar(500) NOT NULL,
	CreatedDate date NOT NULL
)

CREATE TABLE [Course](
	Id int IDENTITY(1,1),
	[Name] nvarchar(20) NOT NULL,
	Credit int NOT NULL,
	AcademicYear datetime NOT NULL,
	Semestar int NOT NULL
)

CREATE TABLE [GradeDetails](
	Id int IDENTITY(1,1),
	GradeID int NOT NULL,
	AchivmentTypeID int NOT NULL,
	AchivmentPoints int NOT NULL,
	AchivmentMaxPoints int NOT NULL,
	AchivmentDate date NOT NULL
)

CREATE TABLE [AchivmentType](
	Id int IDENTITY(1,1),
	[Name] nvarchar(20) NOT NULL,
	Description nvarchar(500) NOT NULL,
	ParticipationRate decimal(18,2) NOT NULL
)

SELECT * FROM Student
SELECT * FROM Teacher
SELECT * FROM Grade
SELECT * FROM Course
SELECT * FROM GradeDetails
SELECT * FROM AchivmentType