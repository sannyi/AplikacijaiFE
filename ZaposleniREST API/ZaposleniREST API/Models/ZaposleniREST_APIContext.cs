using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ZaposleniREST_API.Models
{
    public class ZaposleniREST_APIContext : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public ZaposleniREST_APIContext() : base("name=ZaposleniREST_APIContext")
        {
        }

        public System.Data.Entity.DbSet<ZaposleniREST_API.Models.Zaposlen> Zaposlens { get; set; }
    }
}
