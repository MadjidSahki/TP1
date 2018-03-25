create proc iti.sTeacherUpdate2
(
    @TeacherId int,
    @FirstName nvarchar(32),
    @LastName  nvarchar(32),
    @isPresent bit
)
as
begin
	set transaction isolation level serializable;
	begin tran;

	if not exists(select * from iti.tTeacher t where t.TeacherId = @TeacherId)
	begin
		rollback;
		return 1;
	end;

	if exists(select * from iti.tTeacher t where t.TeacherId <> @TeacherId and t.FirstName = @FirstName and t.LastName = @LastName)
	begin
		rollback;
		return 2;
	end;

    update iti.tTeacher set FirstName = @FirstName, LastName = @LastName, isPresent = @isPresent where TeacherId = @TeacherId;
	commit;
    return 0;
end;
