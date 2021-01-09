CREATE TABLE [dbo].[UserType] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [name]         VARCHAR (50)  NOT NULL,
    [type]         VARCHAR (50)  NOT NULL,
    [modyfity]     VARCHAR (100) NULL,
    [modyfityDate] DATETIME      NULL,
    [created]      VARCHAR (100) NULL,
    [createdDate]  DATETIME      NULL,
    CONSTRAINT [PK_UsersType] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
create TRIGGER [dbo].[AuditCreateUserType] on [dbo].[UserType]
INSTEAD OF INSERT
AS
BEGIN 
 SET NOCOUNT ON;
INSERT INTO [dbo].[UserType]
           ([name]
           ,[type]
           ,[modyfity]
           ,[modyfityDate]
           ,[created]
           ,[createdDate])
    (SELECT 
	i.name
	,i.type
	  ,SUSER_SNAME()
	  ,getdate()
	  ,i.modyfity
	  ,i.modyfityDate
	  
	  FROM
    inserted AS i)
END
GO
CREATE TRIGGER [dbo].[AuditModyfityUserType] ON [dbo].[UserType]
FOR  UPDATE
AS
BEGIN 
 SET NOCOUNT ON
update [UserType]
SET 
	[modyfity] =  SUSER_SNAME()
    ,[modyfityDate] = GETDATE()
	 FROM Inserted i 
END