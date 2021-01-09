

Create procedure EditProductByID @id int,  @name varchar(50), @category varchar(50), @price decimal(18,2) , @detail varchar(max)
as
Update [Product]
set
	 [name] = @name , category=  @category , price =@price ,detail = @detail
where
     id = @id