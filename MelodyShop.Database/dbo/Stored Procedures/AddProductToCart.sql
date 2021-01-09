CREATE PROCEDURE AddProductToCart @userId int, @productId int, @quantity int
AS
BEGIN
INSERT INTO [dbo].[Cart]
           ([userId]
           ,[productId]
           ,[quantity])
          
     VALUES
          (@userId , @productId , @quantity )

END