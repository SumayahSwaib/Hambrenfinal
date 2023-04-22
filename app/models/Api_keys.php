<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-08-22
 * Time: 22:35
 */

class Api_keys extends  Controller
{
    function __construct() {
        parent::__construct();
    }
    function generate_keys() {
        $keys = array("", "", "", "", "", "");
        $key =  hash("sha256", $keys[array_rand($keys)]);
        //$this->cookie->destroy("local_key");
        if (empty($this->session->data("local_key")))
            $this->session->set_user_data("local_key", $key);
        //echo $this->cookie->read("local_key");
        $this->session->set_user_data("current_page", $this->server->request_uri);
        //echo $this->session->data("current_page"); die();
        return $this->session->data("local_key");
    }

}