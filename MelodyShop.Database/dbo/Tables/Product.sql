CREATE TABLE [dbo].[Product] (
    [id]           INT             IDENTITY (1, 1) NOT NULL,
    [name]         VARCHAR (50)    NOT NULL,
    [category]     VARCHAR (50)    NOT NULL,
    [price]        DECIMAL (18, 2) NOT NULL,
    [detail]       VARCHAR (MAX)   NULL,
    [modyfity]     VARCHAR (100)   NULL,
    [created]      VARCHAR (100)   NULL,
    [modyfityDate] DATETIME        NULL,
    [createdDate]  DATETIME        NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE trigger [dbo].[AuditModyfity] on [dbo].[Product]
FOR  update
as
begin 
 SET NOCOUNT ON
update Product
set 
	[modyfity] =  SUSER_SNAME()
    ,[modyfityDate] = getdate()
	 FROM Inserted i 
end
GO
CREATE trigger [dbo].[AuditCreate] on [dbo].[Product]
INSTEAD OF INSERT
as
begin 
 SET NOCOUNT ON;
 insert into Product
		([name]
      ,[category]
      ,[price]
      ,[detail]
	  	  ,[created]
      ,[createdDate]
	  ,[modyfity]
      ,[modyfityDate])
	  (select 
	  i.name
	  ,i.category
	  ,i.price
	  ,i.detail	 
	  ,SUSER_SNAME()
	  ,getdate()
	  ,i.modyfity
	  ,i.modyfityDate
	  
	  from
    inserted AS i)
end