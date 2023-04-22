<?php
/**
 * Created by PhpStorm.
 * User: Ashan - DevMate
 * ashiraff@boostedtechs.com
 * Date: 2020-11-22
 * Time: 12:35
 */

class Admin extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Categories_model");
        $this->model("Metrics_model");
        $this->model("Currency_model");
        $this->model("Products_model");
        $this->model("Dashboard_summaries_model");
        $this->model("Orders_model");
        $this->model("Boo_cash_model");
    }

    function index() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->session->remove_data("preference");
        $this->smarty->assign("summary", $this->model->Dashboard_summaries_model->get_all_summaries());
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("current_page", "dashboard");
        $this->smarty->display("admin/dashboard/dashboard.tpl");
    }

    /*
     * Categories
     */
    function categories() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories());
        $this->smarty->assign("current_page", "categories");
        $this->smarty->display("admin/categories/index.tpl");
    }

    function new_category() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Categories_model->new_category($id);
        $this->redirect($this->server->http_refer);
    }

    function sub_categories() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_sub_categories());
        $this->smarty->assign("current_page", "sub-categories");
        $this->smarty->display("admin/categories/sub_categories.tpl");
    }

    function new_sub_category() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Categories_model->new_sub_category($id);
        $this->redirect($this->server->http_refer);
    }

    /*
     * Metrics
     */
    function metrics() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("metrics", $this->model->Metrics_model->get_metrics());
        $this->smarty->assign("current_page", "metrics");
        $this->smarty->display("admin/metrics/index.tpl");
    }

    function new_metric() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Metrics_model->new_metric($id);
        $this->redirect($this->server->http_refer);
    }

    /*
     * End metrics
     */

    /*
     * Currency
     */

    function currency() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("currency", $this->model->Currency_model->get_currencies());
        $this->smarty->assign("current_page", "currency");
        $this->smarty->display("admin/currency/index.tpl");
    }

    function new_currency() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Currency_model->new_currency($id);
        $this->redirect($this->server->http_refer);
    }
    /*
     * End
     */

    /*
     * Orders begin
     */

    function orders($order = false) {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("orders", $this->model->Orders_model->get_order_list($id, $order));
        if ($order)
            $this->smarty->assign("ordered_items", $this->model->Orders_model->get_ordered_items($order, $id));
        $this->smarty->assign("current_page", "orders");
        $this->smarty->display("admin/orders/orders.tpl");
    }

    /*
     * End orders
     */

    /*
     *Users
     */

    function users($user = false) {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("users", $this->model->User_model->get_user_list($id, $user));
        $this->smarty->assign("current_page", "users");
        $this->smarty->display("admin/users/index.tpl");
    }

    function user_profile($user) {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("addresses", $this->model->User_model->get_addresses($user));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $user_profile = $this->model->User_model->get_user_list($id, $user);
        $this->smarty->assign("users", $user_profile);
        if ($user_profile[0]['boo_cash'] == 1):
            $this->model("Boo_cash_model");
            $this->smarty->assign("affiliate_summary", $this->model->Boo_cash_model->get_affiliate_summary($user));
            $this->smarty->assign("boo_snippet", $this->model->Boo_cash_model->get_user_boo_cash_snippet($user));
        endif;
        $this->smarty->assign("current_page", "users");
        $this->smarty->display("admin/users/user.tpl");
    }

    function affiliates() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("users", $this->model->User_model->get_user_list($id, false, true));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("current_page", "affiliates");
        $this->smarty->display("admin/affiliates/index.tpl");
    }

    function add_to_home() {
        $id = $this->model->User_model->is_logged_in();
        //$this->model->Products_model->
    }
}