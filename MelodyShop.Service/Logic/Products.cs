using Dapper;
using MelodyShop.Service.DataAccess;
using MelodyShop.Service.Entity;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MelodyShop.Service.Logic
{
  public class Products
  {
    private List<Product> products { get; set; }
    private Queries queries;

    public Products()
    {
      queries = new Queries();
    }

    public List<Product> GetProduct(int id)
    {
      try
      {
        var query = queries.GetProduct();
        var connectionFactory = new ConnectionFactory();
        var connection = connectionFactory.CreateConnection();
        products = connection.Query<Product>(query).ToList();
        return products;
      }
      catch (Exception ex)
      {
        throw new Exception("It was problem in geting Product." + ex);
      }
    }

    public List<Product> GetProducts()
    {
      try
      {
        var query = queries.GetProductList();
        var connectionFactory = new ConnectionFactory();
        var connection = connectionFactory.CreateConnection();
        products = connection.Query<Product>(query).ToList();
        return products;
      }
      catch (Exception ex)
      {
        throw new Exception("It was problem in geting Products list." + ex);
      }
    }
  }
}
