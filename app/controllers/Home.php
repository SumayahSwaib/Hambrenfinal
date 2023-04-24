<?php

class Home extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Products_model");
        $this->model("Categories_model");
        $this->model("Suppliers_model");
        $this->model("Mail_model");
        $this->model("Payments_model");
        $this->model("Orders_model");
        $this->load_default();
    }

    function load_default () {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("website", "1");
        $this->smarty->assign("get_category_lists", $this->model->Products_model->get_products_per_category());
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(20, true));
    }

    /**
     * @throws SmartyException
     */
    function index()
    {

        $this->smarty->display("home2.tpl");
    }




    function about_us() {
        $this->smarty->display("home/about_us.tpl");
    }

    function contact_us() {
        $this->smarty->display("home/contact_us.tpl");
    }

    function privacy_policy() {
        $this->smarty->display("home/privacy_policy.tpl");
    }

    function order_tracking() {
        $this->smarty->display("home/order_tracking.tpl");
    }

    function payment_methods() {
        $this->smarty->display("home/payment_methods.tpl");
    }

    function return_policy() {
        $this->smarty->display("home/return_policy.tpl");
    }

    function refund_policy() {
        $this->smarty->display("home/refund_policy.tpl");
    }

    function shipping_policy() {
        $this->smarty->display("home/shipping_policy.tpl");
    }

    function terms_of_service() {
        $this->smarty->display("home/terms_of_service.tpl");
    }

    function search() {
        $this->smarty->display("home/search.tpl");
    }
}