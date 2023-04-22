<?php
/**
 * Created by PhpStorm.
 * User: Rickie
 * Date: 2020-10-04
 * Time: 17:02
 */

class Auth extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
    }

    function index() {
        $data = [
            "email" => trim($this->input->post("email")),
            "password" => trim($this->input->post("password"))];
        $token = hash("md5", (time() . mt_rand(1000, 59999) . $data['email']));
        $response = $this->model->User_model->update_user_data($data, $token, true);

        if (empty($response))
            $this->redirect("//" . $this->server->server_name . "/login?error=" . str_replace(" ", "%20", "Password or Email don't match. Try again"));
        else if ($response['verified'])
            $this->redirect("//" . $this->server->server_name . "/login?error=" . str_replace(" ", "%20", "Your account is not verified. A verification link must have been sent to your email."));
        $this->cookie->set("auth", $token);
        {

            $this->redirect($this->server->http_refer . "?account_creation=success");
        }
    }
}