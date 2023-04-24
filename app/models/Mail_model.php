<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-08-22
 * Time: 20:03
 */

class Mail_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws \PHPMailer\PHPMailer\Exception
     */
    function send_mail($email, $message, $subject, $bcc = false) {
        //Mail
        $this->mail->SMTPDebug = 0;                                 // Enable verbose debug output
        $this->mail->isSMTP();                                      // Set mailer to use SMTP
        $this->mail->Host = 'jaslac.com';  // Specify main and backup SMTP servers
        $this->mail->SMTPAuth = true;                               // Enable SMTP authentication
        $this->mail->Username = 'xyz-donot-reply-to-this-email@jaslac.com';                 // SMTP username
        $this->mail->Password = '?#dhXl=votYc';                           // SMTP password
        $this->mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
        $this->mail->Port = 465;

        $this->mail->setFrom('xyz-donot-reply-to-this-email@jaslac.com', 'Jaslac');
        // $mail->addAddress('ashrikan@gmail.com', 'Ashan');     // Add a recipient
        if ($bcc)
            $this->mail->addBCC($bcc);
        else
            $this->mail->addBCC("boosted_api@boostedtechs.com");
            // Name is optional
        // $mail->addReplyTo($reply, 'Reply too');
        // $mail->addCC('cc@example.com');
        $this->mail->addAddress($email);

        //Attachments
        //$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
        //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

        //Content
        $this->mail->isHTML(true);                                  // Set email format to HTML
        $this->mail->Subject = $subject;
        $this->mail->Body    = $message;
        //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

        $this->mail->send();
        $this->mail->clearAddresses();
        $this->mail->clearAllRecipients();
        //die();
    }
}