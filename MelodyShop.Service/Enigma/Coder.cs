using System;
using System.Security.Cryptography;
using System.Text;

namespace MelodyShop.Service.Enigma
{
  public class Coder
  {

    private string key { get; } = "A!9HHhi%XjjYY4YP2@Nob009X";

    private string _login { get; set; }

    private string _password { get; set; }

    public Coder()
    {
      _login = string.Empty;
      _password = string.Empty;
    }

    public string[] Cryption(string login, string password, bool toEncrypt)
    {
      try
      {
        var accessTbl = new string[2];
        if (toEncrypt)
        {
          _login = Encrypt(login);
          _password = Encrypt(password);

          accessTbl[0] = _login;
          accessTbl[1] = _password;

          return accessTbl;
        }
        else
        {
          _login = Decrypt(login);
          _password = Decrypt(password);

          accessTbl[0] = _login;
          accessTbl[1] = _password;

          return accessTbl;
        }
      }
      catch (Exception ex)
      {
        throw new Exception("Enigma error." + ex);
      }
    }

    private string Encrypt(string stringToCode)
    {
      using (var md5 = new MD5CryptoServiceProvider())
      {
        using (var tdes = new TripleDESCryptoServiceProvider())
        {
          tdes.Key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
          tdes.Mode = CipherMode.ECB;
          tdes.Padding = PaddingMode.PKCS7;

          using (var transform = tdes.CreateEncryptor())
          {
            byte[] textBytes = UTF8Encoding.UTF8.GetBytes(stringToCode);
            byte[] bytes = transform.TransformFinalBlock(textBytes, 0, textBytes.Length);
            return Convert.ToBase64String(bytes, 0, bytes.Length);
          }
        }
      }
    }

    private string Decrypt(string cipher)
    {
      using (var md5 = new MD5CryptoServiceProvider())
      {
        using (var tdes = new TripleDESCryptoServiceProvider())
        {
          tdes.Key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
          tdes.Mode = CipherMode.ECB;
          tdes.Padding = PaddingMode.PKCS7;

          using (var transform = tdes.CreateDecryptor())
          {
            byte[] cipherBytes = Convert.FromBase64String(cipher);
            byte[] bytes = transform.TransformFinalBlock(cipherBytes, 0, cipherBytes.Length);
            return UTF8Encoding.UTF8.GetString(bytes);
          }
        }
      }
    }
  }
}
