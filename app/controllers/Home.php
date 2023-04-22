<?php

use JetBrains\PhpStorm\NoReturn;

/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-09-22
 * Time: 12:39
 */

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
    }

    /**
     * @throws SmartyException
     */
    function index() {
        if (! empty($this->input->get("out"))) {
            $this->cookie->destroy();
            $this->redirect("//" . $this->server->server_name);
        }
        //die($this->mobile());
        if (isset($_SERVER['HTTP_USER_AGENT']) && $_SERVER['HTTP_USER_AGENT'] == "Boosted/jaslac.com")
            $this->mobile();
        else {
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
            $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
            $this->smarty->assign("domain", $this->model->User_model->active_domain());
            $this->smarty->display("home2.tpl");
        }
    }

    /**
     * @throws SmartyException
     */
    function mobile() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        //echo hash("sha256", "123456"); die();
        if (! $id) {
            $this->has_active_session();
            $this->smarty->display("user/sign-in.tpl");
        } else {
            $this->smarty->assign("version", $this->model->Api_model->get_version());
            $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
            $this->session->set_user_data("key", $key);
            $this->smarty->assign("key", $key);
            $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
            $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(16, true));
            $this->smarty->assign("domain", $this->model->User_model->active_domain());
            $this->smarty->display("android.tpl");
        }
    }

    function create_cart() {
        $cart_item = $this->input->post("item");
        $cart = (array)$this->session->data('cart');
        $action = 0;
        if (in_array($cart_item, $cart)) {
            $key = array_search($cart_item, $cart);
            unset($cart[$key]);
            $action = 1;
        } else
            $cart[] = $cart_item;
        $this->session->set_user_data("cart", $cart);
        //echo json_encode($_cart);
        echo json_encode([count($cart), $action]);
    }

    function create_watchlist() {
        $id = $this->model->User_model->is_logged_in();
        $item = $this->input->post("item");
        $watchlist = (array)$this->session->data("watchlist");
        if (! empty($watchlist))
            if (($key = array_search($item, $watchlist)) !== false)
                unset($watchlist[$key]);

        $watchlist[] = $item;
        $this->session->set_user_data("watchlist", $watchlist);
        if ($id)
            $watchlist = $this->model->User_model->update_watchlist($id, $watchlist);
        echo json_encode([count($watchlist), $item]);
    }

    function get_cart() {
        $id = $this->model->User_model->is_logged_in();
        $cart = $this->session->data("cart");
        if (is_array($cart))
            $cart_items = count($cart);
        else
            $cart_items = 0;

        if ($id)
            $watchlist_items = count($this->model->User_model->get_watchlist_items($id));
        else {
            $watchlist = $this->session->data("watchlist");
            if (is_array($watchlist))
                $watchlist_items = count($watchlist);
            else
                $watchlist_items = 0;
        }
        echo json_encode(array("cart" => $cart_items, "watchlist" => $watchlist_items));
    }

    #[NoReturn] function remove_from_cart($cart_item) {
        $cart = $this->session->data('cart');
        if (is_array($cart))
            if (($key = array_search($cart_item, $cart)) !== false)
                unset($cart[$key]);
        $this->session->set_user_data("cart", $cart);
        $this->redirect($this->server->http_refer);
    }

    #[NoReturn] function delete_watchlist_item($item) {
        $id = $this->model->User_model->is_logged_in();
        $this->model->User_model->delete_watchlist_item($id, $item);
        $this->redirect($this->server->http_refer);
    }

    function search_products() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", "Search");
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("search_results", $this->model->Products_model->search_products($id));
        $special_offer_products = $this->model->Products_model->get_special_categories(1, "products_special_offers");
        $this->smarty->assign("special_offer", $special_offer_products);
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("category_products", $special_offer_products);
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("products/search.tpl");
    }

    function subscribe() {
        $email = trim($this->input->post("email"));
        if (!filter_var($email, FILTER_VALIDATE_EMAIL))
            $emailErr = "Invalid email format";
        else
            $emailErr = $this->model->User_model->subscribe($email);
        echo $emailErr;
    }

    function privacy() {
        $this->smarty->display("privacy/index.tpl");
    }

    function terms() {
        $this->smarty->display("privacy/terms.tpl");
    }

    function affiliate() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("key", $key);
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("affiliate/index.tpl");
    }

    function become_a_supplier() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("supplier/index.tpl");
    }

    function supplier_dashboard() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("application_data", $this->model->Suppliers_model->get_supplier_application_data($id));
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("supplier/dashboard.tpl");
    }

    function view_supplier_business($supplier) {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $supplier = $this->model->Suppliers_model->get_suppliers(true, $id);

        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("application_data", $this->model->Suppliers_model->get_supplier_application_data($id));
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("order_summary", $this->model->Products_model->get_supplier_order_summary($id));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->assign("suppliers", $supplier);
        $this->smarty->assign("photos", $this->model->Suppliers_model->get_supplier_thumbnails(false, $supplier[0]['id']));
        $this->smarty->display("supplier/business_profile.tpl");
    }

    #[NoReturn] function choose_session() {
        $session  = $this->input->get("s");
        $session = $session ?: 1;
        $this->session->set_user_data("preference", $session);
        $this->redirect($this->server->http_refer);
    }

    function about_us() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("key", $key);
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("about-us.tpl");
    }

    function contact_us() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("key", $key);
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("contact-us.tpl");
    }

    function forgot_password() {
        $this->has_active_session();
        $this->smarty->display("login/forgot-password.tpl");
    }

    #[NoReturn] function send_password_reset() {
        $response = $this->model->User_model->send_password_reset();
        $_response = "Check your email for password reset options";
        if (isset($response['status'])) {
            //print_r($response);
            $email = $response['names']['email'];
            $names = $response['names']['names'];
            $code = $response['code'];
            $message = "Hello " . $names. ", <br/>You have requested to reset your Hambren account password. Click <a href='https://" . $this->server->server_name . "/reset-password/" . $code . "'>here<a/> reset password. <br/><br/><br/>------------------------------<br/>Visit hambren.com.  +1 (437) 980-3253, email : sales@hambren.com";
            $this->model->Mail_model->send_mail($email, $message, "Reset password");
        } else
            $_response = $response['message'];
        $this->redirect("/forgot-password?error=" . $_response);
    }

    function reset_password($code) {
        $this->has_active_session();
        $this->model->User_model->check_pwd($code);
        $this->smarty->assign("message", $this->model->User_model->check_pwd($code));
        $this->smarty->display("login/reset-pwd.tpl");
    }

    function password() {
        $response = $this->model->User_model->change_password();
        if ($response) {
            $this->smarty->assign("success", 1);
            $this->smarty->display("login/reset-pwd.tpl");
        } else
            $this->redirect($this->server->http_refer);
    }

    function has_active_session() {
        if(isset($this->cookie->cookie->auth))
            $this->redirect("/profile");
    }

    /**
     * @throws SmartyException
     */
    function order($ref) {
        //echo $ref;
        $amount = $this->model->Payments_model->initiate_payment(only_amount : true);
        $charge = $this->model->Payments_model->get_charge();
        $charged_amount = round($amount * ($charge/100), 3);
        $this->smarty->assign("amount", ['amount' => $amount, "charge" => $charged_amount]);
        $this->smarty->display("checkout/payment.tpl");
    }

    #[NoReturn] function make_payment() {
        $number = trim($this->input->post("number"));
        $number = (int)$number;
        if (empty($number) or strlen($number) < 9)
            $this->redirect($this->server->http_refer);
        $number = 256 . $number;
        $response = $this->model->Payments_model->initiate_payment($number);
        $message = "Transaction couldn't be completed. Try again later";
        if ($response) {
            if ($response->status == "Successful")
                $message = str_replace("Customer", "+" . $number, $response->message);
            else
                $message = $response->message;
        }
        $this->redirect("/profile/" . hash("md5", time()) . "?message=" . urlencode($message));
    }

    #[NoReturn] function replace_order($c) {
        $id = $this->model->User_model->is_logged_in();
        $data = explode("_", $c);
        if (count($data) < 4)
            $this->redirect($this->server->http_refer);
        $orders = $this->model->Orders_model->get_user_orders($id, $data[2]);
        if (! empty($orders)) {
            $response = $this->model->Orders_model->modify_order($orders);
            if ($response) {
                $this->session->set_user_data("ref", $response);
                $this->redirect("/profile/" . $response);
            }
        }
        $this->redirect($this->server->http_refer);
    }

    /**
     * @throws SmartyException
     */
    function get_cart_content() {
        $a = $this->input->get("i");
        if ($a == 1) {
            $this->smarty->assign("cart_items", $this->model->Products_model->get_cart_items($this->session->data("cart")));
            echo $this->smarty->fetch("checkout/ajax-cart.tpl");
        }
    }

    function more_feeds() {
        $page = $this->input->get("l");
        $sub = $this->input->get("s");
        $results = $this->model->Products_model->get_all_products(8, true, category : $page, sub_category : $sub);
        $result = "";
        foreach ($results as $item) {

            $result .= "
                    <div class=\"col  slideInUp mb-2\" data--duration=\"2s\" data--delay=\".3s\">
                        <div class=\"card border-0\">
                            <div class=\"card-header bg-transparent\">
                                <small class=\"text-truncate sm-hide\">" . $item['product_category']. " <i class=\"fa fa-arrow-circle-right\"></i>" .$item['product_sub_category'] ." </small>
                                <a href=\"/product/" .$item['url'] ."\">
                                    <h6 class=\"price-text text-center\">" .$item['name'] . " </h6>
                                </a>
                            </div>
                            <div class=\"card-body\">
                                <div class=\"small-container-2\">
                                    <a href=\"/product/" . $item['url'] ."\">
                                        <img src=\"//" . $this->server->server_name . "/media/products_thumbnails/" . $item['feature_photo'] ." \" class=\"w-100\" />
                                    </a>
                                </div>
                                <h5 class='mt-2 mb-2 price-text'>" . $item['currency_name'] ." ".  number_format($item['price_1'], 0) . "</h5>";
                                if ($item['price_2'] > 0)
                                    $result .= "<h6 class='mb-2 text-muted price-text font-weight-light' style='text-decoration: line-through'>" .$item['currency_name'] . " " . $item['price_2'] ."</h6>";
                            $result .= "</div>
                            <div class='card-footer bg-transparent'>
                                <div class='row'>
                                 <button class=\"col-md-12 p-2 text-center mt-1 btn-warning border-0 cursor mb-1\" onclick=\"addToWatchlist(" . $item['id'] . ")\" title=\"Add to Watchlist\">                                   
                                    <small class=\"addd-watchlist" . $item['id']. "\">".(in_array($item['id'], $_SESSION['watchlist']) ? "SAVED <i class='fa fa-check-circle text-primary'></i>" : "<span class=\"fa fa-plus-square watchlist-item-". $item['id']. "\" title=\"add to Watchlist\"></span>Watchlist") . "</small>
                                </button>
                                    <button class='col-md-12 p-2 text-center btn-danger border-0 cursor' onclick=\"addToCart('" . $item['id'] . "')\" title='Add to cart'>
                                        <span class='fa fa-shopping-cart p-1 cart-item-". $item['id'] . "' title='add to cart'></span>
                                        <small class='added-cart" . $item['id'] ."'>".(in_array($item['id'], $_SESSION['cart']) ? "Remove <i class='fa fa-scissors'></i>" : "BUY") . "</small>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>";
        }
        echo json_encode($result);
    }
}