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
/*Разработать процедуру для вывода количества определенных по величине оценок
(например, отлично), полученных по заданной дисциплине (например, Информатике).*/
CREATE PROCEDURE [dbo].[Students_by_mark]
	-- Add the parameters for the stored procedure here
	@Num integer=0 OUTPUT, @Discipline varchar(20), @mark integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @Num = COUNT(*)
	FROM EXAM_MARKS
	WHERE Mark = @Mark and Subj_Id = (select Subj_Id
										from subject	
										where Subj_Name=@Discipline)
END
GO
