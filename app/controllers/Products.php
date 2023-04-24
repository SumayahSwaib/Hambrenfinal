<?php

class Products extends Controller
{
    private $id = '';
    function __construct()
    {
        parent::__construct();
        $this->controller("Home");

        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Currency_model");
        $this->model("Products_model");
        $this->model("Categories_model");
        $this->model("Suppliers_model");
        $this->model("Metrics_model");
        $this->controller("Home");
        $this->load_default();
    }

    function load_default () {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->id = $id;
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
    }

    function index($category) {
        $special_categories = array("featured", "trending", "best_deals", "special_offer");
        $special_category = false;
        $table = false; //For special products
        if (! in_array($category, $special_categories)) {
            $this->smarty->assign("domain", $this->model->User_model->active_domain());
            $category = $this->model->Categories_model->get_category_id_by_url($category);
            $this->smarty->assign("products", $this->model->Products_model->get_all_products(10, true, $category));
        }else {
            $special_category = true;
            if (strcmp($category, "featured") == 0)
                $table = "products_featured";

            elseif (strcmp($category, "best_deals") == 0)
                $table = "products_best_deals";

            elseif (strcmp($category, "special_offer") == 0)
                $table = "products_best_deals";
            $this->smarty->assign("products", $this->model->Products_model->special_category_products($table));
        }
        $this->smarty->display("products/index.tpl");
    }

    function item($product) {
        $product = $this->model->Products_model->get_product_info($product, true, true, $this->id);
        $category = $product['product_info']['category'] ?? false;
        //print_r($product); die();
        $this->smarty->assign("products", $product);
        $this->smarty->display("products/item.tpl");
    }

    function shop() {
        $this->smarty->display("products/shop.tpl");
    }

}