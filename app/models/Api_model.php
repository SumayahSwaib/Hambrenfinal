<?php

use JetBrains\PhpStorm\ArrayShape;

/**
 * Created by PhpStorm.
 * User: Rickie
 * Date: 2020-10-04
 * Time: 15:49
 */

class Api_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function validate_session($key, $active_domain): bool|string
    {
        $url = $active_domain['auth']."/verify_session";
        $data = array("key" => $key, "app" => 4);
        return $this->make_Request($url, $data);
    }

    function make_Request($url, $post_data = null, $get_params = null): bool|string
    {

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLINFO_HEADER_OUT, true);
        curl_setopt($curl, CURLOPT_FRESH_CONNECT, true);

        #do this if the request is post
        if(!empty($post_data)){
            $postFields = json_encode($post_data);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $postFields);

            // Set HTTP Header for POST request
            curl_setopt($curl, CURLOPT_HTTPHEADER, array(
                    'Content-Type: application/json',
                    'Content-Length: ' . strlen($postFields))
            );

            curl_setopt($curl, CURLOPT_URL, $url);
        }
        #do this if its a get request with params
        if(!empty($get_params)){

            $url = $url . '?' . http_build_query($get_params);
            curl_setopt($curl, CURLOPT_URL, $url);
        }
        $data = curl_exec($curl);
        curl_close($curl);
        return $data;
    }

    function create_pagination($search_results): array
    {
        $page = empty ($this->input_get("page")) ? 0 : $this->input_get("page");
        $pagination = array();
        if ($search_results > 0) {
            $number_of_pages = ceil($search_results / 10) - 1;
            //Variable range from active holds the number of tabs to be inserted between the active tab and the tab with dots eg 1(active),2,3,4,5,6,...
            $range_from_active  = 5;
            $left_page = $page - 1;
            $right_page = $page + $range_from_active + 1;
            $replace_with_dots = array();
            $lowest_limit = -1;
            for ($a=0; $a<=$number_of_pages; $a++) {
                if ($a == 0 || $a == $number_of_pages || $a >= $left_page && $a < $right_page) {
                    $replace_with_dots[] = $a;
                }
            }
            for ($i = 0; $i< count($replace_with_dots); $i++) {
                if ($lowest_limit != -1){
                    if ($replace_with_dots[$i] - $lowest_limit === 2){
                        $pagination[] = $lowest_limit + 1;
                    }
                    else if ($replace_with_dots[$i] - $lowest_limit !== 1) {
                        $pagination[] = '...';
                    }
                }
                $pagination[] = $replace_with_dots[$i];
                $lowest_limit = $replace_with_dots[$i];
            }
        }
        return $pagination;
    }

    #[ArrayShape(["auth" => "string", "redirect" => "string"])] function get_active_domain(): array
    {
        return array("auth" => "https://auth.boostedtechs.com", "redirect" => "https://" . $this->server->server_name);
    }

    /**
     * @throws Exception
     */
    function update_app_version ($user) {
        $app = (int)$this->input->post("version");
        $this->db->insert("app_version", ['version' => $app, "date_added" => date("Y-m-d"), "user" => $user]);
    }

    /**
     * @throws Exception
     */
    function get_version() {
        $this->db->orderBy("id", "desc");
        return $this->db->getValue("app_version", "version");
    }
}