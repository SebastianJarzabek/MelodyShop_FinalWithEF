
CREATE PROCEDURE GetAllCartByUserID @userId int
as
begin
SELECT [id]
      ,[userId]
      ,[productId]
      ,[quantity]
  FROM [dbo].[Cart]
  Where userId=@userId
end