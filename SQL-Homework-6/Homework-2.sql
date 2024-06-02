CREATE OR ALTER PROCEDURE usp_CreateGradeDetail
(
	@GradeID INT,
	@AchievementTypeID INT,
	@AchievementPoints SMALLINT,
	@AchievementMaxPoints SMALLINT,
	@AchievementDate DATE
)
AS
BEGIN
INSERT INTO [dbo].[GradeDetails](GradeID,AchievementTypeID,AchievementPoints,AchievementMaxPoints,AchievementDate)
VALUES(@GradeID,@AchievementTypeID,@AchievementPoints,@AchievementMaxPoints,@AchievementDate)
SELECT SUM(CAST(gd.AchievementPoints AS INT)/CAST(gd.AchievementMaxPoints AS INT)*CAST([at].ParticipationRate AS INT)) FROM [dbo].[GradeDetails] gd
INNER JOIN [dbo].[AchievementType] [at] ON gd.ID=[at].ID
END
GO

EXEC dbo.usp_CreateGradeDetail
@GradeId=5,
@AchievementTypeID=5,
@AchievementPoints=50,
@AchievementMaxPoints=80,
@AchievementDate ='2020-01-11'
GO

SELECT * FROM [dbo].[GradeDetails]