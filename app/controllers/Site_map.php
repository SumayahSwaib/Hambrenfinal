<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-12-05
 * Time: 20:39
 */

class Site_map extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Products_model");
        $this->model("Categories_model");
    }

    function index() {
        $categories =  $this->model->Categories_model->get_categories(true);
        //print_r($categories);
        //die();
        $products =  $this->model->Products_model->get_all_products(200, true);
        //print_r($products);
        //die();

        $str = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";

        $str .= "
        <urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">
           <url>
        
              <loc>https://booo.store</loc>
        
              <lastmod> " . date("Y-m-d") . "</lastmod>
        
              <changefreq>always</changefreq>
        
              <priority>0.9</priority>
        
           </url>
           <url>
            
              <loc>https://booo.store/privacy</loc>
        
              <changefreq>monthly</changefreq>
        
           </url>
           <url>
            
              <loc>https://booo.store/terms</loc>
        
              <changefreq>monthly</changefreq>
        
           </url>";
        foreach ($categories as $category) {
            $str .= "<url>";
            $str .= "<loc>https://booo.store/" . $category['url'] ."</loc> \n";
            $str .= "<lastmod>" . date("Y-m-d") . "</lastmod>\n";
            $str .= "<changefreq>always</changefreq>\n";
            $str .= "<priority>0.8</priority>\n";
            $str .= "</url>";
        }
        foreach ($products as $product) {
            $str .= "<url>";
            $str .= "<loc>https://booo.store/product/" . $product['url'] ."</loc>\n";
            $str .= "<lastmod>" . date("Y-m-d") . "</lastmod>\n";
            $str .= "<changefreq>always</changefreq>\n";
            $str .= "<priority>0.9</priority>\n";
            $str .= "</url>\n";
        }
        $str .= "</urlset>\n";
        $str .= '</xml>\n';

        file_put_contents("sitemap.xml", $str);
    }

}
