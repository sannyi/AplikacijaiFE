<?php
    require 'phpMailer/PHPMailer-master/src/Exception.php';
    require 'phpMailer/PHPMailer-master/src/PHPMailer.php';
    require 'phpMailer/PHPMailer-master/src/SMTP.php';    

    $s=$_GET["sporocilo"];
    $n=$_GET["naslovnik"];
    $p=$_GET["posiljatelj"];
    $z=$_GET["zadeva"];
    //DEBUG OK
   
/*
DEPRECATED - šifriranja is ostale zadeve, uporabimo phpMailer

    $naslovnik=$_GET["naslovnik"];
    print_r(error_get_last());
    $posiljatelj=$_GET["posiljatelj"];
    print_r(error_get_last());
    $zadeva=$_GET["zadeva"]; 
    print_r(error_get_last());
    $sporocilo=$_GET["sporocilo"];
    print_r(error_get_last());
    $headers="To je testno sporocilo, ki jo je poslal uporabnik ".$posiljatelj." preko aplikacije iFE, ki ga pošilja Okeanos strežnik z";
    $headers=$headers."namescenim PHPjem: ".phpversion();
    print_r(error_get_last());
    $mail_delivered=mail($naslovnik,$zadeva,$sporocilo,$headers);
   print_r(error_get_last());
 if(!$mail_delivered)
    {
    print_r(error_get_last());
     echo "N/A";
     exit;
    }//
    echo "Mail uspešno poslan";/*/
    

    $mail = new PHPMailer(true);
    try {
     //Server settings
              $mail->SMTPDebug = 2;                                 // Enable verbose debug output
              $mail->isSMTP();                                      // Set mailer to use SMTP
              $mail->Host = 'smtp.gmail.com';                       // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                                         // Enable SMTP authentication
    $mail->Username = 'adrkv97@gmail.com';                   // SMTP username
    $mail->Password = 'geckoman12#';                                   // SMTP password
    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 465;                                    // TCP port to connect to

    //Recipients
    $mail->setFrom($p, 'Posiljatelj');
    $mail->addAddress($n, 'Joe User');     // Add a recipient
                  // Name is optional
//    $mail->addReplyTo($n, 'Information');
    //$mail->addCC('cc@example.com');
//    $mail->addBCC('bcc@example.com');

    //Content
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject =$z;
    $mail->Body    = "This is the HTML message body <b>".$s."!</b>";
    $mail->AltBody = $s;

    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
    }
    









?>