-- This block of comments will not be included in
create PROCEDURE [dbo].[GetProductByID] @id int
AS
BEGIN
	SELECT [id],[name],[category],[price],[detail] FROM[MelodyShop].[dbo].[Product] where id=@id

END