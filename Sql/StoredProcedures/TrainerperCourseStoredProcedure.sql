USE [Private School]
GO
/****** Object:  StoredProcedure [dbo].[TrainersPerCourse]    Script Date: 30/4/2021 4:14:44 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[TrainersPerCourse]
@course nvarchar(50)
AS
BEGIN
DECLARE @courseId int
SET @courseId = (
				SELECT CourseId 
				FROM Course
				WHERE Course.Title = @course)
SELECT DISTINCT Trainer.FirstName , Trainer.LastName
		FROM Trainer
		INNER JOIN TrainerCourse ON TrainerCourse.TrainerId= Trainer.TrainerId
		INNER JOIN Course ON  TrainerCourse.CourseId = @courseId
END;
