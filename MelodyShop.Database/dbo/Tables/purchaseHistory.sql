CREATE TABLE [dbo].[purchaseHistory] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [cartId]       INT           NULL,
    [puchaseDate]  DATETIME      NULL,
    [modyfity]     VARCHAR (100) NULL,
    [modyfityDate] DATETIME      NULL,
    [created]      VARCHAR (100) NULL,
    [createdDate]  DATETIME      NULL,
    CONSTRAINT [PK_purchaseHistory] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_purchaseHistory_Cart] FOREIGN KEY ([cartId]) REFERENCES [dbo].[Cart] ([id])
);


GO
create TRIGGER [dbo].[AuditCreatepurchaseHistory] on [dbo].purchaseHistory
INSTEAD OF INSERT
AS
BEGIN 
 SET NOCOUNT ON;
INSERT INTO [dbo].[purchaseHistory]
           ([cartId]
           ,[puchaseDate]
           ,[modyfity]
           ,[modyfityDate]
           ,[created]
           ,[createdDate])
    (SELECT 
	i.cartId
	,i.puchaseDate
	  ,SUSER_SNAME()
	  ,getdate()
	  ,i.modyfity
	  ,i.modyfityDate
	  
	  FROM
    inserted AS i)
END
GO
CREATE TRIGGER [dbo].[AuditModyfitypurchaseHistory] ON [dbo].[purchaseHistory]
FOR  UPDATE
AS
BEGIN 
 SET NOCOUNT ON
update [purchaseHistory]
SET 
	[modyfity] =  SUSER_SNAME()
    ,[modyfityDate] = GETDATE()
	 FROM Inserted i 
END