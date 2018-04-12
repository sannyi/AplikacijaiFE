USE [iFE]
GO
/****** Object:  StoredProcedure [dbo].[povezi_prof_in_predmet]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[povezi_prof_in_predmet]
(
	@Priimek nvarchar(50),
	@Ime nvarchar(50),
	@Ime_predmeta nvarchar(100)
)
AS
BEGIN
	DECLARE @ID_prof int
	SELECT  dbo.dobi_id_profesorja(@Ime,@Priimek)
	DECLARE @ID_predmet smallint 
	
	SELECT @ID_predmet = ID FROM Predmet WHERE Ime=@Ime_predmeta

	INSERT INTO PedagogPredmet VALUES(@ID_prof,@ID_predmet)
END
GO
/****** Object:  StoredProcedure [dbo].[vstavi_e_posto]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[vstavi_e_posto]
(
	@Eposta char(30),
	@Ime nvarchar(50),
	@Priimek nvarchar(50)
)
AS
BEGIN
	DECLARE @ID int
		SELECT @ID = dbo.DobiIdZaposlenega(@Ime, @Priimek)
		INSERT INTO Email (EMail,IDZaposlenega) VALUES (@Eposta,@ID)
END
GO
/****** Object:  StoredProcedure [dbo].[vstavi_govorilne_ure]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
CREATE FUNCTION dbo.dobi_id_zaposlenega(
@Ime nvarchar(50),
@Priimek nvarchar(50)	
)
RETURNS INT AS
BEGIN
	DECLARE @ID int
		SET @ID =(SELECT ID FROM Zaposleni WHERE Ime=@Ime AND Priimek=@Priimek)
	RETURN @ID;
END

CREATE FUNCTION dbo.DobiIdProfesorja
(
	@Ime nvarchar(50),
	@Priimek nvarchar(50)
) RETURNS INT AS
BEGIN

	RETURN (SELECT ID FROM Zaposleni INNER JOIN ZaposlenJe ON Zaposleni.ID = ZaposlenJe.IDZaposlenega 
			WHERE Zaposleni.Ime=@Ime AND
			Zaposleni.Priimek=@Priimek AND
			ZaposlenJe.IDTipa<4)
END

CREATE PROCEDURE dbo.vstavi_prostor
(
	@ID smallint,
	@Ime char(10),
	@Stavba char(1),
	@Nadstropje char(1)
)
AS
BEGIN
	INSERT INTO ltProstor VALUES(@ID,@Ime,@Stavba,@Nadstropje)
END	

CREATE PROCEDURE dbo.vstavi_e_posto
(
	@Eposta char(30),
	@Ime nvarchar(50),
	@Priimek nvarchar(50)
)
AS
BEGIN
	DECLARE @ID int
		SELECT @ID = dbo.DobiIdZaposlenega(@Ime, @Priimek)
		INSERT INTO E_posta (Eposta,IDZaposlenega) VALUES (@Eposta,@ID)
END
*/
CREATE PROCEDURE [dbo].[vstavi_govorilne_ure]
(	
	@Ime nvarchar(50),
	@Priimek nvarchar(50),
	@Besedilo text
)
AS
BEGIN
	DECLARE @ID int SET @ID =dbo.DobiIdZaposlenega(@Ime,@Priimek)
			
			INSERT INTO [Govorilne ure](Besedilo,IDZaposlenega) VALUES (@Besedilo,@ID)
END
		
GO
/****** Object:  StoredProcedure [dbo].[vstavi_prostor]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
CREATE FUNCTION dbo.dobi_id_zaposlenega(
@Ime nvarchar(50),
@Priimek nvarchar(50)	
)
RETURNS INT AS
BEGIN
	DECLARE @ID int
		SET @ID =(SELECT ID FROM Zaposleni WHERE Ime=@Ime AND Priimek=@Priimek)
	RETURN @ID;
END

CREATE FUNCTION dbo.dobi_id_profesorja
(
	@Ime nvarchar(50),
	@Priimek nvarchar(50)
) RETURNS INT AS
BEGIN

	RETURN (SELECT ID FROM Zaposleni INNER JOIN ZaposlenJe ON Zaposleni.ID = ZaposlenJe.IDZaposlenega 
			WHERE Zaposleni.Ime=@Ime AND
			Zaposleni.Priimek=@Priimek AND
			ZaposlenJe.IDTipa<4)
END
*/
CREATE PROCEDURE [dbo].[vstavi_prostor]
(
	@ID smallint,
	@Ime char(10),
	@Stavba char(1),
	@Nadstropje char(1)
)
AS
BEGIN
	INSERT INTO ltProstor VALUES(@ID,@Ime,@Stavba,@Nadstropje)
END	
GO
/****** Object:  UserDefinedFunction [dbo].[dobi_id_profesorja]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[dobi_id_profesorja]
(
	@Ime nvarchar(50),
	@Priimek nvarchar(50)
) RETURNS INT AS
BEGIN

	RETURN (SELECT ID FROM Zaposleni INNER JOIN ZaposlenJe ON Zaposleni.ID = ZaposlenJe.IDZaposlenega 
			WHERE Zaposleni.Ime=@Ime AND
			Zaposleni.Priimek=@Priimek AND
			ZaposlenJe.IDTipa<4)
END
GO
/****** Object:  UserDefinedFunction [dbo].[dobi_id_zaposlenega]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[dobi_id_zaposlenega](
@Ime nvarchar(50),
@Priimek nvarchar(50)	
)
RETURNS INT AS
BEGIN
	DECLARE @ID int
		SET @ID =(SELECT ID FROM Zaposleni WHERE Ime=@Ime AND Priimek=@Priimek)
	RETURN @ID;
END
GO
/****** Object:  Table [dbo].[Dogodek]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dogodek](
	[ID] [int] NOT NULL,
	[Ime] [varchar](100) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[OpisDogodka] [text] NOT NULL,
	[Lokacija] [varchar](50) NOT NULL,
	[Link] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Dogodek] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Email]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Email](
	[EMail] [char](30) NOT NULL,
	[IDZaposlenega] [int] NOT NULL,
 CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
(
	[EMail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Govorilne ure]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Govorilne ure](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Besedilo] [text] NOT NULL,
	[IDZaposlenega] [int] NOT NULL,
 CONSTRAINT [PK_Govorilne ure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Izpit]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Izpit](
	[ID] [int] NOT NULL,
	[Datum] [date] NOT NULL,
	[Ura] [time](7) NULL,
	[IDTipIzpita] [char](2) NOT NULL,
	[Polaganje] [tinyint] NOT NULL,
 CONSTRAINT [PK_Izpit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IzpitStudent]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IzpitStudent](
	[IDStudent] [int] NOT NULL,
	[IDIzpit] [int] NOT NULL,
	[Tocke] [tinyint] NULL,
	[Ocena] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Jed]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jed](
	[ID] [int] NOT NULL,
	[IDTipJedi] [int] NOT NULL,
	[Opis] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Katedra]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Katedra](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](65) NOT NULL,
	[Opis] [text] NOT NULL,
 CONSTRAINT [PK_Katedra] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Laboratorij]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Laboratorij](
	[ID] [int] NOT NULL,
	[Ime] [varchar](85) NOT NULL,
	[Akronim] [varchar](10) NOT NULL,
	[Opis] [text] NOT NULL,
	[VodjaID] [int] NOT NULL,
	[IDKaterdre] [int] NOT NULL,
 CONSTRAINT [PK_Laboratorij] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ltNazivi]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ltNazivi](
	[ID] [tinyint] NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ltNazivi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ltProgram]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ltProgram](
	[ID] [int] NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Stopnja] [tinyint] NULL,
	[Tip] [nvarchar](15) NULL,
 CONSTRAINT [PK_ltProgram] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ltProstor]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ltProstor](
	[ID] [smallint] NOT NULL,
	[Ime] [char](10) NOT NULL,
	[Stavba] [char](1) NOT NULL,
	[Nadstropje] [char](1) NOT NULL,
 CONSTRAINT [PK_ltProstor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ltSemester]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ltSemester](
	[ID] [int] NOT NULL,
	[Ime] [varchar](10) NOT NULL,
	[ZacetniDatum] [date] NOT NULL,
	[ZakljucniDatum] [date] NOT NULL,
 CONSTRAINT [PK_ltSemester] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ltSteber]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ltSteber](
	[ID] [nchar](10) NOT NULL,
	[Opis] [nvarchar](25) NULL,
 CONSTRAINT [PK_ltSteber] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ltTipIzpit]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ltTipIzpit](
	[ID] [char](2) NOT NULL,
	[Opis] [nchar](25) NOT NULL,
 CONSTRAINT [PK_ltTipIzpit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ltTipJedi]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ltTipJedi](
	[ID] [int] NOT NULL,
	[Tip] [varchar](15) NOT NULL,
 CONSTRAINT [PK_ltTipJedi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ltTipZaposlenega]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ltTipZaposlenega](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Opis] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ltTipZaposlenega] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Odzivi]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odzivi](
	[ID] [int] NOT NULL,
	[Komentar] [text] NOT NULL,
	[Datum] [datetime] NOT NULL,
 CONSTRAINT [PK_Odzivi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OstaleSluzbe]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OstaleSluzbe](
	[ID] [int] NOT NULL,
	[Ime] [varchar](25) NULL,
	[Priimek] [varchar](40) NULL,
	[Telefon] [char](5) NULL,
	[Mail] [varchar](70) NULL,
	[IDTipZaposlenega] [int] NULL,
	[Naziv] [nchar](20) NULL,
	[IDProstor] [int] NULL,
 CONSTRAINT [PK_OstaleSluzbe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OstaliClaniLaboratorija]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OstaliClaniLaboratorija](
	[IDLab] [int] NOT NULL,
	[IDZaposlenega] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedagogi]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedagogi](
	[ID] [int] NOT NULL,
	[Ime] [varchar](25) NOT NULL,
	[Priimek] [varchar](40) NOT NULL,
	[Telefon] [char](5) NOT NULL,
	[Mail] [varchar](70) NOT NULL,
	[IDTipZaposlenega] [int] NOT NULL,
	[Naziv] [nchar](20) NULL,
	[IDProstor] [int] NULL,
 CONSTRAINT [PK_Pedagogi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedagogPredmet]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedagogPredmet](
	[IDPedagog] [int] NOT NULL,
	[IDPredmet] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Predmet]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Predmet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](100) NOT NULL,
	[Akronim] [varchar](15) NOT NULL,
	[KreditneTocke] [tinyint] NOT NULL,
	[Letnik] [char](1) NOT NULL,
	[IDSteber] [nchar](10) NOT NULL,
	[Predavanja] [tinyint] NOT NULL,
	[LaboratorijskeVaje] [tinyint] NOT NULL,
	[AvditorneVaje] [tinyint] NOT NULL,
	[IDSemestra] [char](1) NOT NULL,
 CONSTRAINT [PK_Predmet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PredmetIzpit]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PredmetIzpit](
	[IDPredmeta] [int] NOT NULL,
	[IDIzpita] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PredmetSmer]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PredmetSmer](
	[IDPredmet] [int] NOT NULL,
	[IDSmer] [int] NOT NULL,
	[Letnik] [varchar](10) NOT NULL,
	[IDSemester] [int] NOT NULL,
	[Tip] [nchar](5) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Raziskovalci]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raziskovalci](
	[IDRaziskovalca] [tinyint] NOT NULL,
	[ID_Zaposlena] [int] NULL,
 CONSTRAINT [PK_Raziskovalci] PRIMARY KEY CLUSTERED 
(
	[IDRaziskovalca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skoda]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Skoda](
	[ID] [int] NOT NULL,
	[Opis] [text] NOT NULL,
	[Lokacija] [varchar](50) NOT NULL,
	[PotDoSlikeSkode] [text] NOT NULL,
	[DatumObvestila] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[PredvideDatumOdpravitveSkode] [datetime] NULL,
	[CenaPopravila] [numeric](18, 0) NULL,
	[IDPrijavitelja] [int] NULL,
	[IDVzdrzevalca] [int] NULL,
 CONSTRAINT [PK_Skoda] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Smer]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smer](
	[ID] [int] NOT NULL,
	[IDProgram] [int] NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Akronim] [nvarchar](10) NOT NULL,
	[Naziv] [nvarchar](100) NULL,
	[AkronimNaziva] [nvarchar](50) NULL,
 CONSTRAINT [PK_Smer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SmerStudent]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SmerStudent](
	[IDSmer] [int] NOT NULL,
	[IDStudent] [int] NOT NULL,
	[Letnik] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] NOT NULL,
	[Ime] [varchar](25) NOT NULL,
	[Priimek] [varchar](40) NOT NULL,
	[StudentskiMail] [varchar](6) NOT NULL,
	[Password] [char](40) NOT NULL,
	[SteviloPrijavBrezCertifikata] [tinyint] NOT NULL,
	[Telefon] [char](15) NOT NULL,
	[DomaciNaslov] [varchar](45) NOT NULL,
	[DomacaPostnaStevilka] [smallint] NOT NULL,
	[IDProgram] [int] NOT NULL,
	[IDSmer] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TehnicnaPodpora]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TehnicnaPodpora](
	[ID] [int] NOT NULL,
	[Ime] [varchar](25) NOT NULL,
	[Priimek] [varchar](40) NOT NULL,
	[Telefon] [char](5) NOT NULL,
	[Mail] [varchar](70) NOT NULL,
	[IDTipZaposlenega] [int] NOT NULL,
	[Naziv] [nchar](20) NULL,
	[IDProstor] [int] NULL,
 CONSTRAINT [PK_TehnicnaPodpora] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Telefonska]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Telefonska](
	[ID] [char](3) NOT NULL,
	[Tip] [char](7) NOT NULL,
	[IDZaposlenega] [int] NOT NULL,
 CONSTRAINT [PK_Telefonska] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TelefonskaZaposlenega]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TelefonskaZaposlenega](
	[IDZaposlenega] [int] NULL,
	[IDTelefonske] [char](3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VodstvoInPodpora]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VodstvoInPodpora](
	[ID] [int] NOT NULL,
	[Ime] [varchar](25) NOT NULL,
	[Priimek] [varchar](40) NOT NULL,
	[Telefon] [char](5) NOT NULL,
	[Mail] [varchar](70) NOT NULL,
	[IDTipZaposlenega] [int] NOT NULL,
	[Naziv] [nchar](20) NULL,
	[IDProstor] [int] NULL,
 CONSTRAINT [PK_VodstvoInPodpora] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zaposleni]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposleni](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Priimek] [nvarchar](50) NOT NULL,
	[IDNaziva] [tinyint] NOT NULL,
 CONSTRAINT [PK_Zaposleni] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZaposlenJe]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZaposlenJe](
	[IDZaposlenega] [int] NOT NULL,
	[IDTipa] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZaposlenProstor]    Script Date: 17.05.2017 19:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZaposlenProstor](
	[IDZaposlen] [int] NOT NULL,
	[IDProstor] [smallint] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Govorilne ure] ADD  CONSTRAINT [DF_Govorilne ure_]  DEFAULT ('Z zaposlenim se lahko glede govorilnih ur zmenite po e-pošti.') FOR [Besedilo]
GO
ALTER TABLE [dbo].[Katedra] ADD  CONSTRAINT [DF_Katedra_Opis]  DEFAULT ('Lorem Ipsum') FOR [Opis]
GO
ALTER TABLE [dbo].[Predmet] ADD  CONSTRAINT [DF_Predmet_Predavanja]  DEFAULT ((45)) FOR [Predavanja]
GO
ALTER TABLE [dbo].[Predmet] ADD  CONSTRAINT [DF_Predmet_LaboratorijskeVaje]  DEFAULT ((30)) FOR [LaboratorijskeVaje]
GO
ALTER TABLE [dbo].[Predmet] ADD  CONSTRAINT [DF_Predmet_AvditorneVaje]  DEFAULT ((15)) FOR [AvditorneVaje]
GO
ALTER TABLE [dbo].[Skoda] ADD  CONSTRAINT [DF_Skoda_Status]  DEFAULT ('Obve') FOR [Status]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_SteviloPrijavBrezCertifikata]  DEFAULT ((100)) FOR [SteviloPrijavBrezCertifikata]
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [FK_Email_Zaposleni] FOREIGN KEY([IDZaposlenega])
REFERENCES [dbo].[Zaposleni] ([ID])
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [FK_Email_Zaposleni]
GO
ALTER TABLE [dbo].[Govorilne ure]  WITH CHECK ADD  CONSTRAINT [FK_Govorilne ure_Zaposleni] FOREIGN KEY([IDZaposlenega])
REFERENCES [dbo].[Zaposleni] ([ID])
GO
ALTER TABLE [dbo].[Govorilne ure] CHECK CONSTRAINT [FK_Govorilne ure_Zaposleni]
GO
ALTER TABLE [dbo].[Izpit]  WITH CHECK ADD  CONSTRAINT [IDTipIzpita -> ID (ltTipIzpit)] FOREIGN KEY([IDTipIzpita])
REFERENCES [dbo].[ltTipIzpit] ([ID])
GO
ALTER TABLE [dbo].[Izpit] CHECK CONSTRAINT [IDTipIzpita -> ID (ltTipIzpit)]
GO
ALTER TABLE [dbo].[IzpitStudent]  WITH CHECK ADD  CONSTRAINT [IDIzpita -> ID (Izpit)] FOREIGN KEY([IDIzpit])
REFERENCES [dbo].[Izpit] ([ID])
GO
ALTER TABLE [dbo].[IzpitStudent] CHECK CONSTRAINT [IDIzpita -> ID (Izpit)]
GO
ALTER TABLE [dbo].[IzpitStudent]  WITH CHECK ADD  CONSTRAINT [IDStudenta -> ID (Student)] FOREIGN KEY([IDStudent])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[IzpitStudent] CHECK CONSTRAINT [IDStudenta -> ID (Student)]
GO
ALTER TABLE [dbo].[Laboratorij]  WITH CHECK ADD  CONSTRAINT [FK_Laboratorij_Katedra] FOREIGN KEY([IDKaterdre])
REFERENCES [dbo].[Katedra] ([ID])
GO
ALTER TABLE [dbo].[Laboratorij] CHECK CONSTRAINT [FK_Laboratorij_Katedra]
GO
ALTER TABLE [dbo].[Laboratorij]  WITH CHECK ADD  CONSTRAINT [FK_Laboratorij_Zaposleni] FOREIGN KEY([VodjaID])
REFERENCES [dbo].[Zaposleni] ([ID])
GO
ALTER TABLE [dbo].[Laboratorij] CHECK CONSTRAINT [FK_Laboratorij_Zaposleni]
GO
ALTER TABLE [dbo].[OstaliClaniLaboratorija]  WITH CHECK ADD  CONSTRAINT [FK_OstaliClaniLaboratorija_Laboratorij] FOREIGN KEY([IDLab])
REFERENCES [dbo].[Laboratorij] ([ID])
GO
ALTER TABLE [dbo].[OstaliClaniLaboratorija] CHECK CONSTRAINT [FK_OstaliClaniLaboratorija_Laboratorij]
GO
ALTER TABLE [dbo].[OstaliClaniLaboratorija]  WITH CHECK ADD  CONSTRAINT [FK_OstaliClaniLaboratorija_Zaposleni] FOREIGN KEY([IDZaposlenega])
REFERENCES [dbo].[Zaposleni] ([ID])
GO
ALTER TABLE [dbo].[OstaliClaniLaboratorija] CHECK CONSTRAINT [FK_OstaliClaniLaboratorija_Zaposleni]
GO
ALTER TABLE [dbo].[PedagogPredmet]  WITH CHECK ADD  CONSTRAINT [FK_PedagogPredmet_Zaposleni] FOREIGN KEY([IDPredmet])
REFERENCES [dbo].[Zaposleni] ([ID])
GO
ALTER TABLE [dbo].[PedagogPredmet] CHECK CONSTRAINT [FK_PedagogPredmet_Zaposleni]
GO
ALTER TABLE [dbo].[PedagogPredmet]  WITH CHECK ADD  CONSTRAINT [IDPremeta -> ID (Predmet)] FOREIGN KEY([IDPredmet])
REFERENCES [dbo].[Predmet] ([ID])
GO
ALTER TABLE [dbo].[PedagogPredmet] CHECK CONSTRAINT [IDPremeta -> ID (Predmet)]
GO
ALTER TABLE [dbo].[Predmet]  WITH CHECK ADD  CONSTRAINT [IDSteber -> ID (ltSteber)] FOREIGN KEY([IDSteber])
REFERENCES [dbo].[ltSteber] ([ID])
GO
ALTER TABLE [dbo].[Predmet] CHECK CONSTRAINT [IDSteber -> ID (ltSteber)]
GO
ALTER TABLE [dbo].[PredmetIzpit]  WITH CHECK ADD  CONSTRAINT [IDIzpit -> ID (Izpit)] FOREIGN KEY([IDIzpita])
REFERENCES [dbo].[Izpit] ([ID])
GO
ALTER TABLE [dbo].[PredmetIzpit] CHECK CONSTRAINT [IDIzpit -> ID (Izpit)]
GO
ALTER TABLE [dbo].[PredmetIzpit]  WITH CHECK ADD  CONSTRAINT [IDPredmeta -> ID (Predmet)] FOREIGN KEY([IDPredmeta])
REFERENCES [dbo].[Predmet] ([ID])
GO
ALTER TABLE [dbo].[PredmetIzpit] CHECK CONSTRAINT [IDPredmeta -> ID (Predmet)]
GO
ALTER TABLE [dbo].[PredmetSmer]  WITH CHECK ADD  CONSTRAINT [FK_PredmetSmer_Smer] FOREIGN KEY([IDSmer])
REFERENCES [dbo].[Smer] ([ID])
GO
ALTER TABLE [dbo].[PredmetSmer] CHECK CONSTRAINT [FK_PredmetSmer_Smer]
GO
ALTER TABLE [dbo].[PredmetSmer]  WITH CHECK ADD  CONSTRAINT [ID -> ID(Semester)] FOREIGN KEY([IDSemester])
REFERENCES [dbo].[ltSemester] ([ID])
GO
ALTER TABLE [dbo].[PredmetSmer] CHECK CONSTRAINT [ID -> ID(Semester)]
GO
ALTER TABLE [dbo].[PredmetSmer]  WITH CHECK ADD  CONSTRAINT [IDPredmet -> ID (Predmet)] FOREIGN KEY([IDPredmet])
REFERENCES [dbo].[Predmet] ([ID])
GO
ALTER TABLE [dbo].[PredmetSmer] CHECK CONSTRAINT [IDPredmet -> ID (Predmet)]
GO
ALTER TABLE [dbo].[Smer]  WITH CHECK ADD  CONSTRAINT [FK_Smer_ltProgram] FOREIGN KEY([IDProgram])
REFERENCES [dbo].[ltProgram] ([ID])
GO
ALTER TABLE [dbo].[Smer] CHECK CONSTRAINT [FK_Smer_ltProgram]
GO
ALTER TABLE [dbo].[SmerStudent]  WITH CHECK ADD  CONSTRAINT [IDStudent -> ID (Student)] FOREIGN KEY([IDStudent])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[SmerStudent] CHECK CONSTRAINT [IDStudent -> ID (Student)]
GO
ALTER TABLE [dbo].[Telefonska]  WITH CHECK ADD  CONSTRAINT [FK_Telefonska_Zaposleni] FOREIGN KEY([IDZaposlenega])
REFERENCES [dbo].[Zaposleni] ([ID])
GO
ALTER TABLE [dbo].[Telefonska] CHECK CONSTRAINT [FK_Telefonska_Zaposleni]
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [FK_Zaposleni_ltNazivi] FOREIGN KEY([IDNaziva])
REFERENCES [dbo].[ltNazivi] ([ID])
GO
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [FK_Zaposleni_ltNazivi]
GO
ALTER TABLE [dbo].[ZaposlenJe]  WITH CHECK ADD  CONSTRAINT [FK_ZaposlenJe_ltTipZaposlenega] FOREIGN KEY([IDTipa])
REFERENCES [dbo].[ltTipZaposlenega] ([ID])
GO
ALTER TABLE [dbo].[ZaposlenJe] CHECK CONSTRAINT [FK_ZaposlenJe_ltTipZaposlenega]
GO
ALTER TABLE [dbo].[ZaposlenJe]  WITH CHECK ADD  CONSTRAINT [FK_ZaposlenJe_Zaposleni] FOREIGN KEY([IDZaposlenega])
REFERENCES [dbo].[Zaposleni] ([ID])
GO
ALTER TABLE [dbo].[ZaposlenJe] CHECK CONSTRAINT [FK_ZaposlenJe_Zaposleni]
GO
ALTER TABLE [dbo].[ZaposlenProstor]  WITH CHECK ADD  CONSTRAINT [FK_ZaposlenProstor_Zaposleni] FOREIGN KEY([IDZaposlen])
REFERENCES [dbo].[Zaposleni] ([ID])
GO
ALTER TABLE [dbo].[ZaposlenProstor] CHECK CONSTRAINT [FK_ZaposlenProstor_Zaposleni]
GO
ALTER TABLE [dbo].[ZaposlenProstor]  WITH CHECK ADD  CONSTRAINT [IDProstor -> ID (Prostor)] FOREIGN KEY([IDProstor])
REFERENCES [dbo].[ltProstor] ([ID])
GO
ALTER TABLE [dbo].[ZaposlenProstor] CHECK CONSTRAINT [IDProstor -> ID (Prostor)]
GO
