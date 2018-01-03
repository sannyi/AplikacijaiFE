<?php
//HEADER


//SUPPORT  FUNCTIONS
    function CountItems($link,$query)
    {

     //_DEBUG  printf("Result set has %d rows.\n", mysqli_num_rows(mysqli_query($link,$query)));
    return mysqli_num_rows(mysqli_query($link,$query));
    }




//SCRIPT
    $tip =$_GET["tip"];
    $encryption_req=false;
    $link = mysqli_connect("127.0.0.1","sannyi97","ife2017","ife");

    if(!$link)
    {
        echo "Error: Ni se mogoce povezati z MariaDB bazo.".PHP_EOL;
        echo "Debug errno: ".mysqli_connect_errno().PHP_EOL;
        echo "Debug error: ".mysqli_connect_error().PHP_EOL;
        exit;
    }


    if($tip=="zaposleni")
    {
      $queryLinkAndText=mysqli_query($link,"SELECT DISTINCT Z.ID AS ID, Z.Ime AS Ime, Z.Priimek AS Priimek, REPLACE(REPLACE(REPLACE(LOWER(CONCAT(CONCAT(CONCAT(Z.Ime,'.',Z.Priimek)),'@fe.uni-lj.si')),'ž','z'),'č','c'),'š','s') AS Eposta, TZ.Opis AS TipZaposlenega, GU.Besedilo AS GovorilneUre, CONCAT('+3861 4768',TEL.Cifra) AS Telefonska, P.Ime AS Prostor, CL.VlogaZaposlenega AS Vloga, LAB.Ime FROM zaposleni Z INNER JOIN zaposlenje ZJ ON Z.ID=ZJ.IDZaposlenega INNER JOIN lttipzaposlenega TZ ON ZJ.IDTipa=TZ.ID INNER JOIN govorilneure GU ON GU.IDZaposlenega=Z.ID INNER JOIN telefonska TEL ON TEL.IDZaposlenega=Z.ID INNER JOIN zaposlenprostor ZP ON ZP.IDZaposlen=Z.ID INNER JOIN ltprostor P ON ZP.IDProstor = P.ID INNER JOIN clanilaboratorija CL ON CL.IDZaposlenega=Z.ID INNER JOIN laboratorij LAB ON CL.IDLab=LAB.ID ORDER BY ID, Z.Priimek, Z.Ime"
      );
    }
    if($tip=="student")
    {
            $id = $_GET["id"];
            $password=$_GET["password"];

            if(CountItems($link,"SELECT COUNT(*) FROM student WHERE ID='$id' AND Geslo='$password'")==1)
            {
              $queryLinkAndText=mysqli_query($link,"SELECT ID, Ime, Priimek, Geslo, CONCAT(  SUBSTRING(  LOWER(Ime),-CHAR_LENGTH(Ime),1),  SUBSTRING(  LOWER(Priimek),-CHAR_LENGTH(Priimek),1),  StudentskiMail,    '@student.uni-lj.si')
    As Email, Telefon, DomaciNaslov, DomacaPostnaStevilka FROM `student` WHERE ID='$id' AND Geslo='$password'" );
        //$encryption_req=true;
            }
    }

    $rows = array();
    while($row = mysqli_fetch_assoc($queryLinkAndText))
    {
        $rows[]=$row;
    }

    if($encryption_req)
    {
        $password="a_Password_for_data_3ncrypt10n$";
        $method="aes-256-cbc";
        $password=substr(hash('sha256', $password,true),0,32);

        $iv = chr(0x6) . chr(0x2) . chr(0xe) . chr(0x5) . chr(0x4) . chr(0x0) . chr(0x0) . chr(0x8) . chr(0xfe) . chr(0xd) . chr(0x3) . chr(0x9) . chr(0x1) . chr(0xc) . chr(0xa) . chr(0xf);


    }
  if(empty($rows))
  {
      echo "N/A";
  }
  else
  {
    echo json_encode($rows,JSON_UNESCAPED_UNICODE);
  }

  mysqli_close($link);
?>
