DECLARE @Result smallint
EXECUTE StudentNum @Result OUTPUT, '���������', '����'
PRINT '���������� ��������� ' +CAST(@Result AS char(10));