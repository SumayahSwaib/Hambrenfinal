<?php

use JetBrains\PhpStorm\Pure;

class Auth extends Controller
{
    function __construct() {
        parent::__construct();
        $this->model("Users_model");
    }

    function index() {

    }

    function login() {
        $response = $this->model->Users_model->auth();
        if ($response) {
            $response = (object)$response;
            if ($response->state === 1) {
                $this->session->set_user_data("user", $response->id);
                $this->session->set_user_data("role", $response->role);
                $this->session->set_user_data("school", $response->school);
                $this->redirect("/dashboard");
            }else
                $this->redirect("/?message=You%20restricted%20from%20accessing%20this%20account");
        }
        $this->redirect("/?message=Password%20mismatch");
    }

    #[Pure] function is_logged_in() {
        if ($this->session->data("user")) {
            //$this->model->Users_model->
        }
    }

    function logout() {
        $this->session->destroy();
        $this->redirect("/");
    }

}