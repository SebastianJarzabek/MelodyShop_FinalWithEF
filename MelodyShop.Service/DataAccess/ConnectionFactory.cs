using System;
using System.Data.SqlClient;

namespace MelodyShop.Service.DataAccess
{
  public class ConnectionFactory
  {
    private string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=MelodyShop;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

    public SqlConnection CreateConnection()
    {
      try
      {
        var connection = new SqlConnection(ConnectionString);
        connection.Open();

        return connection;
      }
      catch (Exception ex)
      {
        throw new Exception("Wystąpił problem połączenia z bazą danych.", ex);
      }
    }
  }
}
