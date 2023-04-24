<?php

use JetBrains\PhpStorm\ArrayShape;

/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-22
 * Time: 18:26
 */

class Products_model extends Model
{
    public $search_permutations = "";
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function get_sizes(): MysqliDb|array|string
    {
        $this->db->orderBy("size", "asc");
        return $this->db->get("product_general_sizes", null, "id, 
        size, 
        status, 
        date_created, 
         (select names from basic_info where user = product_general_sizes.user) as names");
    }

    /**
     * @throws Exception
     */
    function new_size($user): bool
    {
        if (! $user)
            return false;
        $size = $this->security->xss_clean($this->inputs->post("size"));
        $status = $this->security->xss_clean($this->inputs->post("status"));

        if (empty($size) or empty($status))
            return false;

        $this->db->insert("product_general_sizes",
            array("size" => $size,
                "status" => $status,
                "date_created" => date("Y-m-d"),
                "user" => $user
               ));

        return true;
    }

    /**
     * @throws Exception
     */
    function get_colors(): MysqliDb|array|string
    {
        $this->db->orderBy("color", "asc");
        return $this->db->get("product_colors", null, "id, 
        color, 
        status, 
        date_created, 
         (select names from basic_info where user = product_colors.user) as names");
    }

    /**
     * @throws Exception
     */
    function new_color($user): bool
    {
        if (! $user)
            return false;
        $color = $this->security->xss_clean($this->inputs->post("color"));
        $status = $this->security->xss_clean($this->inputs->post("status"));

        if (empty($color) or empty($status))
            return false;

        $this->db->insert("product_colors",
            array("color" => $color,
                "status" => $status,
                "date_created" => date("Y-m-d"),
                "user" => $user
            ));
        return true;
    }

    /**
     * @throws Exception
     */
    function new_product($user): bool|string
    {
        if (! $user)
            return false;
        //print_r($this->inputs->post());
        $product = $this->security->xss_clean($this->inputs->post("product"));
        $url = str_replace(" ", "-", $this->replace_multiple_spaces($this->remove_none_utf_char($this->remove_special_chars($product))));
        $url = $this->check_url_for_duplicates(strtolower($url), "products", "url");
        $new_price = $this->security->xss_clean($this->inputs->post("price_one"));
        $old_price = $this->security->xss_clean($this->inputs->post("price_two"));
        $sizes = $this->inputs->post("sizes");
        $color = $this->inputs->post("color");
        $summary = $this->security->xss_clean($this->inputs->post("summary"));
        $description = $this->inputs->post("description");
        $currency = $this->security->xss_clean($this->inputs->post("currency"));
        $supplier = $this->security->xss_clean($this->inputs->post("supplier"));
        $measurement = $this->security->xss_clean($this->inputs->post("measurement"));
        $category = $this->security->xss_clean($this->inputs->post("category"));
        $keywords = $this->security->xss_clean($this->inputs->post("keywords"));
        $sub_category = $this->security->xss_clean($this->inputs->post("sub-category"));
        $product_type = $this->security->xss_clean($this->inputs->post("p_type"));
        $id = $this->db->insert("products", array("name" => $product,  "p_type" => $product_type, "metric" => $measurement, "currency" => $currency,
            "description" => $description,"keywords" => $keywords, "summary" => $summary, "price_1" => $new_price, "price_2" => $old_price, "date_added" => date("Y-m-d"),
            "user" => $user, "category" => $category, "sub_category" => $sub_category, "supplier" => $supplier, "url" => $url));
        if (! empty($sizes))
            foreach($sizes as $size => $i)
                $this->db->insert("product_sizes", array("size" => $i, "user" => $user, "date_created" => date("Y-m-d"), "product" => $id));
        if (! empty($color))
            foreach($color as $size => $i)
                $this->db->insert("product_set_colors", array("color" => $i, "user" => $user, "date_created" => date("Y-m-d"), "product" => $id));
        return $url;
    }

    /**
     * @throws Exception
     */
    function get_product_info($product, $status = false, $record_country = false, $user = false): bool|array
    {
        $product = $this->get_product_id_by_url($this->security->xss_clean($product));
        if ($this->session->data("preference"))
            $this->db->where("p_type",$this->session->data("preference") );

        if (! $product)
            return false;
        $this->db->where("id", $product);
        if($status)
            $this->db->where("status", 1);
        $data = $this->db->getOne("products", "keywords, products.id, name, metric, currency, description, summary, price_1, price_2,
        feature_photo, 
        rates,p_type,
         date_added, 
        date_updated, user, metric,
        in_stock,
        (select supplier from product_suppliers where product_suppliers.id = products.supplier) as supplier_name,
        (select url from product_suppliers where product_suppliers.id = products.supplier) as supplier_url,
        (select currency from product_currency where id = products.currency) as currency_name,
        (select category from product_categories where product_categories.id = products.category) as product_category, category,
         sub_category, 
         (select category from product_sub_categories where product_sub_categories.id = products.sub_category) as product_sub_category,
         sub_category,
          supplier,
           url, 
           status,
            (select names from basic_info where user = products.user) as names
         ");

        $this->db->where("product", $product);
        $colors = $this->db->get("product_set_colors", null, "color");
        $color_array = [];
        foreach($colors as $color)
            $color_array[] = $color['color'];

        $this->db->where("product", $product);
        $sizes = $this->db->get("product_sizes", null, "size");
        $size_array = [];
        foreach($sizes as $size)
            $size_array[] = $size['size'];

        /*
         * lets record the region from which the product was viewed from
         */
        if($record_country and is_array($data)) {
            $this->model("User_agents_model");
            $location_details = $this->model->User_agents_model->get_client_location();
            $user = $user ?? NULL;
            $id = $this->db->insert("products_viewed", array("product" => $product, "user" => $user));
            $this->db->insert("products_view_location",
                array("product_view_id" => $id, "country" => $location_details['country'],
                    "city" => $location_details['country'],
                    "region" => $location_details['region']));
        }
        return array("product_info" => $data, "colors" => $color_array, "sizes" => $size_array, "thumbnails" => $this->get_product_thumbnails($product));
    }

    /**
     * @throws Exception
     */
    function get_all_products($limit = null, $status = false, $category = false, $supplier = false, $sub_category = false): array
    {
        if ($status) {
            $this->db->where("status", 1);
            $this->db->orderBy("RAND()", "desc");
        }

        if ($category)
            $this->db->where("category", $category);

        if ($supplier)
            $this->db->where("supplier", $supplier);

        if ($sub_category)
            $this->db->where("sub_category", $sub_category);

//        if ($this->session->data("preference"))
//            $this->db->where("p_type",$this->session->data("preference") );

        $page = $this->inputs->get("page") ?: 1;
        $page = (int)$page;
        $this->db->pageLimit = is_null($limit) ? 200 : 12;

        $this->db->orderBy("id", "desc");
        return $this->db->paginate("products", $page,"products.id, name, metric, currency, description, summary, price_1, price_2,
        feature_photo, 
        rates,p_type,
         date_added, 
        date_updated, user, 
        (select photo from product_images where product = products.id and status = 1 and feature_photo = 0 order by RAND() desc limit 1) as photo,
        (select (sum(rate) / count(product_rate.id)) from product_rate where product_rate.product = products.id) as total_rates,
        (select currency from product_currency where id = products.currency) as currency_name,
        (select category from product_categories where product_categories.id = products.category) as product_category, category,
         sub_category, (select category from product_sub_categories where product_sub_categories.id = products.sub_category) as product_sub_category,
         sub_category, supplier, url, status, (select names from basic_info where user = products.user) as names
         ");
    }

    /**
     * @throws Exception
     */
    function get_most_rated_products($status = false, $category = false, $special_category = false, $table = false, $sub_category = false): array
    {
        /*
         * Table is containing special tables eg best deals, etc
         */
        $page = 1;
        if ($status)
            $this->db->where("status", 1);
        $this->db->pageLimit = 12;
        if ($category and ! $special_category and $sub_category)
            $this->db->where("products.category", $category);
        if ($special_category)
            $this->db->join($table, $table . ".product = products.id");

        if ($sub_category)
            $this->db->where("products.sub_category", $category);

        $this->db->join("product_rate", "product_rate.product = products.id", "left");
        if ($this->session->data("preference"))
            $this->db->where("p_type",$this->session->data("preference") );

        $this->db->groupBy("products.id");
        $this->db->orderBy("products_count", "desc");
        return $this->db->paginate("products", $page, "sum(product_rate.rate) as products_count,p_type, products.id, name, metric, currency, description, summary, price_1, price_2,
        feature_photo, 
        rates,
         products.date_added, 
        products.date_updated, products.user,
                (select (sum(rate) / count(product_rate.id)) from product_rate where product_rate.product = products.id) as total_rates,
        (select currency from product_currency where id = products.currency) as currency_name,
        (select category from product_categories where product_categories.id = products.category) as product_category, category,
         sub_category, (select category from product_sub_categories where product_sub_categories.id = products.sub_category) as product_sub_category,
         sub_category, supplier, url, status, (select names from basic_info where user = products.user) as names");
    }

    function get_most_sold_products($status = false, $category = false, $special_category = false, $table = false,$sub_category = false): array
    {
        /*
        * Table is containing special tables eg best deals, etc
        */
        $page = 1;
        if ($status) {
            $this->db->where("status", 1);
            //$this->db->orderBy("RAND()", "desc");
        }
        $this->db->pageLimit = 20;
        if ($category and ! $special_category and ! $sub_category)
            $this->db->where("products.category", $category);
        if ($special_category)
            $this->db->join($table, $table . ".product = products.id");

        if ($sub_category)
            $this->db->where("products.sub_category", $category);
        if ($this->session->data("preference"))
            $this->db->where("p_type",$this->session->data("preference") );

        $this->db->join("ordered_items", "ordered_items.product = products.id");
        $this->db->groupBy("products.id");
        $this->db->orderBy("products_count", "desc");
        $data = $this->db->paginate("products", $page, "count(ordered_items.product) as products_count, products.id, name, metric, currency, description, summary, price_1, price_2,
        feature_photo, 
        rates,p_type,
         products.date_added, 
        products.date_updated, products.user,
                (select (sum(rate) / count(product_rate.id)) from product_rate where product_rate.product = products.id) as total_rates,
        (select currency from product_currency where id = products.currency) as currency_name,
        (select category from product_categories where product_categories.id = products.category) as product_category, category,
         sub_category, (select category from product_sub_categories where product_sub_categories.id = products.sub_category) as product_sub_category,
         sub_category, supplier, url, status, (select names from basic_info where user = products.user) as names");
        //echo $this->db->getLastQuery(); die();
        return $data;
    }

    /**
     * @throws Exception
     */
    function special_category_products($table): array
    {
        return $this->get_special_categories(null, $table);
    }

    /**
     * @throws Exception
     */
    function get_product_id_by_url($url) {
        $this->db->where("url", $url);
        return $this->db->getValue("products", "id");
    }


    /**
     * @throws Exception
     */
    function update_product($user) {
        if (! $user)
            return false;
        //print_r($this->inputs->post());
        $id = $this->inputs->post("id");
        $product = $this->security->xss_clean($this->inputs->post("product"));
        $new_price = $this->security->xss_clean($this->inputs->post("price_one"));
        $old_price = $this->security->xss_clean($this->inputs->post("price_two"));
        $summary = $this->security->xss_clean($this->inputs->post("summary"));
        $description = $this->inputs->post("description");
        $currency = $this->security->xss_clean($this->inputs->post("currency"));
        $supplier = $this->security->xss_clean($this->inputs->post("supplier"));
        $measurement = $this->security->xss_clean($this->inputs->post("measurement"));
        $category = $this->security->xss_clean($this->inputs->post("category"));
        $sub_category = $this->security->xss_clean($this->inputs->post("sub-category"));
        $keywords = $this->security->xss_clean($this->inputs->post("keywords"));
        $this->db->where("id", $id);
        $this->db->update("products", array("name" => $product, "keywords" => $keywords, "metric" => $measurement, "currency" => $currency,
            "description" => $description, "summary" => $summary, "price_1" => $new_price, "price_2" => $old_price, "date_added" => date("Y-m-d"),
            "user" => $user, "category" => $category, "sub_category" => $sub_category, "supplier" => $supplier));
    }

    function update_product_size($user, $table, $column) {
        if (! $user)
            return false;
        $action = $this->inputs->post("action");
        $value = $this->inputs->post("value");
        $product = $this->inputs->post("product");
        if ($action) {
            $this->db->insert($table, array($column => $value,
                "date_created" => date("Y-m-d"),
                "product" => $product,
                "user" => $user));
        } else {
            $this->db->where("product", $product);
            $this->db->where($column, $value);
            $this->db->delete($table);
        }
    }

    /**
     * @throws Exception
     */
    function get_product_thumbnails($product): MysqliDb|array|string
    {
        $this->db->where("product", $product);
        $this->db->orderBy("id", "desc");
        return $this->db->get("product_images", null, "photo, id,
        product, user, 
        status, date_created,feature_photo,
        (select names from basic_info where user = product_images.user) as names");
    }

    /**
     * @throws Exception
     */
    function add_thumbnail($file_name, $user, $product) {
        $this->db->insert("product_images", array("photo" => $file_name,
            "user" => $user,
            "product" => $product,
            "date_created" => date("Y-m-d")));
    }

    /**
     * @throws Exception
     */
    function make_feature_photo($photo, $product, $user) {
        if (empty($user))
            return false;

        $action = $this->inputs->get("i");
        if (! is_numeric($action))
            return false;
        $action = $action == 2 ? 1 : 0;
        $this->db->where("product", $product);
        $this->db->update("product_images", array("feature_photo" => 0));

        $this->db->where("id", $photo);
        $this->db->update("product_images", array("feature_photo" => $action));

        $this->db->where("id", $photo);
        $photo_link = $this->db->getValue("product_images", "photo");

        $this->db->where("id", $product);
        $this->db->update("products", array("feature_photo" => $photo_link));
    }

    /**
     * @throws Exception
     */
    function activate_product_attributes($user) {
        if (empty($user))
            return false;
        //print_r($this->inputs->post());
        /*
         * This is a general method that changes status to all product attributes to there different tables
         */
        $column_data = $this->inputs->post("data");
        $table = $this->security->xss_clean($this->inputs->post("page"));
        $action = $this->security->xss_clean($this->inputs->post("action"));

        $action = $action == 2 ? 0 : 1;

        if (empty($column_data))
            return false;

        foreach ($column_data as $pk => $key)/*Pk is primary key */{
            $this->db->where("id", $key);
            $this->db->update($table, array("status" => $action));
        }
        echo $this->db->getLastQuery();
    }

    /**
     * @throws Exception
     */
    function manage_special_categories($user) {
        if (empty($user))
            return false;
        //print_r($this->inputs->post());
        /*
         * This is a general method that changes status to all product attributes to there different tables
         */
        $column_data = $this->inputs->post("data");
        $table = $this->security->xss_clean($this->inputs->post("page"));
        $action = $this->security->xss_clean($this->inputs->post("action"));

        /*
         * Action 1 is adding to special category
         * Action 2 is deleting
         */
        if (empty($column_data))
            return false;

        if ($action == 1) {
            /*
             * Before adding, we need to avoid duplicates
             */
            foreach ($column_data as $pk => $key)/*Pk is primaey key */{
                $this->db->where("product", $key);
                $data = $this->db->getValue($table, "id");
                if ($data)
                    continue; //We avoid duplicates so we check if the data exists in the table before insertion
                $this->db->insert($table, array("product" => $key, "user" => $user));
            }

        } else {
            foreach ($column_data as $pk => $key)/*Pk is primaey key */{
                $this->db->where("product", $key);
                $this->db->delete($table);
            }
        }
    }

    /**
     * @throws Exception
     */
    function get_special_categories($limit = 10, $table = '', $status = true): array
    {
        $page = $this->inputs->get("page") ?: 1;
        $page = (int)$page;
        $this->db->pageLimit = 20;
        if ($status) {
            $this->db->where("Status", 1);
            $this->db->orderBy("RAND()", "desc");
        }
        $this->db->orderBy("id", "desc");
        if ($this->session->data("preference"))
            $this->db->where("p_type",$this->session->data("preference") );

        $this->db->join("products", "products.id = " . $table . ".product", "left");
        return $this->db->paginate($table, $page, "products.id, name, metric, currency, description, summary, price_1, price_2,
        feature_photo, 
        rates,p_type,
         products.date_added,
         (select (sum(rate) / count(id)) from product_rate where product = products.id) as total_rates, 
        products.date_updated, products.user, metric,
        (select currency from product_currency where id = products.currency) as currency_name,
        (select category from product_categories where product_categories.id = products.category) as product_category, category,
         sub_category, (select category from product_sub_categories where product_sub_categories.id = products.sub_category) as product_sub_category,
         sub_category, supplier, url, status, (select names from basic_info where user = products.user) as names
         ");
    }

    /**
     * @throws Exception
     */
    #[ArrayShape(["colors" => "array|\MysqliDb|string", "sizes" => "array|\MysqliDb|string"])] function get_product_attribute($product) {
        $this->db->where("product", $product);
        $this->db->join("product_colors", "product_colors.id = product_set_colors.color");
        $colors = $this->db->get("product_set_colors", null, "product_colors.color, product_colors.id");

        $this->db->where("product", $product);
        $this->db->join("product_general_sizes", "product_general_sizes.id = product_sizes.size");
        $sizes = $this->db->get("product_sizes", null, "product_general_sizes.size, product_general_sizes.id");
        return array("colors" => $colors, "sizes" => $sizes);
    }

    function get_products_by_category(): array
    {
        $this->model("Categories_model");
        $categories = $this->model->Categories_model->get_categories(true);
        $category_data = [];
        foreach ($categories as $item) {
            $item['products'] = $this->get_all_products(6,  true, $item['id']);
            $category_data[] = $item;
        }
        return $category_data;
    }

    /**
     * @throws Exception
     */
    function get_cart_items($cart_items): bool|array
    {
        if (empty($cart_items))
            return false;

        $this->db->where("id", $cart_items, "IN");
        $data = $this->db->get("products", null,"products.id, name, metric, currency, description, summary, price_1, price_2,
        feature_photo, 
        rates,p_type,
         date_added, 
        date_updated, user, 
        (select currency from product_currency where id = products.currency) as currency_name,
        (select (sum(rate) / count(id)) from product_rate where product = products.id) as total_rates,
        (select category from product_categories where product_categories.id = products.category) as product_category, category,
         sub_category, (select category from product_sub_categories where product_sub_categories.id = products.sub_category) as product_sub_category,
         sub_category, supplier, url, status, (select names from basic_info where user = products.user) as names
         ");
        $data_array = [];
        foreach ($data as $item) {
            $item['attributes'] = $this->get_product_attribute($item['id']);
            $data_array[] = $item;
        }
        return $data_array;
    }

    /**
     * @throws Exception
     */
    function search_products($user): array
    {
        $search_query = $this->security->xss_clean(trim($this->inputs->get("q")));
        $page = $this->inputs->get("page") ?: 1;
        $page = (int)$page;
        if(empty($search_query))
            return array();

        if (strlen($search_query) < 2)
            return array();


        $user = $user ? $user : null;

        $this->db->pageLimit = 20;

        $search_array = explode(" ", $search_query);
        $i = 0; //Limiting he search words to only 4
        foreach ($search_array as $item) {
            if ($i > 3)
                break; //So when our search words are greater than 4, we terminate the loop
            $this->db->orWhere("LOWER(name)", "%" . strtolower($item) . "%", "like");
            $i++;
        }
        if ($this->session->data("preference"))
            $this->db->where("p_type",$this->session->data("preference") );

        $this->db->where("status", 1);
        $data = $this->db->paginate("products", $page,"products.id, name, metric, currency, description, summary, price_1, price_2,
                feature_photo, 
                rates,p_type,
                 date_added, 
                date_updated, user, 
                (select (sum(rate) / count(id)) from product_rate where product = products.id) as total_rates,
                (select currency from product_currency where id = products.currency) as currency_name,
                (select category from product_categories where product_categories.id = products.category) as product_category, category,
                 sub_category, (select category from product_sub_categories where product_sub_categories.id = products.sub_category) as product_sub_category,
                 sub_category, supplier, url, status, (select names from basic_info where user = products.user) as names
                 ");
        $id = $this->db->insert("products_search_base", array("user" => $user, "search_term" => $search_query));
        if (! empty($data))
            foreach ($data as $item)
                $this->db->insert("products_searched", array("user" => $user, "product" => $item['id'], "search_query" => $id));

        return $data;
    }

    function pc_permute($items, $column,  $perms = array( )) {
        if (empty($items)) {
            $this->db->orWhere("( LOWER(" . $column . ") like ?)", array("%" . join(' ', $perms) . "%"));
             //$this->search_permutations = $this->search_permutations ." (". $column . " like '" . join(' ', $perms) . "%') OR ";

        }  else {
            for ($i = count($items) - 1; $i >= 0; --$i) {
                $new_items = $items;
                $new_perms = $perms;
                list($foo) = array_splice($new_items, $i, 1);
                array_unshift($new_perms, $foo);
                $this->pc_permute($new_items, $column, $new_perms);
            }
            //return $string;
        }
    }

    /**
     * @throws Exception
     */
    function Get_pending_confirmation_orders(): MysqliDb|array|string
    {
        $this->db->where("payment_confirmation", 1);
        $this->db->where("orders.mail", 0);
        $this->db->join("basic_info", "basic_info.user = orders.user");
        return $this->db->get("orders", null, array("orders.id, amount, orders.date_created, names, email, (select email from addresses where user = orders.user) as alt_email"));
    }

    /**
     * @throws Exception
     */
    function payment_confirmation_mail_sent($order) {
        $this->db->where("id", $order);
        $this->db->update("orders", array("mail" => 1));
    }

    /**
     * @throws Exception
     */
    function rate_product($rate, $product, $user): bool
    {
        if (! $user)
            return false;
        if (! is_numeric($product) or ! is_numeric($rate) or $rate < 1 or $rate > 5)
            return false;
        $this->db->where("user", $user);
        $this->db->where("product", $product);
        $id = $this->db->getValue("product_rate", "id");
        if ($id) {
            $this->db->where("id", $id);
            $this->db->update("product_rate", array("rate" => $rate));
        }
        else
            $this->db->insert("product_rate", array("user" => $user, "product" => $product, "rate" => $rate));
        return true;

    }

    /**
     * @throws Exception
     */
    function comment_on_product($product, $comment, $user): bool
    {
        if (! $user)
            return false;
        echo 1;
        if (empty($comment) or empty($product) or ! is_numeric($product))
            return false;
        $comment = $this->security->xss_clean($comment);
        $this->db->insert("product_views", array("product" => $product, "user" => $user, "comment" => $comment));
        return true;
    }

    /**
     * @throws Exception
     */
    function delete_photo() {
        $image_name = $this->inputs->get("i");
        if (! $image_name)
            return false;
        $image_path = "media/products_thumbnails/" . $image_name;
        $this->db->where("photo", $image_name);
        if ($this->db->delete("product_images"))
            unlink($image_path);
    }

    /**
     * @throws Exception
     */
    function get_viewed_products($user): bool|array
    {
        if (! $user)
            return false;

        $page = 1;
        $this->db->join("products", "products.id = products_viewed.product");
        $this->db->groupBy("products_viewed.product");
        return $this->db->paginate("products_viewed", $page,"products.id as product, products_viewed.id, name, metric, currency, description, summary, price_1, price_2,
                feature_photo,
                count(products_viewed.id) as views, 
                rates,p_type,
                                 sub_category, (select category from product_sub_categories where product_sub_categories.id = products.sub_category) as product_sub_category,
                         (select category from product_categories where product_categories.id = products.category) as product_category, category,
                 products_viewed.date_added, 
                    date_updated, products_viewed.user, 
                 sub_category, supplier, url, status, (select names from basic_info where user = products.user) as names
                 ");
    }

    /**
     * @throws Exception
     */
    function add_thumbnail_url($user) {
        if (! $user)
            return false;
        $id = $this->security->xss_clean($this->inputs->post("product"));
        $url = $this->security->xss_clean($this->inputs->post("url"));

        $this->db->where("product", $id);
        $this->db->where("photo", $url);
        $data = $this->db->getValue("product_images", "id");
        if ($data) {
            $this->db->where("id", $data);
            $this->db->delete("product_images");
        }
        else
            $this->db->insert("product_images", array("photo" => $url, "product" => $id, "user" => $user, "date_created" => date("Y-m-d")));
    }

    /**
     * @throws Exception
     */
    function get_supplier_order_summary($id): bool|array|string
    {
        if (! $id)
            return false;
        return $this->db->rawQuery("
        select count(products.id) as products, products.supplier as supplier_1, 
        (select count(ordered_items.id) from ordered_items left join orders on orders.id = ordered_items.product left join products on products.id = ordered_items.product where products.supplier = supplier_id) as orders from products join product_suppliers on product_suppliers.id = products.supplier where supplier_id = ?", array($id));
    }

    function get_products_per_category(): array
    {
        $this->db->where("status", 1);
        $this->db->where("display", 1);
        $this->db->orderBy("priority", "desc");
        $data = $this->db->get("product_sub_categories", null, array("category, id, url"));
        $sub_category_data = [];
        foreach ($data as $item) {
            $item['products'] = $this->get_all_products(null, true, false, false, $item['id']);
            $sub_category_data[] = $item;
        }
        return $sub_category_data;
    }

    /**
     * @throws Exception
     */
    function duplicate_product($user, $item): bool
    {
        if ($user[0]['role'] != 1)
            return false;

        //echo $item;
        $this->db->where("id", $item);
        $item_data = $this->db->getOne("products", "*");
        if (empty($item_data))
            return false;
        $url = $this->check_url_for_duplicates(strtolower($item_data['url']), "products", "url");
        //echo $url;

        $thumbnails = $this->get_product_thumbnails($item);
        $item_data['url'] = $url;
        $item_data['date_added'] = date("Y-m-d");
        $item_data['user'] = $user[0]['user_id'];
        $item_data['status'] = 0;
        unset($item_data['id']);
        $product = $this->db->insert("products", $item_data);
        if (! empty($thumbnails)) {
            foreach ($thumbnails as $list) {
                unset($list['id']);
                unset($list['names']);
                $list['user'] = $user[0]['user_id'];
                $list['date_created'] = date("Y-m-d");
                $list['product'] = $product;
                $this->db->insert("product_images", $list);
            }
        }
        return $url;
    }
}