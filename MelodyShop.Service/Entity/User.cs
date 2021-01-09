using System.Text.RegularExpressions;

namespace MelodyShop.Service.Entity
{
  public class User
  {
    public int id { get; set; }

    public string login { get; set; }

    public string password { get; set; }

    public string name { get; set; }

    public string surname { get; set; }

    public string emali { get; set; }

    public string phoneNumber { get; set; }

    public string street { get; set; }

    public string houseNumber { get; set; }

    public string postalCode { get; set; }

    public string city { get; set; }

    public string country { get; set; }

    bool IsValidEmail(string email)
    {
      try
      {
        var mailAddress = new System.Net.Mail.MailAddress(email);
        return mailAddress.Address == email;
      }
      catch
      {
        return false;
      }
    }

    bool IsValidPhone(string PhoneNumber)
    {
      try
      {
        return Regex.Match(PhoneNumber, @"^(\+[0-9]{9})$").Success;
      }
      catch
      {
        return false;
      }
    }
  }
}
