<?php

class Shop extends Controller
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws SmartyException
     */
    function index() {
        $this->smarty->display("shop/shop.tpl");
    }

    function cart() {
        $this->smarty->display("shop/cart.tpl");
    }

    function checkout() {
        $this->smarty->display("shop/checkout.tpl");
    }

    function wishlist() {
        $this->smarty->display("shop/wishlist.tpl");
    }
}