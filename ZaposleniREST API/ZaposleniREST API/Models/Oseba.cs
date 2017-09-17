namespace ZaposleniREST_API.Models
{
    public class Student : Oseba
    {
        public Student(Oseba os, string Geslo)
        {
            ID = os.ID;
            Ime = os.Ime;
            Priimek = os.Priimek;
            Eposta = os.Eposta;
            this.Geslo = Geslo;
        }
        public string Naslov { get; set; }
        private string Geslo;
    }
    public class Oseba
    {
        public int ID { get; set; }
        public string Ime { get; set; }
        public string Priimek { get; set; }
        public string Eposta { get; set; }
    }
    public class Zaposlen : Oseba
    {

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