namespace ZaposleniREST_API.Migrations
{
    
    using System.Data.Entity.Migrations;
    
    internal sealed class Configuration : DbMigrationsConfiguration<ZaposleniREST_API.Models.ZaposleniREST_APIContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(ZaposleniREST_API.Models.ZaposleniREST_APIContext context)
        {
          
        }
    }
}
