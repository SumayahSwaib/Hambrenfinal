<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-22
 * Time: 17:33
 */

class Currency_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function new_currency($user): bool
    {
        if (! $user)
            return false;
        $category = $this->xss_clean($this->input->post("currency"));
        $status = $this->xss_clean($this->input->post("status"));

        if (empty($category) or empty($status))
            return false;

        //print_r($this->input->post());
        $url = str_replace(" ", "-", $this->replace_multiple_spaces($this->remove_none_utf_char($this->remove_special_chars($category))));
        $url = $this->check_url_for_duplicates(strtolower($url), "product_currency", "url");
        $this->db->insert("product_currency",
            array("currency" => $category,
                "status" => $status,
                "date_created" => date("Y-m-d"),
                "user" => $user,
                "url" => $url));
        return true;
    }

    /**
     * @throws Exception
     */
    function get_currencies(): MysqliDb|array|string
    {
        $this->db->orderBy("currency", "asc");
        return $this->db->get("product_currency", null, "id, 
        url, 
        currency, 
        status, 
        date_created, 
        date_updated, (select names from basic_info where user = product_currency.user) as names");
    }
}