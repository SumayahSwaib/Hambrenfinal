<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-22
 * Time: 13:28
 */

class Categories_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function new_category($user): bool
    {
        if (! $user)
            return false;
        $category = $this->security->xss_clean($this->input->post("category"));
        $status = $this->security->xss_clean($this->input->post("status"));
        $default_amount = $this->security->xss_clean(($this->input->post("amount")));

        if (empty($category) or empty($status))
            return false;

        $url = str_replace(" ", "-", $this->replace_multiple_spaces($this->remove_none_utf_char($this->remove_special_chars($category))));
        $url = $this->check_url_for_duplicates(strtolower($url), "product_categories", "url");
        $this->db->insert("product_categories",
            array("category" => $category,
                "status" => $status,
                "date_created" => date("Y-m-d"),
                "user" => $user,
                "default_amount" => $default_amount,
                "url" => $url));
        return true;
    }

    /**
     * @throws Exception
     */
    function new_sub_category($user): bool
    {
        if (! $user)
            return false;
        $category = $this->security->xss_clean($this->input->post("category"));
        $status = $this->security->xss_clean($this->input->post("status"));

        if (empty($category) or empty($status))
            return false;

        //print_r($this->input->post());
        $url = str_replace(" ", "-", $this->replace_multiple_spaces($this->remove_none_utf_char($this->remove_special_chars($category))));
        $url = $this->check_url_for_duplicates(strtolower($url), "product_sub_categories", "url");
        $this->db->insert("product_sub_categories",
            array("category" => $category,
                "status" => $status,
                "date_created" => date("Y-m-d"),
                "user" => $user,
                "url" => $url));
        return true;
    }

    /**
     * @throws Exception
     */
    function get_categories($active = false): MysqliDb|array|string
    {
        if ($active)
            $this->db->where("status", 1);

        $this->db->orderBy("category", "asc");
        return $this->db->get("product_categories", null, "id, 
        url, 
        category, 
        status, 
        date_created,
        default_amount,
        image,
        image_origin, 
        date_updated, (select names from basic_info where user = product_categories.user) as names");
    }

    /**
     * @throws Exception
     */
    function get_sub_categories($active = false): MysqliDb|array|string
    {
        if ($active)
            $this->db->where("status", 1);
        
        $this->db->orderBy("category", "asc");
        return $this->db->get("product_sub_categories", null, "id, 
        url, 
        category, 
        status, 
        priority,
        display,
        date_created, 
        date_updated, (select names from basic_info where user = product_sub_categories.user) as names");
    }

    function get_category_id_by_url($url, $sub_category = false) {
        $url = $this->security->xss_clean($url);
        $table = ! $sub_category ? "product_categories" : "product_sub_categories";
        $this->db->where("url", $url);
        return $this->db->getValue($table, "id");
    }

    /**
     * @throws Exception
     */
    function get_category_attributes($category, $status = false): MysqliDb|array|string
    {
        if ($status)
            $this->db->where("product_sub_categories.status", 1);
        $this->db->where("products.category", $category);
        $this->db->groupBy("sub_category");
        $this->db->join("product_sub_categories", "product_sub_categories.id = products.sub_category");
        return $this->db->get("products", null, "product_sub_categories.url, product_sub_categories.category");
    }

}