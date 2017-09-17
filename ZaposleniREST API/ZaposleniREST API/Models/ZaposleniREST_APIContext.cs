using System.Data.Entity;
namespace ZaposleniREST_API.Models
{
    public class ZaposleniREST_APIContext : DbContext
    {
        public ZaposleniREST_APIContext() : base("name=ZaposleniREST_APIContext")
        {
        }
        public DbSet<Zaposlen> Zaposlens { get; set; }
        public DbSet<Student> Students { get; set; }
    }
}
