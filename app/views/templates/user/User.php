<?php

class User extends Controller
{
    function __construct()
    {
        parent::__construct();
    }

    function index() {
        $this->smarty->display("/user/profile.tpl");
    }

    function sign_in() {
        $this->smarty->display("/user/profile.tpl");
    }

    function register() {
        $this->smarty->display("/user/profile.tpl");
    }

    function profile() {
        $this->smarty->display("/user/profile.tpl");
    }

    function forgot_password() {
        $this->smarty->display("/user/profile.tpl");
    }

}