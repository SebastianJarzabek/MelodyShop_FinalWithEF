-- This block of comments will not be included in
CREATE PROCEDURE GetAllProducts 
AS
BEGIN
	SELECT [id],[name],[category],[price],[detail] FROM[MelodyShop].[dbo].[Product]

END