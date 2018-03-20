sp_help Average
sp_helptext Average

exec [Average] 10, 5, 5, 15

sp_help Students_by_city
sp_helptext Students_by_city

exec [Students_by_city] 'Уфа'

sp_help marks_of_students
sp_helptext marks_of_students

exec [marks_of_students] 'Сагадиева'

sp_help The_best_students
exec [2_kurs] 3

sp_help Students_by_mark
sp_helptext Students_by_mark

declare @Result smallint
execute Students_by_mark @Result OUTPUT, 'Mathematics', 5
PRINT 'Количество студентов ' + CAST(@Result as char(10))


sp_help student_with_max_avg_mark
sp_helptext student_with_max_avg_mark

exec [dbo].[student_with_max_avg_mark] 10

exec [hour_discp] 32