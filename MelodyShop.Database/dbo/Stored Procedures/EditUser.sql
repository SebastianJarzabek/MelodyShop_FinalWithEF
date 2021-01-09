
Create procedure EditUser @adressId int, @contactId int, @accessId int, @userTypeId int, @userId int

,@street varchar(100)
,@houseNumber varchar(50)
,@postalCode varchar(50)
,@City varchar(50)
,@Country varchar(50)
,@name varchar(50)
,@surname varchar(50)
,@email varchar(50)
,@phoneNumber varchar(50)
,@login varchar(50)
,@password varchar(50)
,@nameUserType varchar(50)
,@type varchar(50)
,@usersTypeId varchar(50)
as
begin
begin transaction

UPDATE [dbo].[Adress]
   SET [street] = @street
      ,[houseNumber] = @houseNumber
      ,[postalCode] = @postalCode
      ,[City] = @City
      ,[Country] = @Country
 WHERE id= @adressId

UPDATE [dbo].[Contact]
   SET [name] = @name
      ,[surname] = @surname
      ,[email] = @email
      ,[phoneNumber] = @phoneNumber
      ,[adressId] = @adressId  
 WHERE id = @contactId


UPDATE [dbo].[Access]
   SET [login] = @login
      ,[password] = @password
	  ,[contaktId] = @contactId  
 WHERE id = @accessId

UPDATE [dbo].[UserType]
   SET [name] = @nameUserType
      ,[type] = @type 
 WHERE id = @usertypeId

UPDATE [dbo].[User]
   SET [usersTypeId] = @userTypeId
      ,[accessId] = @accessId
 WHERE id= @userId


commit TRANSACTION 

end