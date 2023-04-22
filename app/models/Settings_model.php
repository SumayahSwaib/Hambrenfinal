<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-08-27
 * Time: 17:00
 */

class Settings_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function change_theme($user) {
        $this->db->where("user", $user);
        $theme = $this->db->getValue("basic_info", "theme") ? 0 : 1 ;
        $this->db->where("user", $user);
        $this->db->update("basic_info", array("theme" => $theme));
    }

}