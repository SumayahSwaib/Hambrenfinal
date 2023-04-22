<?php

use JetBrains\PhpStorm\ArrayShape;

/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-30
 * Time: 09:22
 */

class User_agents_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function get_client_ip_server() {
        $ip_address = '';
        if (isset($_SERVER['HTTP_CLIENT_IP']))
            $ip_address = $_SERVER['HTTP_CLIENT_IP'];
        else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
            $ip_address = $_SERVER['HTTP_X_FORWARDED_FOR'];
        else if(isset($_SERVER['HTTP_X_FORWARDED']))
            $ip_address = $_SERVER['HTTP_X_FORWARDED'];
        else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
            $ip_address = $_SERVER['HTTP_FORWARDED_FOR'];
        else if(isset($_SERVER['HTTP_FORWARDED']))
            $ip_address = $_SERVER['HTTP_FORWARDED'];
        else if(isset($_SERVER['REMOTE_ADDR']))
            $ip_address = $_SERVER['REMOTE_ADDR'];
        else
            $ip_address = 'UNKNOWN';
        
        //print_r($_SERVER);
        return $ip_address;
    }

    #[ArrayShape(["country" => "mixed", "region" => "mixed", "city" => "mixed"])] function get_client_location(){
        $ip = $this->get_client_ip_server();
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_URL => 'http://api.rhapsodyofrealities.org:2000/' . $ip,
            CURLOPT_USERAGENT => 'Rhapsody City Penetration'
        ));
        $resp = curl_exec($curl);
        $result = json_decode($resp);
        curl_close($curl);
        return [
            "country" => $result->Country ?? "Unknown",
            "region" => $result->Region ?? "Unknown",
            "city" => $result->City ?? "Unknown"
        ];
    }

}