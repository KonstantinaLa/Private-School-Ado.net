USE [Private School]
GO
/****** Object:  StoredProcedure [dbo].[AssignmentPerCourse]    Script Date: 30/4/2021 4:14:41 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AssignmentPerCourse]
@course nvarchar(50)
AS
BEGIN
DECLARE @courseId int
SET @courseId = (
				SELECT CourseId 
				FROM Course
				WHERE Course.Title = @course)
SELECT DISTINCT Assignment.Title
		FROM Assignment
		INNER JOIN AssignmentCourse ON AssignmentCourse.AssignmentId = Assignment.AssignmentId 
		INNER JOIN Course ON  AssignmentCourse.CourseId = @courseId
END;
