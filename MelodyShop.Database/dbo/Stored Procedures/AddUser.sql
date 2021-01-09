
Create procedure AddUser 
@street varchar(100)
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

INSERT INTO [dbo].[Adress]
           ([street]
           ,[houseNumber]
           ,[postalCode]
           ,[City]
           ,[Country])
     VALUES
           (@street
		   ,@houseNumber
		   ,@postalCode
		   ,@City
		   ,@Country)

		   declare @AdressId int
		   select @AdressId = max(id) from Adress

INSERT INTO [dbo].[Contact]
           ([name]
           ,[surname]
           ,[email]
           ,[phoneNumber]
           ,[adressId])
     VALUES
           (@name
		   ,@surname
		   ,@email
		   ,@phoneNumber
		   ,@AdressId)

		   		   declare @contactId int
		   select @contactId = max(id) from [Contact]

INSERT INTO [dbo].[Access]
           ([login]
           ,[password]
           ,[contaktId])
     VALUES
           (@login
		   ,@password
		   ,@contactId)

		    declare @accessId int
		   select @accessId = max(id) from [Contact]


INSERT INTO [dbo].[UserType]
           ([name]
           ,[type])
     VALUES
           (@nameUserType
		   ,@type)

		    declare @userTypeId int
		   select @userTypeId = max(id) from [Contact]


INSERT INTO [dbo].[User]
           ([usersTypeId]
           ,[accessId])
     VALUES
           (@usersTypeId
		   ,@accessId)

commit TRANSACTION 

end