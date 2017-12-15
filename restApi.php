<?php
	setlocale(LC_ALL,"sl_SI.utf-8");
	$start_query=false;

	$tip =$_GET["tip"];

	if($tip =="zaposleni" || $tip=="student")
	{
 		$start_query=true;
	}
	if($start_query)
	{
		$link = mysqli_connect("127.0.0.1","sannyi97","ife2017","ife");
		if(!$link)
		{
			echo "Error: Ni se mogoce povezati z MariaDB bazo.".PHP_EOL;
			echo "Debug errno: ".mysqli_connect_errno().PHP_EOL;
			echo "Debug error: ".mysqli_connect_error().PHP_EOL;
			exit;
		}

		$rows = array();
		$sth=mysqli_query($link,"SELECT DISTINCT Z.ID AS ID, Z.Ime, Z.Priimek, REPLACE(REPLACE(REPLACE(LOWER(CONCAT(CONCAT(CONCAT(Z.Ime,'.',Z.Priimek)),'@fe.uni-lj.si')),'ž','z'),'č','c'),'š','s') AS Eposta, TZ.Opis AS TipZaposlenega, GU.Besedilo AS GovorilneUre, CONCAT('+386(0)1 4768',TEL.Cifra) AS Telefonska, P.Ime AS Prostor, CL.VlogaZaposlenega AS Vloga, LAB.Ime FROM zaposleni Z INNER JOIN zaposlenje ZJ ON Z.ID=ZJ.IDZaposlenega INNER JOIN lttipzaposlenega TZ ON ZJ.IDTipa=TZ.ID INNER JOIN govorilneure GU ON GU.IDZaposlenega=Z.ID INNER JOIN telefonska TEL ON TEL.IDZaposlenega=Z.ID INNER JOIN zaposlenprostor ZP ON ZP.IDZaposlen=Z.ID INNER JOIN ltprostor P ON ZP.IDProstor = P.ID INNER JOIN clanilaboratorija CL ON CL.IDZaposlenega=Z.ID INNER JOIN laboratorij LAB ON CL.IDLab=LAB.ID ");

		while($r = mysqli_fetch_array($sth))
		{
    	$rows[] = $r;
		}
			echo json_encode($rows);
			mysqli_close($link);
	}



?>
