DECLARE @Result smallint
EXECUTE StudentNum @Result OUTPUT, 'Сагадиева', 'Алсу'
PRINT 'Количество студентов ' +CAST(@Result AS char(10));