<?php

class User extends Controller
{
    function __construct()
    {
        parent::__construct();
    }

    function index() {
        $this->smarty->display("user/profile.tpl");
    }

    function sign_in() {
        $this->smarty->assign("no_navigation", true);
        $this->smarty->display("user/sign-in.tpl");
    }

    function register() {
        $this->smarty->assign("no_navigation", true);
        $this->smarty->display("user/sign-up.tpl");
    }

    function forgot_password() {
        $this->smarty->assign("no_navigation", true);
        $this->smarty->display("user/forgot-password.tpl");
    }

    function wishlist() {
        $this->smarty->display("user/wishlist.tpl");
    }

}