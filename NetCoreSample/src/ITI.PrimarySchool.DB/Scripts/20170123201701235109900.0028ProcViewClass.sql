create proc iti.sConsultClass
(
	@ClassId int,
	@TeacherFirstName nvarchar(32),
    @TeacherLastName  nvarchar(32),
    @StudentFirstName nvarchar(32),
    @StudentLastName  nvarchar(32)
)
as
begin
	set transaction isolation level serializable;
	begin tran;

	if not exists(select * from iti.vStudent c where c.ClassId = @ClassId)
	begin
		rollback;
		return 1;
	end;

	select s.FirstName,
           s.LastName, 
           s.TeacherFirstName, 
           s.TeacherLastName 
    from iti.vStudent s where s.ClassId = @ClassId
    commit;
    return 0;

end;