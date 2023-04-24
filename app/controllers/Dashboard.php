<?php

class Dashboard extends Controller
{
    public array $user = [];
    function __construct()
    {
        parent::__construct();
        $this->model("Users_model");
        $this->user = $this->model->Users_model->is_logged_in();
        if (empty($_POST))
            $this->smarty->assign("user", $this->user);
    }

    function index() {
        $this->smarty->display("dashboard/dashboard.tpl");
    }

}