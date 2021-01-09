-- This block of comments will not be included in
create PROCEDURE [dbo].[GetProduct] @name varchar(50), @category varchar(50), @price decimal(18,2)
AS
BEGIN
	SELECT [id],[name],[category],[price],[detail] FROM[MelodyShop].[dbo].[Product] where  [name] = @name and category=  @category and price =@price

END