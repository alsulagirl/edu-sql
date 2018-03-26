-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
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
CREATE FUNCTION [dbo].[get_FIO_students] ()
RETURNS 
@fio_student TABLE 
(
	Student_id int primary key,
	FIO varchar(100)
)
AS
BEGIN
	insert @fio_student
	select student_id, [LAST NAME] + ' ' + Name + ' ' + surname
	from student
	
	RETURN 
END
GO