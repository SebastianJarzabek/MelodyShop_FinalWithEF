CREATE TABLE [dbo].[Contact] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [name]         VARCHAR (50)  NOT NULL,
    [surname]      VARCHAR (50)  NOT NULL,
    [email]        VARCHAR (50)  NOT NULL,
    [phoneNumber]  VARCHAR (50)  NOT NULL,
    [adressId]     INT           NOT NULL,
    [modyfity]     VARCHAR (100) NULL,
    [modyfityDate] DATETIME      NULL,
    [created]      VARCHAR (100) NULL,
    [createdDate]  DATETIME      NULL,
    CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Contact_Adress] FOREIGN KEY ([adressId]) REFERENCES [dbo].[Adress] ([id])
);


GO
create TRIGGER [dbo].[AuditCreateContact] on [dbo].[Contact]
INSTEAD OF INSERT
AS
BEGIN 
 SET NOCOUNT ON;
INSERT INTO [dbo].[Contact]
           ([name]
           ,[surname]
           ,[email]
           ,[phoneNumber]
           ,[adressId]
           ,[modyfity]
           ,[modyfityDate]
           ,[created]
           ,[createdDate])
    (SELECT 
	i.name
	,i.surname
	,i.email
	,i.phoneNumber
	,i.adressId
	
	  ,SUSER_SNAME()
	  ,getdate()
	  ,i.modyfity
	  ,i.modyfityDate
	  
	  FROM
    inserted AS i)
END
GO
CREATE TRIGGER [dbo].[AuditModyfityContact] ON [dbo].[Contact]
FOR  UPDATE
AS
BEGIN 
 SET NOCOUNT ON
update [Contact]
SET 
	[modyfity] =  SUSER_SNAME()
    ,[modyfityDate] = GETDATE()
	 FROM Inserted i 
END