﻿namespace Aplikacija_iFE
{
    #region OSEBE
    class Oseba
    {
        public int ID { get; set; }
        public string Ime { get; set; }
        public string Priimek { get; set; }
        public string Eposta { get; set; }
        public string Telefonska { get; set; }
     


    }
    class Zaposlen : Oseba
    {

        public string GovorilneUre { get; set; }
        public string Prostor { get; set; }
        public string TipZaposlenega { get; set; }
        public string Laboratorij { get; set; } 
        public string Vloga { get; set; }
    }

    class Student : Oseba
    {
        public Student(int ID, string Ime,string Priimek,string Eposta,string Telefonska/*,string DomaciNaslov,int Posta*/,string Password)
        {
            Telefonska = Telefonska.Substring(1);
            this.Password = Password;
            this.ID = ID; this.Ime = Ime; this.Priimek=Priimek; this.Eposta = Eposta; this.Telefonska = "+386" + Telefonska; /*this.DomaciNaslov = DomaciNaslov; this.Posta = Posta;*/
        }
        private string Password { get; }
        // //  public string DomaciNaslov { get; set; }
        // public int Posta { get; set; }
    }
    #endregion
    #region MENI
    class Menu
    {
        public Menu(){}
        public Menu(string naslov,string juha,string glavnajed,string sladica,string tip)
        {
            Naslov = naslov;
            Juha = juha;
            GlavnaJed = glavnajed;
            Tip = tip;
            Sladica = sladica;

        }
           
        
            
        public string Naslov { get; set; }
        public string Juha { get; set; }
        public string GlavnaJed { get; set;}
        public string Sladica { get; set; }
        public string Tip { get; set; }        

    }

    
    #endregion
}
