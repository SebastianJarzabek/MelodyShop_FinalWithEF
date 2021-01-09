CREATE PROCEDURE GetAllUserProductsFromCart @userId int, @productId int, @quantity int
AS
BEGIN SELECT [id]
      ,[userId]
      ,[productId]
      ,[quantity]
      ,[modyfity]
      ,[modyfityDate]
      ,[created]
      ,[createdDate]
  FROM [dbo].[Cart]
  where userId = @userId
END