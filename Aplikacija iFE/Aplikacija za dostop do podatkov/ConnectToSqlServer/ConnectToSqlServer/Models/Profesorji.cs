
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ConnectToSqlServer.Models
{
    [Table("Profesorji")]
    public class Profesorji
    {
        [Key]
        public int ID { get; set; }
        public string Ime { get; set; }
        public string Priimek { get; set;}
            
    }
}