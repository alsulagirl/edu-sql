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
/*Разработать процедуру для поиска студента с максимальной средней оценкой и
увеличить его стипендию на заданный процент (например, 10%).*/

CREATE PROCEDURE [dbo].[student_with_max_avg_mark]
	-- Add the parameters for the stored procedure here
	@prc integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here	
	update STUDENT SET stipend = stipend*(@prc+100)/100
						WHERE STUDENT_ID=(select student_id
from exam_marks A
group by student_id
having avg(mark)>= (select avg(mark)
						from exam_marks B
						where A.Student_Id <> B.Student_Id))

																	
END
GO
