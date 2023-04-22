<?php

use JetBrains\PhpStorm\ArrayShape;

/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-28
 * Time: 20:53
 */

class Payments_model extends Model
{
    function __construct()
    {
        parent::__construct();
        $this->model("Products_model");
    }

    /**
     * @throws Exception
     */
    function create_invoice($user, $district, $description): bool|string
    {
        $temporary_id = $this->cookie->read("temporary_id");
        if (empty($temporary_id) )
            if (! $user or empty($district))
                return false;

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
//            $this->db->where("id", $district);
//            $delivery_cost = $this->db->getValue("districts", "delivery_amount");
            $coupon_cost = 0;

            foreach ($final_cart_products as $item)
                $total_cost = $total_cost + $final_cart[$item['id']]['qty'] * $item['price_1'];

            $invoice_amount = ($total_cost + 0) - $coupon_cost;

//            if ($invoice_amount < 1000)
//                return false;
            $order = $this->db->insert("orders",
                array("user" => $user,
                    "amount" => $invoice_amount,
                    "delivery_district" => $district,
                    "description" => $description,
                    "temporary_id" => $temporary_id,
                    "date_created" => date("Y-m-d H:i:s")
                    )
            );

            if (! empty($this->cookie->cookie->affiliate)) {
                $this->db->where("status", 1);
                $commission = $this->db->getOne("affiliate_commissions", "commission")['commission'] ?? 0;
                $affiliate = str_split($this->cookie->cookie->affiliate, 32)[1];
                $this->db->insert("affiliate_transactions",
                    array("user" => $user,
                        "temporary_id" => $temporary_id,
                        "affiliate" => $affiliate,
                        "discount" => $commission,
                        "date_added" => date("Y-m-d"),
                        "order" => $order));
            }
            $cart_to_display = [];
            foreach ($final_cart_products as $item) {
                //                    $item['order_qty'] = $final_cart[$item['id']]['qty'];
                $size = $color = null;
                if (isset($final_cart[$item['id']]['size']))
                    $size = $final_cart[$item['id']]['size'];

                if (isset($final_cart[$item['id']]['color']))
                    $color = $final_cart[$item['id']]['color'];

                $cart_to_display[] = array("product" => $item['id'],
                    "order" => $order,
                    "amount" => $item['price_1'],
                    "qty" => $final_cart[$item['id']]['qty'],
                    "color" => $color,
                    "size" => $size);
            }
            $this->db->insertMulti("ordered_items", $cart_to_display);

            $hash = hash("md5", time()) . "-ref-" . $order . "-" . $user ."-". $temporary_id;

            $this->db->insert("order_keys", array("order" => $order,
                "order_ref" => $hash,
                "user" => $user,
                "temporary_id" => $temporary_id,
                "date_created" => date("Y-m-d h:i:s")));
            $this->session->set_user_data("ref", $hash);
            return $hash;
        }
        return false;
    }

    /**
     * @throws Exception
     */
    function confirm_payment($response_json, $response_ref, $response_status, $response_amount, $response_currency) {
        $this->db->where("order_ref", $response_ref);
       $data = $this->db->getOne("order_keys");
       if (empty($data))
           return false;

       /*
        * Lets validate the sent data with the database data
        */
       $payment_status = 0;
       if (strcmp($response_ref, $data['order_ref']) == 0
           and
                strcmp($response_status, "Successful") == 0
                    and
                        strcmp($response_currency, "UGX") == 0)
           /*
            * If our validation is right, then lets update the order and the user has successfully completed the payment prococess
            */
           $payment_status = 1;

       /*
        * Lets update the key table
        */
        $this->db->where("order_ref", $response_ref);
        $this->db->update("order_keys", array("response_data" => $response_json));

        /*
         * Lets update the orders table
         */
        $this->db->where("id", $data['order']);
        $this->db->update("orders", array("payment_confirmation" => $payment_status, "order_state" => 1));
    }

    #[ArrayShape(["production_public_key" => "mixed|string", "test_public_key" => "mixed|string", "production_secret_key" => "mixed|string", "test_secret_key" => "mixed|string", "encryption" => "mixed|string"])] function get_payment_keys() {
        $data = $this->db->getOne("payment_keys", "production, testing, secret_key, testing_key, encryption");
        return array("production_public_key" => $data['production'] ?? '',
            "test_public_key" => $data['testing'] ?? '',
            "production_secret_key" => $data['secret_key'] ?? '',
            "test_secret_key" => $data['testing_key']  ?? '',
            "encryption" => $data['encryption'] ?? '');
    }

    /**
     * @throws Exception
     */
    function get_charge(): array|string|null
    {
        $this->db->orderBy("id", "DESC");
        return $this->db->getValue("tx_charge", "charge");
    }

    /**
     * @throws Exception
     */
    function initiate_payment($number = false , $only_amount = false) {
        $tx = $this->session->data("ref");
        if (empty($tx))
            return false;
        $d = explode("_", $tx);
        $id = $d[2]; //tx id
        $user = $d[3]; //User
        $this->db->orderBy("id", "desc");
        $this->db->where("(user = '$user' or temporary_id = '$user')");
        $data = $this->db->getOne("addresses", 'email, company');
        if (! $data)
            return false;
        $this->db->where("user", $user);
        $this->db->where("id", $id);
        $amount = $this->db->getValue("orders", "amount");
        if (empty($amount))
            return false;
        if ($only_amount)
            return $amount;
        $charges = $this->get_charge();
        $amount = $amount + round($amount * ($charges/100), 3);
        $this->db->orderBy("id", "desc");
        $credentials = $this->db->getOne("payments", "code, uak, psid, code");
        if (empty($credentials))
            return false;

        $this->db->where("user", $user);
        $user_data = $this->db->getOne("basic_info", "email, names");
        if ($user_data) {
            $data['email'] = $user_data['email'];
            $data['company'] = $user_data['names'];
        }
        $callback = "https://www.jaslac.com/call-back";
        return $this->make_payment($number, $data['email'], $amount, $credentials['uak'], $credentials['psid'], $tx, $callback, $data['company']);
    }

    function make_payment($phone_number, $email, $amount, $uak, $psid, $ref, $callback, $names) {
        $names = explode(" ", $names);
        $curl = curl_init();
        $url = strcmp($this->server->server_name, "jaslac.ltd") == 0 ? "http://localhost.boosteds.xyz/mm/collections" : "https://boosteds.xyz/mm/collections";
        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS =>'{
            "first_name" : "' . $names[0] . '", "last_name" : "' . ($names[1] ?? '') . '",
            "request" : "mobile_money", "currency" : "UGX",
            "phone_number" : "' . $phone_number . '",
            "email_address" : "' . $email .'",
            "tx_ref" : "' . $ref . '",
            "call_back_url" :"' . $callback . '",
            "amount": "' . $amount . '"}',
            CURLOPT_HTTPHEADER => array(
                'Accept-Charset: utf-8',
                'Content-Type: application/json',
                'User-Access-Key:' . $uak ,
                'Project-Sid: ' . $psid,
            ),

        ));
        $response = curl_exec($curl);
        curl_close($curl);
        return json_decode($response);
    }
}