CREATE TABLE [dbo].[User] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [usersTypeId]  INT           NOT NULL,
    [accessId]     INT           NOT NULL,
    [modyfity]     VARCHAR (100) NULL,
    [modyfityDate] DATETIME      NULL,
    [created]      VARCHAR (100) NULL,
    [createdDate]  DATETIME      NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Users_Access] FOREIGN KEY ([accessId]) REFERENCES [dbo].[Access] ([id]),
    CONSTRAINT [FK_Users_UsersType] FOREIGN KEY ([usersTypeId]) REFERENCES [dbo].[UserType] ([id])
);


GO
create TRIGGER [dbo].[AuditCreateUser] on [dbo].[User]
INSTEAD OF INSERT
AS
BEGIN 
 SET NOCOUNT ON;
INSERT INTO [dbo].[User]
           ([usersTypeId]
           ,[accessId]
           ,[modyfity]
           ,[modyfityDate]
           ,[created]
           ,[createdDate])
    (SELECT 
	i.usersTypeId
	,i.accessId
	  ,SUSER_SNAME()
	  ,getdate()
	  ,i.modyfity
	  ,i.modyfityDate
	  
	  FROM
    inserted AS i)
END
GO
CREATE TRIGGER [dbo].[AuditModyfityUser] ON [dbo].[User]
FOR  UPDATE
AS
BEGIN 
 SET NOCOUNT ON
update [User]
SET 
	[modyfity] =  SUSER_SNAME()
    ,[modyfityDate] = GETDATE()
	 FROM Inserted i 
END