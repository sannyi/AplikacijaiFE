using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.Http;
using System.Web.Http.Description;
using ZaposleniREST_API.Models;

namespace ZaposleniREST_API.Controllers
{
    public class StudentsController : ApiController
    {
        private ZaposleniREST_APIContext db = new ZaposleniREST_APIContext();
        private SqlCommand cmd;
        private DataTable dt;
        private SqlDataAdapter da;
        private Exception ex = new Exception();
        private SqlConnection   povezava = new SqlConnection("Data Source=83.212.126.172\\SQLEXPRESS;Initial Catalog=iFE;User id=sa;Password=iFE2016");
        
        private Student GetTheStudent(string credential, string type, string encrypted_password)
        {
           
            if (int.Parse(type) == 1)
            {
                cmd = new SqlCommand("SELECT FROM dbo.fnVpisna(@ID,@Password)");
                cmd.Parameters.AddWithValue("@ID", int.Parse(credential));
            }
            else
            { 
               cmd = new SqlCommand("SELECT FROM dbo.Email(@Email,@Password)");
               cmd.Parameters.AddWithValue("@Email", credential);     
            }
            cmd.Parameters.AddWithValue("@Password", AEStoSHA(encrypted_password).ToLower());
            cmd.CommandType = CommandType.Text;
            dt = new DataTable();
            Oseba s = new Oseba();
            da = new SqlDataAdapter();
            try
            {
                povezava.Open();
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    if(dr["Ime"].ToString()==null)
                                            return null;
                    s.ID = int.Parse(dr["ID"].ToString());
                    s.Ime = dr["Ime"].ToString();
                    s.Priimek = dr["Priimek"].ToString();
                    s.Eposta = dr["Eposta"].ToString();
            //      s.Telefonska = dr["Telefonska"].ToString();
              //    s.Naslov = dr["Naslov"].ToString();
                }
            }
            catch (Exception e)
            {
                ex = e;
            }
            finally
            {
                povezava.Close();
            }

        return new Student(s,encrypted_password);
    }
        private string AEStoSHA(string encrypted_password)
        {
            string decrypted_password;
            byte[] cipherBytes = Convert.FromBase64String(encrypted_password);
            using (Aes decryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes("E8CA77DA07CB749474775F5ADACFF45A771E16D2C7566544EF2AAE81BE1ADAAF", new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                decryptor.Key = pdb.GetBytes(32);
                decryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, decryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                         decrypted_password = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
                return decrypted_password.ToLower();
        }
        [ResponseType(typeof(Student))]
        public IHttpActionResult GetStudent(string credential, string type, string encrypted_password)
        {
            Student student = GetTheStudent( credential,  type,  encrypted_password);
            if (student == null)
                            return NotFound();
            return Ok(student);
        }

     
        protected override void Dispose(bool disposing)
        {
            if (disposing)
                            db.Dispose();
            base.Dispose(disposing);
        }

    }
}