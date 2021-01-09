create procedure AddProduct @name varchar(50), @category varchar(50), @price decimal(18,2), @detail varchar(max)
as
INSERT INTO [dbo].[Product]
           ([name]
           ,[category]
           ,[price]
           ,[detail])
           
     VALUES
          (@name,@category,@price,@detail)