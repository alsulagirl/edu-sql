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
CREATE PROCEDURE [dbo].[marks_of_students]
	-- Add the parameters for the stored procedure here
	@Name varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Name, SURNAME, 'Средний балл' = CAST(avg(CAST(MARK as dec(2, 0))) as dec(3, 2))
	from dbo.STUDENT, dbo.EXAM_MARKS A
	WHERE A.Student_Id = ( SELECT STUDENT_ID
								from STUDENT
								where SURNAME = @Name)
	group by name, surname
END
GO
