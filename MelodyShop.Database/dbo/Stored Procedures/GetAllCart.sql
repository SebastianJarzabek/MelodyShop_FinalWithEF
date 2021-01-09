
CREATE PROCEDURE GetAllCart
as
begin
SELECT [id]
      ,[userId]
      ,[productId]
      ,[quantity]
  FROM [dbo].[Cart]

end