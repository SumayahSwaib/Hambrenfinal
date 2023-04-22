<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-12-11
 * Time: 02:07
 */

class Boo_cash extends Controller
{

    function __construct()
    {
        parent::__construct();
        $this->model("Api_model");
        $this->model("Boo_cash_model");
        $this->model("User_model");
        $this->model("Products_model");
        $this->model("Categories_model");
        $this->model("Orders_model");
        $this->model("Api_keys");

    }

    function boo_cash_enroll() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Boo_cash_model->enroll($id);
        $this->redirect($this->server->http_refer);
    }

    function auth_affiliate($username) {
        $this->smarty->display("affiliate/shared_page.tpl", array("content" => $this->model->Boo_cash_model->check_link($username, $this->model->User_model->is_logged_in())));
    }

    function get_affiliate_transactions() {
        $this->model("Suppliers_model");
        $this->model("Payments_model");
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();

        $this->smarty->assign("current_page", "transactions");
        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("public_key", $this->model->Payments_model->get_payment_keys()['test_public_key']);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("affiliate_summary", $this->model->Boo_cash_model->get_affiliate_summary($id));
        $this->smarty->assign("boo_snippet", $this->model->Boo_cash_model->get_user_boo_cash_snippet($id));
        $this->smarty->assign("profile_index", 3);
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("addresses", $this->model->User_model->get_addresses($id));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("affiliate/transactions.tpl");
    }

}