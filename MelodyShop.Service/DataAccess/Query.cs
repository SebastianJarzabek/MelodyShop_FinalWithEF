using System.Text;

namespace MelodyShop.Service.DataAccess
{
  public class Queries
  {
    private const string ProductListCommand = "EXEC GetAllProducts";

    private const string ProductCommand = "EXEC GetProduct";

    private const string AddProductCommand = "EXEC AddProduct";

    public string GetProduct()
    {
      return ProductCommand;
    }

    public string AddProduct(string[] items)
    {
      return BuildQuery(AddProductCommand, items);
    }

    public string GetProductList()
    {
      return ProductListCommand;
    }

    private string BuildQuery(string exec, string[] items)
    {
      var stb = new StringBuilder();
      stb.Append(exec + " ");
      foreach (var item in items)
      {
        stb.Append(" " + item + ",");
      }
      return stb.ToString();
    }
  }
}
