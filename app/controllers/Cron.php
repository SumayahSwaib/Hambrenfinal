<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-12-01
 * Time: 14:43
 */
ini_set('max_execution_time', '0');
class Cron extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Products_model");
        $this->model("Mail_model");
        $this->model("Payments_model");
    }

    function send_payment_mails() {
        $data = $this->model->Products_model->Get_pending_confirmation_orders();
        if (empty($data))
            return false;
        foreach ($data as $item) {
            $this->model->Products_model->payment_confirmation_mail_sent($item['id']);
            $message = "<h4 style='font-size:18px'>Received Payment</h4>
                        <h4 style='color:#4d4d4d'>Hello <b> " .$item['names'] . ", your payment was successful and has been received by Boo Store.</b></h4>
                        <h1>UGX " . number_format($item['amount']) . "</h1>
                        <hr>
                        <table style='width: 95%; margin: auto; background: #f2f2f2; padding: 10px'>
                        <tr>
                        <td style='text-align: left'>Amount</td><td style='text-align: right'>" .  number_format($item['amount']) . " </td>
                     
                        </tr>
                                                
                        </table>
                        <h4>For details, login into your account <a href='//" . $this->server->server_name ."/profile/order'>here</a><br/><br/>THANK YOU FOR SHOPPING WITH US</h4>";
            $this->smarty->assign("message", $message);
            $message = $this->smarty->fetch("mail_templates/subscription.tpl");
            $this->model->Mail_model->send_mail($item['email'], $message, "Payment Receipt", "receipts@booo.store");
        }
        return true;
    }

    function send_welcome_mail() {
        $this->model("User_model");
        $data = $this->model->User_model->send_welcome_mail();
        if (empty($data))
            return false;
        foreach ($data as $item) {
            $this->model->User_model->update_users_welcome_mail($item['id']);
            $message = "<h4 style='font-size:18px'>Account creation successful</h4>
                        <h4 style='color:#4d4d4d'>Hello <b> " .$item['names'] . ", your account was successfully created.</b></h4>
                       
                        <hr>
                      
                        <h4>Update your profile to enjoy the best shopping experience <a href='//" . $this->server->server_name ."/profile/'>here</a><br/><br/>THANK YOU FOR SHOPPING WITH US</h4>";
            $this->smarty->assign("message", $message);
            $message = $this->smarty->fetch("mail_templates/subscription.tpl");
            $this->model->Mail_model->send_mail($item['email'], $message, "Welcome to Boo Store");
        }
    }

    function _payment_call_back() {
        $_json_request = file_get_contents("php://input");
        $json_request = json_decode($_json_request);
        $this->model->Mail_model->send_mail("boosted_api@boostedtechs.com", $_json_request, "API TEST MESSAGE");
        if ($json_request) {
            $this->model->Payments_model->confirm_payment($_json_request, $json_request->tx_ref, $json_request->status, $json_request->initiated_amount, $json_request->currency);
        }
    }

}