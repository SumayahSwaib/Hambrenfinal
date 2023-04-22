<?php

use JetBrains\PhpStorm\NoReturn;

/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-16
 * Time: 21:59
 */

class Products extends Controller
{

    #[NoReturn] function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Currency_model");
        $this->model("Products_model");
        $this->model("Categories_model");
        $this->model("Suppliers_model");
        $this->model("Metrics_model");
        $this->controller("Home");

    }

    function index($category) {
        $special_categories = array("featured", "trending", "best_deals", "special_offer");
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", ucfirst($category));
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

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("category_top_rated", $this->model->Products_model->get_most_rated_products(true, $category, $special_category, $table));
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("sub_categories", $this->model->Categories_model->get_sub_categories(true));
        $this->smarty->assign("category_most_sold_products", $this->model->Products_model->get_most_sold_products(true, $category, $special_category, $table));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("sub_categories", $this->model->Categories_model->get_category_attributes($category, true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("products/index.tpl");
    }

    function product($item) {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $product = $this->model->Products_model->get_product_info($item, true, true, $id);
        $category = $product['product_info']['category'] ?? false;
        $this->smarty->assign("products", $product);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("sub_categories", $this->model->Categories_model->get_category_attributes($category, true));
        $this->smarty->assign("category_top_rated", $this->model->Products_model->get_most_rated_products(true, $category));
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("category_most_sold_products", $this->model->Products_model->get_most_sold_products(true, $category));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->assign("category_products", $this->model->Products_model->get_all_products(10, true, $category));
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("product_attributes", $this->model->Products_model->get_product_attribute($product['product_info']['id'] ?? false));
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", $item);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());

        $this->smarty->assign("sub_categories", $this->model->Categories_model->get_sub_categories(true));
        $this->smarty->display("products/item.tpl");
    }

    /**
     * @throws SmartyException
     */
    function shop() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        if (isset($_SERVER['HTTP_USER_AGENT']) && $_SERVER['HTTP_USER_AGENT'] == "Boosted/jaslac.com")
            $this->mobile_shop();
        else {
            $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
            $this->session->set_user_data("key", $key);
            $this->smarty->assign("key", $key);

            $this->smarty->assign("version", $this->model->Api_model->get_version());
            $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
            $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
            $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
            $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
            $this->smarty->assign("sub_categories", $this->model->Categories_model->get_categories(true));
            $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
            $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
            $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
            $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
            $this->smarty->assign("page", "Shop");
            $this->smarty->assign("category_picks", $this->model->Products_model->get_products_by_category());
            $this->smarty->assign("domain", $this->model->User_model->active_domain());
            $this->smarty->display("products/shop.tpl");
        }
    }

    /**
     * @throws SmartyException
     */
    function mobile_shop() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        if (! $id) {
            $this->smarty->display("login/login.tpl");
            die();
        }
        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(16, true));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->display("products/shop_mobile.tpl");
    }

    function products() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);
        $this->smarty->assign("products", $this->model->Products_model->get_all_products());
        $this->smarty->assign("current_page", "products");
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->display("admin/products/index.tpl");
    }

    function new_product() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("sizes", $this->model->Products_model->get_sizes());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("currencies", $this->model->Currency_model->get_currencies());
        $this->smarty->assign("colors", $this->model->Products_model->get_colors());
        $this->smarty->assign("currencies", $this->model->Currency_model->get_currencies());
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories());
        $this->smarty->assign("sub_categories", $this->model->Categories_model->get_sub_categories());
        $this->smarty->assign("metrics", $this->model->Metrics_model->get_metrics());
        $this->smarty->assign("current_page", "products");
        $this->smarty->display("admin/products/new_product.tpl");
    }

    function sizes() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("sizes", $this->model->Products_model->get_sizes());
        $this->smarty->assign("current_page", "product-size");
        $this->smarty->display("admin/products/sizes/index.tpl");
    }

    function add_new_sizes() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Products_model->new_size($id);
        $this->redirect($this->server->http_refer);
    }

    function colors() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("colors", $this->model->Products_model->get_colors());
        $this->smarty->assign("metrics", $this->model->Metrics_model->get_metrics());
        $this->smarty->assign("current_page", "product-color");
        $this->smarty->display("admin/products/colors/index.tpl");
    }

    function new_colors() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Products_model->new_color($id);
        $this->redirect($this->server->http_refer);
    }

    function add_new_product() {
        $id = $this->model->User_model->is_logged_in();
        $response = $this->model->Products_model->new_product($id);
        if (! $response)
            $this->redirect($this->server->http_refer);
        else
            $this->redirect("//" . $this->server->server_name . "/dashboard/" . $response );
    }

    function view_product($product) {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("sizes", $this->model->Products_model->get_sizes());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("currencies", $this->model->Currency_model->get_currencies());
        $this->smarty->assign("colors", $this->model->Products_model->get_colors());
        $this->smarty->assign("currencies", $this->model->Currency_model->get_currencies());
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers());
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories());
        $this->smarty->assign("sub_categories", $this->model->Categories_model->get_sub_categories());
        $this->smarty->assign("metrics", $this->model->Metrics_model->get_metrics());
        $this->smarty->assign("product", $this->model->Products_model->get_product_info($product));
        $this->smarty->assign("current_page", "products");
        $this->smarty->display("admin/products/view_product.tpl");
    }

    function update_product() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Products_model->update_product($id);
        $this->redirect($this->server->http_refer);
    }

    function update_product_color() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Products_model->update_product_size($id, "product_set_colors", "color");
    }

    function update_product_size() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Products_model->update_product_size($id, "product_sizes", "size");
    }

    function add_thumbnail() {
        $id = $this->model->User_model->is_logged_in();
        if ($id) {
            $file_name = $_FILES['file']['name'];
            $tmp_file = $_FILES['file']['tmp_name'];
            $extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
            $accepted_types = array("png", "jpg", "jpeg", "gif", "webp");
            $product = $this->input->post("product");
            if (! is_executable($tmp_file) and ! empty($product)) :
                if (in_array($extension, $accepted_types)):
                    $image_name = hash('md5', time().rand(0,2000))."_boo_store.".$extension;
                    $image_path = "media/products_thumbnails/" . $image_name;
                    //                if (is_dir("media/products_thumbnails/"))
                    //                    echo 1;
                    move_uploaded_file($tmp_file, $image_path);

                    $save =  $image_path; //This is the new file you saving
                    $file = $image_path; //This is the original file

                    list($width, $height) = getimagesize($file) ;

                    $tn = imagecreatetruecolor($width, $height) ;
                    if ($extension == "jpg" or $extension == "jpeg")
                        $image = imagecreatefromjpeg($file) ;
                    elseif ($extension == "png")
                        $image = imagecreatefrompng($file) ;
                    elseif ($extension == "gif")
                        $image = imagecreatefromgif($file) ;
                    elseif ($extension == "webp")
                        $image = imagecreatefromwebp($file) ;
                    else
                        return false;
                    imagecopyresampled($tn, $image, 0, 0, 0, 0, $width, $height, $width, $height) ;

                    imagejpeg($tn, $save, 60) ;
                    $this->model->Products_model->add_thumbnail($image_name, $id, $product);
                endif;
            endif;
        }
        $this->redirect($this->server->http_refer);
    }

    function make_feature_photo($photo, $product) {
        $table = $this->xss_clean($this->input->get("t"));
        $id = $this->model->User_model->is_logged_in();
        if (! $table)
            $this->model->Products_model->make_feature_photo($photo, $product, $id);
        else
            $this->model->Suppliers_model->make_feature_photo($photo, $product, $id);
        $this->redirect($this->server->http_refer);
    }

    function change_status() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Products_model->activate_product_attributes($id);
    }

    function manage_special_categories() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->Products_model->manage_special_categories($id);
    }

    function sub_category($category) {
        $special_categories = array("featured", "trending", "best_deals", "special_offer");
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", ucfirst($category));
        if (! in_array($category, $special_categories)) {
            $this->smarty->assign("domain", $this->model->User_model->active_domain());
            $category = $this->model->Categories_model->get_category_id_by_url($category, true);
            $this->smarty->assign("category_products", $this->model->Products_model->get_all_products(10, true, false, false, $category));
        }else
            $this->smarty->assign("category_products", $this->model->Products_model->special_category_products($category));
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $this->smarty->assign("sub_categories", $this->model->Categories_model->get_category_attributes($category, true));
        $this->smarty->assign("special_offer", $this->model->Products_model->get_special_categories(1, "products_special_offers"));
        $this->smarty->assign("category_top_rated", $this->model->Products_model->get_most_rated_products(true, $category, false, false, true));
        $this->smarty->assign("top_rated", $this->model->Products_model->get_most_rated_products(true));
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $this->smarty->assign("category_most_sold_products", $this->model->Products_model->get_most_sold_products(true, $category, false, false, true));
        $this->smarty->assign("most_sold_products", $this->model->Products_model->get_most_sold_products(true));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("products/sub_category.tpl");
    }

    function rate_product() {
        $rate = $this->input->post("rates");
        $product = $this->input->post("product");
        $id = $this->model->User_model->is_logged_in();
        echo json_encode($this->model->Products_model->rate_product($rate, $product, $id));
    }

    function add_comment() {
        $id = $this->model->User_model->is_logged_in();
        $product = $this->input->post("product");
        $comment = trim($this->input->post("comment"));
        echo json_encode($this->model->Products_model->comment_on_product($product, $comment, $id));
    }

    function delete_product_pic() {
        $id = $this->model->User_model->is_logged_in();
        $data = $this->model->User_model->get_user_profile($id);
        //print_r($data);
        if ($data[0]['role'] == 1)
            $this->model->Products_model->delete_photo();
        $this->redirect($this->server->http_refer);
    }

    function products_viewed() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("products", $this->model->Products_model->get_viewed_products($id));
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("current_page", "products");
        $this->smarty->display("admin/products/viewed_products.tpl");
    }

    function add_thumbnail_url() {
        $id = $this->model->User_model->is_logged_in();
        if ($id)
            $this->model->Products_model->add_thumbnail_url($id);
        $this->redirect($this->server->http_refer);

    }

    function duplicate_item($item) {
        $id = $this->model->User_model->is_logged_in();

        $response = $this->model->Products_model->duplicate_product($this->model->User_model->get_user_profile($id), $item);
        if (! $response)
            $this->redirect($this->server->http_refer);
        else
            $this->redirect("//" . $this->server->server_name . "/dashboard/" . $response );
    }

    function ajax_search() {
        $id = $this->model->User_model->is_logged_in();
        $response = $this->model->Products_model->search_products($id);
        $data = "";
        if (empty($response)) {
            $data = "<div class='mt-3 bg-white p-3' style='text-white'>No results found</div>";
        }else {

            foreach ($response as $row) {

                for ($counter=1; $counter < 5; $counter++) {

                        $fa = $counter <= $response['total_rates'] ? "" :"text-muted";
                    $rate .= "
                    <span class=\"cursor \" >
                    <i class=\"fas fa-star {$fa}\" ></i >
                                                            </span >";
                    }
                $data .= " <div class=\"axil-product-list\">
                    <div class=\"thumbnail\">
                        <a href='/product/" . $row['url'] . "'>
                            <img style='width:80px' src='/media/products_thumbnails/" . $row['feature_photo'] . "' alt='" . $row['name'] . "'>
                        </a>
                    </div>
                    <div class=\"product-content\">
                        <div class=\"product-rating\">
                                <span class=\"rating-icon\">
                               $rate
                            </span>
                            <span class=\"rating-number\"><span>100+</span> Reviews</span>
                        </div>
                        <h6 class=\"product-title\"><a href=\"single-product.html\">" . $row['name'] . "</a></h6>
                        <div class=\"product-price-variant\">
                            <span class=\"price current-price\">" . $row['price_1'] . "</span>
                            
                        </div>
                        <div class=\"product-cart\">
                            <a href='javascript:addToCart({$row['id']})' class=\"cart-btn\"><i class=\"fal fa-shopping-cart cart-item-{$row['id']}\"></i></a>
                            <a href='javascript:addToWatchlist({$row['id']})' class=\"cart-btn\"><i class='fal fa-heart watchlist-item-{$row['id']}'></i></a>
                        </div>
                    </div>
                </div>";
            }
        }
        echo json_encode($data);
    }
}