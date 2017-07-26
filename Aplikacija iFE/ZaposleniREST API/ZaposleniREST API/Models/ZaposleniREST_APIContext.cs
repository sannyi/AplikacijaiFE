
using System.Data.Entity;


namespace ZaposleniREST_API.Models
{
    public class ZaposleniREST_APIContext : DbContext
    {
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public ZaposleniREST_APIContext() : base("name=ZaposleniREST_APIContext")
        {
        }

        public DbSet<ZaposleniREST_API.Models.Zaposlen> Zaposlens { get; set; }
    }
}
