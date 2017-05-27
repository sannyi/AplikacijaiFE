
using System.ComponentModel.DataAnnotations.Schema;


namespace ConnectToSqlServer.Models
{
    [Table("Skoda")]
    public class Skoda
    {
        
        public string Opis { get; set; }
        public string Lokacija { get; set;}
        public string PotDoSlikeSkode { get; set; }
        
        public int IDprijaviteljaSkode { get; set; }
    }
}