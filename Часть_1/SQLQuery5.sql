-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE StudentNum
	-- Add the parameters for the stored procedure here
	@Num smallint = NULL OUTPUT, @Student_surname varchar(20), @Student_name varchar(20)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @Num = COUNT(*)
	FROM EXAM_MARKS INNER JOIN STUDENT
	ON Exam_marks.Student_Id = STUDENT.STUDENT_ID
	Where SURNAME=STUDENT.SURNAME and NAME = STUDENT.NAME
END
GO
