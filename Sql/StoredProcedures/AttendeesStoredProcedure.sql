USE [Private School]
GO
/****** Object:  StoredProcedure [dbo].[Attendees]    Script Date: 30/4/2021 4:12:01 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Attendees]
@course nvarchar(50)
AS
BEGIN
DECLARE @courseId int
SET @courseId = (
				SELECT CourseId 
				FROM Course
				WHERE Course.Title = @course)
SELECT DISTINCT Student.FirstName , Student.LastName
		FROM Student
		INNER JOIN StudentCourse ON StudentCourse.StudentId= Student.StudentID
		INNER JOIN Course ON  StudentCourse.CourseId = @courseId
END;
