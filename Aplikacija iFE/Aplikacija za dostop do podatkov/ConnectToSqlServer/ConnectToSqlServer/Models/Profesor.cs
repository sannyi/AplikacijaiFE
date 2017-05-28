using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ConnectToSqlServer.Models
{   [Table("Profesor")]
    public class Profesor
    {
        [Key]
        public string ID { get; set; }
        public string Ime { get; set; }
        public string Priimek { get; set; }
        public string Eposta { get; set;}
        public string GovorilneUre { get; set; }
        public string Prostor { get; set; }
        public string Naziv { get; set; }
        public string TipZaposlenega{ get; set;}
        public string Laboratorij { get; set; } 
        public string Tajnica { get; set; }
        public string Vloga { get; set; }
        public string Telefonska { get; set; }


    }
}