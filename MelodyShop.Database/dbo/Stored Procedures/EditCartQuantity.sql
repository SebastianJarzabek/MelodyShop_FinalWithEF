CREATE PROCEDURE EditCartQuantity @id int, @quantity int
AS
BEGIN
UPDATE [dbo].[Cart]
   SET [quantity] = @quantity
      
 WHERE id= @id

END