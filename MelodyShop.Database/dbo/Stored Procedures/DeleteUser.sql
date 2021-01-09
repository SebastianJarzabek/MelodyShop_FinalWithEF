
Create procedure DeleteUser @adressId int, @contactId int, @accessId int, @usertypeId int, @userId int


as
begin
begin transaction

Delete from Adress where id = @adressId

Delete from Contact where id = @contactId

Delete from Access where id = @accessId

Delete from Usertype where id = @usertypeId

Delete from [User] where id = @userId


commit TRANSACTION 

end