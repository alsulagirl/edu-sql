/*1. Создайте представление для получения сведений о количестве студентов в каждом
городе.*/
create view dbo.v_students_by_city
as
select address, count(*) as count_of_students 
from Sagadieva.dbo.student
group by address

/*2. Создайте представление для получения сведений по каждому студенту: его фамилию,
имя, среднюю оценку.*/
drop view dbo.student_info
alter view dbo.student_info
as 
select surname, name, cast(avg(cast(mark as dec(3,2))) as dec(4,2)) as marks
from Sagadieva.dbo.student A, Sagadieva.dbo.exam_marks B
where A.student_id = B.student_id
group by surname, name


/*3. Создайте представление для вывода количества предметов, по которым экзаменовался
каждый студент, сдававший более 3-х предметов.*/

create view dbo.student_3_and_more
as 
select surname, name, count(Subj_Id) as subj
from Sagadieva.dbo.student A, Sagadieva.dbo.exam_marks B
where ((A.Student_Id = B.Student_Id) and 3 <=( select count(Subj_Id)
												from Sagadieva.dbo.EXAM_MARKS C
												where (C.Student_Id = B.Student_Id)))
group by surname, name

/*4. Создайте представление для вывода данные об ФИО всех студентов, имеющих по
предмету c идентификатором 1 оценку выше общей средней оценки.*/
drop view dbo.student_1_4
create view dbo.student_1_4
as 
select surname, name, [LAST NAME], Mark, Subj_Id
from Sagadieva.dbo.student A, Sagadieva.dbo.exam_marks B
where A.STUDENT_ID = B.Student_Id and Subj_Id=1 and Mark >= (select avg(Mark) from Sagadieva.dbo.EXAM_MARKS where Subj_Id=1)
									
/*5. Создайте обновляемое представление для таблицы «Дисциплины». Вывести названия
дисциплин с количеством часов менее 72.*/

alter view dbo.discipline
as
select Subj_id, Subj_Name, Hour, Semester
from Sagadieva.dbo.SUBJECT
where Hour<72
with check option 

insert into dbo.discipline values (10,'BD',70, 5) 

insert into dbo.discipline values (17,'Программирование',80, 5) 



/*6. Создайте представление для таблицы «Студент», включающее поля «Фамилия», «Имя»,
«Стипендия». Ограничить ввод или изменение значений в поле «Стипендия» в пределах
от 1000 до 2500.*/
drop view students
alter view dbo.students
as
select student_id, surname, name, [LAST NAME], stipend
from Sagadieva.dbo.student
where (stipend >=1000 and stipend <=2500)
with check option

insert into dbo.students values (23, 'sfdhvcx', 'efskhjd', 'wefshukjdc', 500)
