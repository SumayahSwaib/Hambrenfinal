<?php
class Firebase_services_model extends Model {
    function __construct() {
        parent::__construct();
    }

    /**
     * @throws \Google\Exception
     */
    function create_access_token() {
        include_once "./vendor/autoload.php";
        $credentialsFilePath = './vendor/jaslac-firebase-adminsdk-nxkz3-fa0d27d98a.json'; //replace this with your actual path and file name
        $client = new \Google_Client();
        $client->setAuthConfig($credentialsFilePath);
        $client->addScope('https://www.googleapis.com/auth/firebase.messaging');
        $client->refreshTokenWithAssertion();
        $token = $client->getAccessToken();
        return $token['access_token'];
    }

    /**
     * @throws Exception
     */
    function save_new_token($token, $version) {
        $this->db->insert("fcm_tokens", array("token" => $token, "device" => $version, "date_added" => date("Y-m-d")));
    }

    /**
     * @throws Exception
     */
    function get_tokens(): array
    {
        $data = $this->db->get("fcm_tokens",null, "token");
        $tokens = [];
        foreach ($data as $item)
            $tokens[] = $item['token'];
        return $tokens;
    }

    /**
     * @throws Exception
     */
    function update_token($token, $version, $user, $auth): bool
    {
        if (empty($token) or $token = "empty")
            return false;
        $this->db->where("token", $token);
        $id = $this->db->getValue("fcm_tokens","id");
        if ($id) {
            $this->db->where("token", $token);
            $this->db->update("fcm_tokens", ["device" => $version, "auth_token" => $auth, "user" => $user]);
        }
        else
            $this->db->insert("fcm_tokens", ["token" => $token, "auth_token" => $auth, "device" => $version, "user" => $user, "date_added" => date("Y-m-d")]);
        return true;
    }

    /**
     * @throws Exception
     */
    function get_tokens_with_users(): array
    {
        $this->db->join("basic_info", "basic_info.user = fcm_tokens.user");
        $data = $this->db->get("fcm_tokens",null, "token, names");
        $tokens = [];
        foreach ($data as $item) {
            $tokens["tokens"][] = $item['token'];
            $tokens["names"][] = ucfirst(explode(" ", $item['names'])[0]);
        }
        return $tokens;
    }
}