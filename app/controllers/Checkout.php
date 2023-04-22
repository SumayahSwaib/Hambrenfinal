<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-16
 * Time: 21:59
 */

class Checkout extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Products_model");
        $this->model("Categories_model");
        $this->model("Payments_model");
        $this->model("Suppliers_model");
    }

    function index() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());


        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $addresses = $this->model->User_model->get_addresses($id);
        $this->smarty->assign("public_key", $this->model->Payments_model->get_payment_keys()['test_public_key']);
        $this->smarty->assign("addresses", $addresses);
        $this->smarty->assign("country_list", $this->model->User_model->get_countries());
        $this->smarty->assign("district_list", $this->model->User_model->get_districts());
        if (! empty($this->session->data("final_cart"))) {
            $final_cart = $this->session->data("final_cart");
            $cart_data = [];
            /*
             * Let us get the cart content stored from add cart functionality
             * The index of the session array is the exact key for the product
             */
            foreach ($final_cart as $item => $list)
                $cart_data[] = $item;

            /*
             * Get information from the cart with that from products table
             */
            $final_cart_products = $this->model->Products_model->get_cart_items($cart_data);
            $total_cost = 0;
            $delivery_cost = ! empty($addresses) ? $addresses['delivery'] : 20000;
            $coupon_cost = 0;
            foreach ($final_cart_products as $item)
                $total_cost = $total_cost + $final_cart[$item['id']]['qty'] * $item['price_1'];

            $this->smarty->assign("final_cart",
                array("grand_totals" => (($total_cost + $delivery_cost) - $coupon_cost),
                    "sub_total" => $total_cost,
                    "delivery_cost" => $delivery_cost,
                    "coupon_cost" => $coupon_cost));
        }

        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("cart_items", $this->model->Products_model->get_cart_items($this->session->data("cart")));
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("checkout/checkout.tpl");
    }

    function cart() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("cart_items", $this->model->Products_model->get_cart_items($this->session->data("cart")));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("checkout/cart.tpl");
    }

    function process_cart() {
        $product_array = $this->input->post();
        $products = $this->input->post("product");
        $qty = $this->input->post("qty");
        //Let's get product attributes if any supplied
        $iterator = 0;
        $cart_data = [];
        $this->session->remove_data("final_cart");
        foreach ($products as $item_list => $i) {
            if (isset($product_array["size_" . $i]))
                $cart_data[$i]['size'] = $this->input->post("size_" . $i);
            if (isset($product_array["color_" . $i]))
                $cart_data[$i]['color'] = $this->input->post("color_" . $i);
            $cart_data[$i]['qty'] = $qty[$iterator];
            $iterator++;
        }

        //print_r($cart_data);


        $this->session->set_user_data("final_cart", $cart_data);
        $this->redirect("//" . $this->server->server_name . "/checkout");
    }

    function place_holder() {
        $id = $this->model->User_model->is_logged_in();
        $district = $this->input->post("district");
        $description = $this->xss_clean(trim($this->input->post("description")));
        $order = $this->model->Payments_model->create_invoice($id, $district, $description);
        $this->session->remove_data("final_cart");
        $this->session->remove_data("cart");
        echo json_encode($order);
    }

    function payment_progress() {
        //print_r($this->input->get());
        $resp = $this->input->get("resp");
        if ($resp) {
            $resp = json_decode($resp);
            //print_r($resp);
            $status = $resp->status;
            if ($status == "success")
                $status = "successful";
            $tx_ref = $resp->data->txRef;
            $transaction_id = $resp->data->id;
            $mobile_login = "intent://booo.store?directLink=true&status=". $status ."&tx_ref=" . $tx_ref . "&transaction_id=" . $transaction_id . "#Intent;scheme=booostore;package=booo.store;end";
            //$mobile_login = 2;
            //echo $mobile_login;
            echo("<script type=\"text/javascript\"> window.location='" . $mobile_login . "'; </script>");
            die();
        }
        $status = $this->input->get("status");
        $tx_ref = $this->input->get("tx_ref");
        $transaction_id = $this->input->get("transaction_id");
        $key = $this->model->Payments_model->get_payment_keys();
        //echo $status;
        //echo "<br/>".$tx_ref;
        //echo "<br/>".$transaction_id;
        if ($status == "successful") {
            //echo "<br/>3";
            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => "https://api.flutterwave.com/v3/transactions/" . $transaction_id . "/verify",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => array(
                    "Content-Type: application/json",
                    "Authorization:" . $key['test_secret_key']
                ),
            ));

            $response = curl_exec($curl);

            curl_close($curl);
            $response_array = json_decode($response);
            $response_ref = $response_array->data->tx_ref;
            $response_status = $response_array->status;
            $response_amount = $response_array->data->charged_amount;
            $response_currency = $response_array->data->currency;
            /*
             * Before we can continue, lets make sure the ref id in the url matches with curl response
             */

            if (strcmp($response_ref, $tx_ref) == 0)
                $this->model->Payments_model->confirm_payment($response, $response_ref, $response_status, $response_amount, $response_currency);
        }
        $this->redirect("//" . $this->server->server_name . "/profile/order");
    }
}