CREATE TABLE [dbo].[Adress] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [street]       VARCHAR (100) NOT NULL,
    [houseNumber]  VARCHAR (50)  NOT NULL,
    [postalCode]   VARCHAR (50)  NOT NULL,
    [City]         VARCHAR (50)  NOT NULL,
    [Country]      VARCHAR (50)  NOT NULL,
    [modyfity]     VARCHAR (100) NULL,
    [modyfityDate] DATETIME      NULL,
    [created]      VARCHAR (100) NULL,
    [createdDate]  DATETIME      NULL,
    CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
create TRIGGER [dbo].[AuditCreateAdress] on [dbo].[Adress]
INSTEAD OF INSERT
AS
BEGIN 
 SET NOCOUNT ON;
 INSERT INTO [dbo].[Adress]
           ([street]
           ,[houseNumber]
           ,[postalCode]
           ,[City]
           ,[Country]
           ,[modyfity]
           ,[modyfityDate]
           ,[created]
           ,[createdDate])
    (SELECT 
	i.street
	,i.houseNumber
	,i.postalCode
	,i.City
	,i.Country
	  ,SUSER_SNAME()
	  ,getdate()
	  ,i.modyfity
	  ,i.modyfityDate
	  
	  FROM
    inserted AS i)
END
GO
CREATE TRIGGER [dbo].[AuditModyfityAdress] ON [dbo].[Adress]
FOR  UPDATE
AS
BEGIN 
 SET NOCOUNT ON
update [Adress]
SET 
	[modyfity] =  SUSER_SNAME()
    ,[modyfityDate] = GETDATE()
	 FROM Inserted i 
END