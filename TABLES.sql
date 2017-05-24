--TABELA UNIVERZA -> podatki o Univerza (LJ, MB , primorska), v primeru, da bi se app uporabljal širše....
	CREATE TABLE UNIVERZA 
	(
	 ID_institucije INTEGER PRIMARY KEY  NOT NULL,
	 Naziv_institucije CHAR(50),
	 Naslov VARCHAR(40),
	 E-mail VARCHAR(50),
	 Telefon VARCHAR(20),
	 Fax VARCHAR(20)
	);

--TABELA FAKULTETA
	CREATE TABLE FAKULTETA
	(
	 ID_fakultete INTEGER PRIMARY KEY,
	 Naziv_fakultete CHAR(40) NOT NULL,
	 Naslov VARCHAR(40) NOT NULL,
	 Email VARCHAR(50) NOT NULL,
	 Telefon VARCHAR(20) NOT NULL,
	 Fax VARCHAR(20) NOT NULL,
	 Univeza INTEGER NOT NULL,
	 FOREIGN KEY(Univerza) REFERENCES UNIVERZA(ID_institucije)
	);



--TABELA ZAPOSLENI
	CREATE TABLE ZAPOSLENI
	(
	 IDosebja INTEGER PRIMARY KEY  NOT NULL,
	 Ime CHAR(25) NOT NULL,
	 Priimek CHAR(25) NOT NULL,
	 Delovno_mesto CHAR(25) NOT NULL,
	 Katedra CHAR(100) NOT NULL,
	 Laboratorij CHAR(50) NOT NULL, 
	 Številka_sobe VARCHAR(25) NOT NULL,
	 Telefon VARCHAR(20) NOT NULL,
	 E-pošta VARCHAR(35) NOT NULL,
	 Tajnica VARCHAR(20) NOT NULL,
	 Govorilne_ure TEXT NOT NULL,
	 Opis TEXT,
	 ID_fakultete INTEGER NOT NULL,
	 FOREIGN KEY(ID_fakultete) REFERENCES FAKULTETA(ID_fakultete)
	 );
	



--TABELA JEDILNIK

--MOJE OSEBJE


---TEMP TABELE: UNIVERZA,ZAPOSLENI

	