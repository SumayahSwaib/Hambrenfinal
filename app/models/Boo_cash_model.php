<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-12-11
 * Time: 02:00
 */

class Boo_cash_model extends Model
{

    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function enroll($user) {
        if (! $user)
            return false;

        $this->db->where("user", $user);
        $this->db->update("basic_info", array("boo_cash" => 1));
    }

    function check_link($username, $user) {
        $username = $this->xss_clean($username);
        if (empty($username))
            return false;
        $this->db->where("username", $username);
        $this->db->where("boo_cash", 1);
        $data = $this->db->getOne("basic_info", "user, names, image");
        if ($data)
            $this->cookie->set("affiliate", md5(time()) . $data['user']);
        return $data;
    }

    function get_affiliate_summary($user, $status = false) {
        if (! $user)
            return false;
        $this->db->orderBy("orders.id", "desc");
        $this->db->where("affiliate", $user);
        if ($status)
            $this->db->where("payment_confirmation", 1);
        $this->db->join("orders", "orders.id = affiliate_transactions.order");
        $data =$this->db->get("affiliate_transactions", null, "(select names from basic_info where user = orders.user) as names, orders.date_created, discount, amount, order_state");
        return $data;
    }

    function boo_withdraws($user) {
        if(! $user)
            return false;
    }

    function get_user_boo_cash_snippet($user) {
        if(! $user)
            return false;
        //Getting all successful paid requests
        $withdraws = $this->db->rawQueryOne("select sum(amount) as withdraw from affiliate_withdraws where status = 3 and user = ? ", array("user" => $user));
        //Getting all successful paid orders where the affiliate id was used
        $successful_transactions = $this->get_affiliate_summary($user, true);
        //Calculating the summary of all orders. It is cumulative
        $totals = 0;
        foreach ($successful_transactions as $transaction)
            $totals = $totals + (($transaction['discount']/100) * $transaction['amount']);
        return array("all_withdraws" => $withdraws['withdraw'] ?? 0, "successful_orders" => $totals ?? 0);
    }



}