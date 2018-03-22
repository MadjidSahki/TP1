create view iti.vStudentClass
	as
select
	StudentId = t.StudentId,
	ClassId = coalesce(c.ClassId,0),
	[Name] = coalesce([Name],'')
from iti.tStudent t
	left outer join iti.tClass c on c.ClassId = t.ClassId
where t.StudentId <> 0;