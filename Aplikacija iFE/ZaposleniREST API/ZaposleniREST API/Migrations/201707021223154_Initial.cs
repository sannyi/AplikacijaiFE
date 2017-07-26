namespace ZaposleniREST_API.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Zaposlens",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Ime = c.String(),
                        Priimek = c.String(),
                        Eposta = c.String(),
                        Telefonska = c.String(),
                        GovorilneUre = c.String(),
                        Prostor = c.String(),
                        Naziv = c.String(),
                        TipZaposlenega = c.String(),
                        Laboratorij = c.String(),
                        Tajnica = c.String(),
                        Vloga = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Zaposlens");
        }
    }
}
