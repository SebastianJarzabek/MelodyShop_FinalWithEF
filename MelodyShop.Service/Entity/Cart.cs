namespace MelodyShop.Service.Entity
{
  public class Cart
  {
    public User user { get; set; }

    public Product product { get; set; }

    public int quantity { get; set; }

    public bool IsValidQuantity(int quantity)
    {
      try
      {
        if (quantity > 0)
          return true;
        else
          return false;
      }
      catch
      {
        return false;
      }
    }
  }
}
