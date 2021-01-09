CREATE PROCEDURE DeleteFromCartByID @id int
AS
BEGIN
DELETE FROM [dbo].[Cart]
      WHERE  id = @id

END