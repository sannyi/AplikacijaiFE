namespace Aplikacija_iFE
{
    class Oseba
    {
        public int ID { get; set; }
        public string Ime { get; set; }
        public string Priimek { get; set; }
        public string Eposta { get; set; }
        public string Telefonska { get; set; }
        public string Naslov { get; set; }

    }
    class Zaposlen : Oseba
    {

        public string GovorilneUre { get; set; }
        public string Prostor { get; set; }
        public string Naziv { get; set; }
        public string TipZaposlenega { get; set; }
        public string Laboratorij { get; set; }
        public string Tajnica { get; set; }
        public string Vloga { get; set; }
    }

    class Student : Oseba
    {

        public string Password { get; }
    }
}
