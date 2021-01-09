create procedure EditPasswordAccess @login varchar(50), @password varchar(50)
as
begin
UPDATE [dbo].[Access]
   SET 
      [password] = @password
 WHERE login= @login
end