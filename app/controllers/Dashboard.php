<?php

use JetBrains\PhpStorm\NoReturn;

/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-10-04
 * Time: 17:30
 */

class Dashboard extends Controller
{
    #[NoReturn] function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Products_model");
        $this->model("Categories_model");
        $this->model("Orders_model");
        $this->model("Suppliers_model");
        $this->model("Mail_model");
        $this->controller("Home");
    }

    function index($order = false) {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        if ($id) {
            $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
            $this->smarty->assign("key", $key);
            $this->smarty->assign("current_page", "dashboard");
            $this->smarty->assign("version", $this->model->Api_model->get_version());
            $this->smarty->assign("profile_index", 99);
            $this->smarty->assign("addresses", $this->model->User_model->get_addresses($id));
            $this->smarty->assign("orders", $this->model->Orders_model->get_user_orders($id));
            $this->smarty->assign("watchlist", $this->model->User_model->get_watchlist_items($id));
            if ($order) {

                $this->smarty->assign("order_details", $this->model->Orders_model->get_user_orders($id, $order));
                $this->smarty->assign("ordered_items", $this->model->Orders_model->get_user_order_items($id, $order));
            }
            if (! isset($_SERVER['HTTP_USER_AGENT']) || $_SERVER['HTTP_USER_AGENT'] != "Boosted/jaslac.com") {
                $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
                $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
                $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
                $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
                $this->smarty->assign("domain", $this->model->User_model->active_domain());
                $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
                $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
                $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
                $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
                $this->smarty->display("user/profile.tpl");
            }else
                $this->smarty->display("profile/profile_mobile.tpl");
        }else
            $this->login();
    }

    function details() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        if ($id) {
            $this->smarty->assign("current_page", "details");
            $this->smarty->assign("version", $this->model->Api_model->get_version());
            $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
            $this->smarty->assign("key", $key);
            $this->smarty->assign("profile_page", "Account details");
            $this->smarty->assign("profile_index", 1);
            $this->smarty->assign("addresses", $this->model->User_model->get_addresses($id));
            if (! isset($_SERVER['HTTP_USER_AGENT']) || $_SERVER['HTTP_USER_AGENT'] != "Boosted/jaslac.com") {
                $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
                $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
                $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
                $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
                $this->smarty->assign("domain", $this->model->User_model->active_domain());
                $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
                $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
                $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
                $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
                $this->smarty->display("profile/profile.tpl");
            }else
                $this->smarty->display("profile/profile_mobile.tpl");
        }else
            $this->login();
    }

    function address() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        if ($id) {
            $this->smarty->assign("current_page", "address");
            $this->smarty->assign("version", $this->model->Api_model->get_version());
            $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
            $this->smarty->assign("addresses", $this->model->User_model->get_addresses($id));
            $this->smarty->assign("country_list", $this->model->User_model->get_countries());
            $this->smarty->assign("district_list", $this->model->User_model->get_districts());
            $this->smarty->assign("key", $key);
            $this->smarty->assign("profile_index", 2);
            $this->smarty->assign("profile_page", "Shipping Addresses");

            if (! isset($_SERVER['HTTP_USER_AGENT']) || $_SERVER['HTTP_USER_AGENT'] != "Boosted/jaslac.com") {
                $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
                $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
                $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
                $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
                $this->smarty->assign("domain", $this->model->User_model->active_domain());
                $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
                $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
                $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
                $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
                $this->smarty->display("profile/profile.tpl");
            }else
                $this->smarty->display("profile/profile_mobile.tpl");
        }else
            $this->login();
    }

    #[NoReturn] function update(){
        $id = $this->model->User_model->is_logged_in();
//        if (! $id)
//            $this->redirect("//" . $this->server->server_name);
        $this->model->User_model->update_address($id);
        $this->redirect($this->server->http_refer);
    }

    function orders() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        if ($id) {
            $this->smarty->assign("profile_page", "My orders");
            $this->smarty->assign("profile_index", 3);
            if ($this->cookie->read("temporary_id"))
                $this->smarty->assign("orders_temp_id", $this->model->Orders_model->get_orders_by_temporary_id());
            $this->smarty->assign("current_page", "orders");
            $this->smarty->assign("orders", $this->model->Orders_model->get_user_orders($id));
            $this->smarty->assign("version", $this->model->Api_model->get_version());
            $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
            if (! isset($_SERVER['HTTP_USER_AGENT']) || $_SERVER['HTTP_USER_AGENT'] != "Boosted/jaslac.com") {
                $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
                $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
                $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
                $this->smarty->assign("key", $key);
                $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
                $this->smarty->assign("domain", $this->model->User_model->active_domain());
                $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
                $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
                $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
                $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
                $this->smarty->display("user/profile.tpl");
            }else
                $this->smarty->display("profile/profile_mobile.tpl");
        }else
            $this->login();
    }

    function watchlist() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        if ($id) {
            $this->smarty->assign("current_page", "watchlists");
            $this->smarty->assign("version", $this->model->Api_model->get_version());
            $this->smarty->assign("profile_page", "Watchlist");
            $this->smarty->assign("profile_index", 4);
            $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
            $this->smarty->assign("watchlist", $this->model->User_model->get_watchlist_items($id));
            $this->smarty->assign("key", $key);
            if (! isset($_SERVER['HTTP_USER_AGENT']) || $_SERVER['HTTP_USER_AGENT'] != "Boosted/jaslac.com") {
                $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
                $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
                $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
//                $this->smarty->assign("orders", $this->model->Orders_model->get_user_orders($id));
                $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
                $this->smarty->assign("domain", $this->model->User_model->active_domain());
                $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
                $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
                $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
                $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
                $this->smarty->display("profile/profile.tpl");
            }else
                $this->smarty->display("profile/profile_mobile.tpl");
        }else
            $this->login();
    }

    function order_details($order) {
        $this->model("Payments_model");
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("current_page", "orders");
        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("profile_page", "#ORDER " . $order);
        $this->smarty->assign("profile_index", 3);
        if (! isset($_SERVER['HTTP_USER_AGENT']) || $_SERVER['HTTP_USER_AGENT'] != "Boosted/jaslac.com") {
            $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
            $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
            $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
            $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
            $this->smarty->assign("public_key", $this->model->Payments_model->get_payment_keys()['test_public_key']);
            $this->smarty->assign("key", $key);
            $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
            $this->smarty->assign("ordered_items", $this->model->Orders_model->get_user_order_items($id, $order));
            $this->smarty->assign("orders", $this->model->Orders_model->get_user_orders($id, $order));
            $this->smarty->assign("addresses", $this->model->User_model->get_addresses($id));
            $this->smarty->assign("domain", $this->model->User_model->active_domain());
            $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
            $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
            $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
            $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
            $this->smarty->display("user/profile.tpl");
        }else
            $this->smarty->display("user/profile.tpl");
    }

    function get_commission_summary($user) {
        $this->model("Boo_cash_model");
        $this->model->Boo_cash_model->get_affiliate_summary();
    }

    function get_addresses() {
        $id = $this->model->User_model->is_logged_in();
        if ($id) {
            echo json_encode(array("country_list" => $this->model->User_model->get_countries(), "district_list" => $this->model->User_model->get_districts()));
        } else
            echo json_encode(false);
    }

    function register() {
        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->controller->Home->has_active_session();
        $this->smarty->assign("no_navigation", true);
        $this->smarty->display("user/sign-up.tpl");
    }

    function login() {
        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->controller->Home->has_active_session();
        $this->smarty->assign("no_navigation", true);
        $this->smarty->display("user/sign-in.tpl");
    }

    function confirm_account($code = false) {
        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("no_navigation", true);
        $this->controller->Home->has_active_session();
        $response = $this->model->User_model->confirm_account($code);
        $this->smarty->assign("message", $response);
        $this->smarty->display("user/confirm-account.tpl");
    }

    #[NoReturn] function create_account() {
        $this->controller->Home->has_active_session();
        $data = ["names" => trim($this->input->post("names")),
            "email" => trim($this->input->post("email")),
            "dob" => trim($this->input->post("dob")),
            "gender" => trim($this->input->post("gender")),
            "password" => trim($this->input->post("password"))];
        $token = hash("md5", (time() . mt_rand(1000, 59999) . $data['email']));
        $response = $this->model->User_model->update_user_data($data, $token);
        if ($response['status'] == 2) {
            //$this->cookie->set("auth", $token);
            $message = "Hello " . $data['names'] . ", <br/>Thank you for signing up with Hambren. Click <a href='https://" . $this->server->server_name . "/confirm-account/" . $response['token'] . "'>here<a/> to activate your account. <br/><br/><br/>------------------------------<br/>Visit Hambren.com, call:  +1 (437) 980-3253, email : sales@hambren.com";
            $this->model->Mail_model->send_mail($data['email'], $message, "Confirm account");
            $message = "Hello " . $data['names'] . ", Check your Inbox or in SPAM folder for <b>" . $data['email'] . "</b> for details on how to confirm your account.";
            $this->redirect("//" . $this->server->server_name ."/comfirm-account?account_creation=success&message=" . $message);
        }
        $this->redirect("//" . $this->server->server_name . "/register?error=" . str_replace(" ", "%20", $response['message']));
    }

    #[NoReturn] function logout() {
        $this->session->destroy();
        $this->cookie->destroy();
        $this->redirect("//" . $this->server->server_name);
    }

    #[NoReturn] function _update_app_version() {
        $id = $this->model->User_model->is_logged_in();
        $user = $this->model->User_model->get_user_profile($id);
        //print_r($user);
        if ($user[0]['role'] == 1)
            $this->model->Api_model->update_app_version($id);
        $this->redirect($this->server->http_refer);
    }

}