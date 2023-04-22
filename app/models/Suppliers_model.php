<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-24
 * Time: 17:18
 */

class Suppliers_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function get_suppliers($status = false, $url = false) {
        if ($status)
            $this->db->where("status", 1);
        if ($url) {
            $url = $this->xss_clean($url);
            //If a numeric id is passed, lets map it to the supplier's id
            $this->db->where(is_numeric($url) ? "supplier_id" : "url", $url);
        }

        $this->db->orderBy("supplier", "asc");
        return $this->db->get("product_suppliers", null,
            "id, 
            supplier, 
            contacts, 
            email, 
            description, 
            user, 
            date_created, 
            date_updated, 
            status,
            url, 
            supplier_id,
            (select photo from product_supplier_images where product_supplier_images.supplier = product_suppliers.id and feature_photo = 1) as photo,
            (select id from supplier_requests where user = supplier_id order by supplier_requests.id desc limit 1) as application,
            (select names from basic_info where user = product_suppliers.user) as names,
            (select names from basic_info where user = product_suppliers.supplier_id) as suppler_name");
    }

    function new_supplier($user): bool
    {
        if (! $user)
            return false;
        $supplier = $this->xss_clean($this->input->post("supplier"));
        $status = $this->xss_clean($this->input->post("status"));

        if (empty($supplier) or empty($status))
            return false;

        //print_r($this->input->post());
        $url = str_replace(" ", "-", $this->replace_multiple_spaces($this->remove_none_utf_char($this->remove_special_chars($supplier))));
        $url = $this->check_url_for_duplicates(strtolower($url), "product_suppliers", "url");
        $email = $this->input->post("email");
        $contacts = $this->input->post("phone");
        $description = $this->input->post("description");
        $supplier_id = $this->input->post("user");
        $this->db->insert("product_suppliers",
            array("supplier" => $supplier,
                "email" => $email,
                "contacts" => $contacts,
                "description" => $description,
                "status" => $status,
                "date_created" => date("Y-m-d"),
                "user" => $user,
                "supplier_id" => $supplier_id,
                "url" => $url));
        if ($supplier_id)
            $this->db->rawQuery("update supplier_requests set status = 1 where user = ?", array($supplier_id));

        return true;
    }

    /**
     * @throws Exception
     */
    function edit_supplier($user): bool
    {
        if (! $user)
            return false;
        $supplier = $this->xss_clean($this->input->post("supplier"));
        if (empty($supplier))
            return false;

        $supplier_id = $this->input->post("supplier_id");
        $id = $this->input->post("id");
        //$url = str_replace(" ", "-", $this->replace_multiple_spaces($this->remove_none_utf_char($this->remove_special_chars($supplier))));
        //$url = $this->check_url_for_duplicates(strtolower($url), "product_suppliers", "url");
        $email = $this->xss_clean($this->input->post("email"));
        $contacts = $this->xss_clean($this->input->post("phone"));
        $description = $this->input->post("description");

        $this->db->where("id", $id);
        $this->db->update("product_suppliers",
            array(
                "supplier" => $supplier,
                "email" => $email,
                "contacts" => $contacts,
                "supplier_id" => $supplier_id,
                "description" => $description

               ));
        if ($supplier_id)
            $this->db->rawQuery("update supplier_requests set status = 1 where user = ?", array($supplier_id));
        return true;
    }

    /**
     * @throws Exception
     */
    function add_thumbnail($file_name, $user, $product) {
        $this->db->insert("product_supplier_images", array("photo" => $file_name,
            "user" => $user,
            "supplier" => $product,
            "date_created" => date("Y-m-d")));
    }

    /**
     * @throws Exception
     */
    function get_supplier_thumbnails($status, $supplier): MysqliDb|array|string
    {
        if ($status)
            $this->db->where("status", 1);
        $this->db->where("supplier", $supplier);
        $this->db->orderBy("feature_photo", "desc");
        return $this->db->get("product_supplier_images", null, "photo, id,
        supplier, user, 
        status, date_created,feature_photo,
        (select names from basic_info where user = product_supplier_images.user) as names");
    }

    /**
     * @throws Exception
     */
    function make_feature_photo($photo, $supplier, $user) {
        if (empty($user))
            return false;

        $action = $this->input->get("i");
        if (! is_numeric($action))
            return false;
        $action = $action == 2 ? 1 : 0;
        $this->db->where("supplier", $supplier);
        $this->db->update("product_supplier_images", array("feature_photo" => 0));

        $this->db->where("id", $photo);
        $this->db->update("product_supplier_images", array("feature_photo" => $action));
    }

    /**
     * @throws Exception
     */
    function save_supplier_application($user) {
        if (! $user)
            return false;
        //print_r($this->input->post());
        $this->db->where("user", $user);
        if ($this->db->getValue("supplier_requests", "id"))
            return false;

        $company = $this->xss_clean($this->input->post("company"));
        $type = $this->xss_clean($this->input->post("business-type"));
        $description = $this->input->post("description");
        $location = $this->xss_clean($this->input->post("location"));
        $numbers = $this->xss_clean($this->input->post("numbers"));
        $products = $this->xss_clean($this->input->post("products"));
        $district = $this->xss_clean($this->input->post("district"));
        $country = $this->xss_clean($this->input->post("country"));
        $email = $this->xss_clean($this->input->post("email"));
        $website = $this->xss_clean($this->input->post("website"));

        if (empty ($company) or empty($description) or empty($numbers))
            return false;

        $this->db->insert("supplier_requests",
            array("date_requested" => date("Y-m-d"),
                "business_name" => $company,
                "description" => $description,
                "address" => $location,
                "phone_number" => $numbers,
                "items_sold" => $products,
                "district" => $district,
                "country" => $country,
                "business_type" => $type,
                "email" => $email,
                "website" => $website,
                "user" => $user));
        $this->db->where("user", $user);
        $this->db->update("basic_info", array("supplier" => 1));
    }

    function get_supplier_application_data($user): bool|array|string|null
    {
        if (! $user)
            return false;

        $this->db->where("user", $user);
        return $this->db->getOne('supplier_requests', "date_requested, business_name, 
        description, address, phone_number, status, items_sold, district, country, business_type, email, website, 
        (select country from countries where id = country) as country_name, (select district from districts where id = district) as district_name");
    }

    /**
     * @throws Exception
     */
    function get_supplier_applications($application = false): array
    {
        $this->db->pageLimit = 100;
        $page = 1;
        if ($application)
            $this->db->where("id", $application);

        $this->db->orderBy("id", "desc");
        return $this->db->paginate('supplier_requests', $page, "id, date_requested, business_name, 
        description, address, phone_number, status, items_sold, district, country, business_type, email, website,
        user,
        status,
        (select url from product_suppliers where product_suppliers.supplier_id = supplier_requests.user order by id desc limit 1) as supplier_url,
        (select names from basic_info where user = supplier_requests.user) as names,
        (select country from countries where id = country) as country_name, (select district from districts where id = district) as district_name");
    }

    /**
     * @throws Exception
     */
    function update_supplier_application($user) {
        if (! $user)
            return false;

        $company = $this->xss_clean($this->input->post("company"));
        $description = $this->input->post("description");
        $location = $this->xss_clean($this->input->post("location"));
        $numbers = $this->xss_clean($this->input->post("numbers"));
        $products = $this->xss_clean($this->input->post("products"));
        $email = $this->xss_clean($this->input->post("email"));
        $website = $this->xss_clean($this->input->post("website"));

        if (empty ($company) or empty($description) or empty($numbers))
            return false;

        $this->db->where("user", $user);
        $this->db->update("supplier_requests",
            array("date_requested" => date("Y-m-d"),
                "business_name" => $company,
                "description" => $description,
                "address" => $location,
                "phone_number" => $numbers,
                "items_sold" => $products,
                "email" => $email,
                "website" => $website,
                ));
    }

}