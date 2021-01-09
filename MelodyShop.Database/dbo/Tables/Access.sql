CREATE TABLE [dbo].[Access] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [login]        VARCHAR (50)  NOT NULL,
    [password]     VARCHAR (50)  NOT NULL,
    [contaktId]    INT           NOT NULL,
    [modyfity]     VARCHAR (100) NULL,
    [modyfityDate] DATETIME      NULL,
    [created]      VARCHAR (100) NULL,
    [createdDate]  DATETIME      NULL,
    CONSTRAINT [PK_Access] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Access_Contact] FOREIGN KEY ([contaktId]) REFERENCES [dbo].[Contact] ([id])
);


GO
CREATE TRIGGER [dbo].[AuditCreateAccess] on [dbo].[Access]
INSTEAD OF INSERT
AS
BEGIN 
 SET NOCOUNT ON;
 INSERT INTO [dbo].[Access]
           ([login]
           ,[password]
           ,[contaktId]
           ,[modyfity]
           ,[modyfityDate]
           ,[created]
           ,[createdDate])
    (SELECT 
	i.login
	,i.password
	,i.contaktId
	  ,SUSER_SNAME()
	  ,getdate()
	  ,i.modyfity
	  ,i.modyfityDate
	  
	  FROM
    inserted AS i)
END
GO
CREATE TRIGGER [dbo].[AuditModyfityAccess] ON [dbo].[Access]
FOR  UPDATE
AS
BEGIN 
 SET NOCOUNT ON
update [Access]
SET 
	[modyfity] =  SUSER_SNAME()
    ,[modyfityDate] = GETDATE()
	 FROM Inserted i 
END