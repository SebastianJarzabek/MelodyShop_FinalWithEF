CREATE TABLE [dbo].[Cart] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [userId]       INT           NOT NULL,
    [productId]    INT           NOT NULL,
    [quantity]     INT           NOT NULL,
    [modyfity]     VARCHAR (100) NULL,
    [modyfityDate] DATETIME      NULL,
    [created]      VARCHAR (100) NULL,
    [createdDate]  DATETIME      NULL,
    CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Cart_Product] FOREIGN KEY ([productId]) REFERENCES [dbo].[Product] ([id]),
    CONSTRAINT [FK_Cart_Users] FOREIGN KEY ([userId]) REFERENCES [dbo].[User] ([id])
);


GO
create TRIGGER [dbo].[AuditCreateCart] on [dbo].Cart
INSTEAD OF INSERT
AS
BEGIN 
 SET NOCOUNT ON;
 INSERT INTO [dbo].[Cart]
           ([userId]
           ,[productId]
           ,[quantity]
           ,[modyfity]
           ,[modyfityDate]
           ,[created]
           ,[createdDate])
    (SELECT 
	i.userId
	,i.productId
	,i.quantity
	  ,SUSER_SNAME()
	  ,getdate()
	  ,i.modyfity
	  ,i.modyfityDate
	  
	  FROM
    inserted AS i)
END
GO
CREATE TRIGGER [dbo].[AuditModyfityCart] ON [dbo].[Cart]
FOR  UPDATE
AS
BEGIN 
 SET NOCOUNT ON
update [Cart]
SET 
	[modyfity] =  SUSER_SNAME()
    ,[modyfityDate] = GETDATE()
	 FROM Inserted i 
END