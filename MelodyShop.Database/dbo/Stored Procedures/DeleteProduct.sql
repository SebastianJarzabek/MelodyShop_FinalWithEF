

Create procedure DeleteProduct @name varchar(50), @category varchar(50), @price decimal(18,2)
as
Delete from [Product]
where
           [name] = @name and category=  @category and price =@price