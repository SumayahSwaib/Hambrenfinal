<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-24
 * Time: 17:17
 */

class Suppliers extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Suppliers_model");
    }

    function index() {
        $key = $this->model->Api_keys->generate_keys();

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers());
        $this->smarty->assign("current_page", "suppliers");
        $this->smarty->display("admin/suppliers/index.tpl");
    }

    function new_supplier() {
        $this->model->Suppliers_model->new_supplier($this->model->User_model->is_logged_in());
        $this->redirect($this->server->http_refer);
    }

    function edit_supplier() {
        $this->model->Suppliers_model->edit_supplier($this->model->User_model->is_logged_in());
        $this->redirect($this->server->http_refer);
    }

    function get_supplier($supplier) {
        $this->model("Categories_model");
        $this->model("Products_model");
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", $supplier);
        $this->smarty->assign("supplier_page", 1);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("suppliers", $this->model->Suppliers_model->get_suppliers(true));
        $supplier = $this->model->Suppliers_model->get_suppliers(true, $supplier);
        $this->smarty->assign("supplier", $supplier);
        $this->smarty->assign("categories", $this->model->Categories_model->get_categories(true));
        $special_offer_products = $this->model->Products_model->get_special_categories(1, "products_special_offers");
        $this->smarty->assign("photos", $this->model->Suppliers_model->get_supplier_thumbnails(true, $supplier[0]['id'] ?? false));
        $this->smarty->assign("special_offer", $special_offer_products);
        $this->smarty->assign("category_products", $this->model->Products_model->get_all_products(10, true, false, $supplier[0]['id'] ?? false));
        $this->smarty->assign("featured_products", $this->model->Products_model->get_special_categories(6, "products_featured"));
        $this->smarty->assign("best_deal_products", $this->model->Products_model->get_special_categories(6, "products_best_deals"));
        $this->smarty->assign("recently_added_products", $this->model->Products_model->get_all_products(8, true));
        $this->smarty->display("products/supplier.tpl");
    }

    function view_supplier($supplier) {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $supplier = $this->model->Suppliers_model->get_suppliers(false, $supplier);
        $this->smarty->assign("suppliers", $supplier);
        $this->smarty->assign("current_page", "suppliers");
        $this->smarty->assign("photos", $this->model->Suppliers_model->get_supplier_thumbnails(false, $supplier[0]['id']));
        $this->smarty->display("admin/suppliers/view_supplier.tpl");
    }

    function add_thumbnail() {
        $id = $this->model->User_model->is_logged_in();
        if ($id) {
            $file_name = $_FILES['file']['name'];
            $tmp_file = $_FILES['file']['tmp_name'];
            $extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
            $accepted_types = array("png", "jpg", "jpeg", "gif");
            $supplier = $this->input->post("product");
            if (! is_executable($tmp_file) and ! empty($supplier)) :
                if (in_array($extension, $accepted_types)):
                    $image_name = hash('md5', time().rand(0,2000)).".".$extension;
                    $image_path = "media/suppliers/" . $image_name;
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
                    else
                        return false;
                    imagecopyresampled($tn, $image, 0, 0, 0, 0, $width, $height, $width, $height) ;

                    imagejpeg($tn, $save, 75) ;
                    $this->model->Suppliers_model->add_thumbnail($image_name, $id, $supplier);
                endif;
            endif;
        }
        $this->redirect($this->server->http_refer);
    }

    function apply() {
        $id = $this->model->User_model->is_logged_in();
        if ($id)
            $this->model->Suppliers_model->save_supplier_application($id);
        $this->redirect("//" . $this->server->server_name . "/supplier");

    }

    function update_application() {
        $id = $this->model->User_model->is_logged_in();
        if ($id)
            $this->model->Suppliers_model->update_supplier_application($id);
        $this->redirect($this->server->http_refer);
    }

    function supplier_applications() {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("supplier_applications", $this->model->Suppliers_model->get_supplier_applications());
        $this->smarty->assign("current_page", "applications");
        $this->smarty->display("admin/suppliers/applications.tpl");
    }

    function view_application($application) {
        $key = $this->model->Api_keys->generate_keys();
        $this->session->set_user_data("key", $key);
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("key", $key);

        $this->smarty->assign("version", $this->model->Api_model->get_version());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $application_data = $this->model->Suppliers_model->get_supplier_applications($application);
        $this->smarty->assign("applicant_profile", $this->model->User_model->get_user_list($id, $application_data[0]['user']));
        $this->smarty->assign("supplier_applications", $application_data);
        $this->smarty->assign("current_page", "applications");
        $this->smarty->display("admin/suppliers/view_application.tpl");
    }
}