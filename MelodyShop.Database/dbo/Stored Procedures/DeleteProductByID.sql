

Create procedure DeleteProductByID  @id int
as
Delete from [Product]
where
           id= @id