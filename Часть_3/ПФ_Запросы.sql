/*1.	Написать скалярную функцию для вычисления произведения следующей последовательности: 1, 2, 3, 4.*/
CREATE FUNCTION [dbo].[Function_of_the_average_of_four_values] 
(
	@Value1 int, @Value2 int, @Value3 int, @Value4 int
)
RETURNS real
AS
BEGIN
	DECLARE @Result real

	SELECT @Result=(@Value1+@Value2+@Value3+@Value4)/4

	RETURN @Result

END

SELECT dbo.[Function_of_the_average_of_four_values]  (5, 10, 15, 35)

/*2.	Написать скалярную функцию вычисления среднего балла из экзаменационных оценок заданного студента,
 например Ивановым.*/
Alter FUNCTION [dbo].[Function_avg_of_student]
(
@surname varchar(10)		
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT SURNAME, avg(Mark) as 'AVG'
	from student A, EXAM_MARKS B
	where SURNAME = @surname and A.STUDENT_ID  = B.Student_Id
	group by SURNAME
)

SELECT  * FROM dbo.[Function_avg_of_student] ('Сагадиева')

CREATE FUNCTION dbo.[Function_avg_of_student_Scalar]
(
	@surname varchar(10)		
)
RETURNS real
AS
BEGIN
	DECLARE @Result real

	SELECT @Result = avg(Mark) 
	from student A, EXAM_MARKS B
	where SURNAME = @surname and A.STUDENT_ID  = B.Student_Id
	RETURN @Result

END

SELECT  dbo.[Function_avg_of_student_Scalar] ('Сагадиева')

/*3.	Написать скалярную функцию вычисления количества дисциплин, по которым были сданы экзамены  
за последние несколько месяца заданным студентом. 
ФИО студента и количество месяцев являются входными параметрами функции.*/ 

CREATE FUNCTION dbo.[Function_count_of_subject_Scalar]
(
	@surname varchar(20), @name varchar(20), @lastname varchar(20), @month int		
)
RETURNS real
AS
BEGIN
	DECLARE @Result real
	SELECT @Result = COUNT(Subj_Id) 
	from student A, EXAM_MARKS B
	where SURNAME = @surname and NAME = @name and [LAST NAME] = @lastname and DATEDIFF(mm, Exam_Date, GetDate()) = @month
	RETURN @Result

END

SELECT  dbo.[Function_count_of_subject_Scalar] ('Сагадиева', 'Алсу', 'Айдаровна', 10)

/*4.	Создать функцию табличного типа для определения двух дисциплин с наименьшими оценками.*/

CREATE FUNCTION [dbo].[Function_subj_of_little_marks]
(		
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT TOP 2 Subj_Name, Mark
	FROM SUBJECT A, EXAM_MARKS B
	Where A.Subj_Id = B.Subj_Id
	group BY Subj_Name, Mark
)

SELECT  * FROM dbo.[Function_subj_of_little_marks] ()

/*5.	Создать функцию табличного типа для вывода информации по студентам, 
возраст которых не превышает 20 лет.*/
ALTER FUNCTION [dbo].[Function_info_of_students_20_age]
(		
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Name, Surname, [LAST NAME], DATEDIFF(yy, BIRTHDAY, GetDate()) AS 'Age'
	FROM STUDENT
	Where DATEDIFF(yy, BIRTHDAY, GetDate()) <= 20
	group by Name, Surname, [LAST NAME], BIRTHDAY
)

SELECT  * FROM dbo.[Function_info_of_students_20_age] ()

/*6.	Создать многооператорную пользовательскую функцию (типа multi-statement), 
которая выводит ФИО студента, средний балл по результатам экзаменов и  комментарий является ли он отличником, 
хорошистом или троечником. */

ALTER FUNCTION [dbo].[Function_FIO_AVG_USP]
(
)
RETURNS 
@fio_student TABLE 
(

	FIO varchar(100),
	AVGexam real,
	Usp varchar(50)
)
AS
BEGIN
	insert @fio_student
	select [LAST NAME] + ' ' + Name + ' ' + surname as 'FIO', avg(CAST(Mark as DEC(2,1))) as 'Mark','usp' = 
																		CASE 
																		WHEN avg(CAST(Mark as DEC(2,1)))>=4.5 then 'Отличник'
																		WHEN avg(CAST(Mark as DEC(2,1)))>=3.5 and avg(CAST(Mark as DEC(2,1)))<4.8 then 'Ударник'
																		WHEN avg(CAST(Mark as DEC(2,1)))>=2.8 and avg(CAST(Mark as DEC(2,1)))<3.5 then 'Троечник'
																		ELSE 'Неуспевающий'
																	end
	from student B, EXAM_MARKS A	
	where A.STUDENT_ID = B.Student_Id
	group by [LAST NAME] + ' ' + Name + ' ' + surname

	RETURN 
END
GO

SELECT * FROM dbo.[Function_FIO_AVG_USP]() 

