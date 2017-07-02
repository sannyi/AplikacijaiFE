using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZaposleniREST_API.Models
{
    public class Zaposlen
    {

        public int ID { get; set; }
        public string Ime { get; set; }
        public string Priimek { get; set; }
        public string Eposta { get; set; }
        public string Telefonska { get; set; }
        public string GovorilneUre { get; set; }
        public string Prostor { get; set; }
        public string Naziv { get; set; }
        public string TipZaposlenega { get; set; }
        public string Laboratorij { get; set; }
        public string Tajnica { get; set; }
        public string Vloga { get; set; }

    }
}