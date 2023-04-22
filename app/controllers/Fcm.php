<?php

use JetBrains\PhpStorm\NoReturn;

class Fcm extends Controller {
    function __construct() {
        parent::__construct();
        $this->model("Firebase_services_model");
    }

    function access_token() {
        return $this->model->Firebase_services_model->create_access_token();
    }
    function save_new_token() {
        $token = $this->input->get("token");
        $auth = $this->input->get("auth");
        $version = $this->input->get("version");
        if ($auth == 987654321212){
            $msg = "Thank you for choosing Jaslac Digital Store for your groceries. Shop a convenient way at great prices";
            $title = "Welcome to Jaslac Digital Store";
            $image = "https://www.jaslac.com/slider_images/banner.jpg";

            $this->send_welcome_notifications(array($token), $msg, $title,$image);
            $this->model->Firebase_services_model->save_new_token($token, $version);
        }
    }

    function send_welcome_notifications($tokens, $msg, $title, $img, $link = "jaslac.com") {
        // API access key from Google API's Console
        define( 'API_ACCESS_KEY', $this->model->Firebase_services_model->create_access_token());

        // prep the bundle
        //  $msg = array
        //  (
        //   'message'    => 'Thank you for choosing Boo Store. Shop a convinient way at great prices.',
        //     'title'     => 'Boo Store',
        //     'subtitle'  => 'For a Conviniet and Reliable Shopping',
        //     'tickerText'    => 'Home of great discounts',
        //     'vibrate'   => 1,
        //     'sound'     => 1,
        //     'largeIcon' => 'https://www.booo.store/assets/images/logo/logo-white.png',
        //     'smallIcon' => 'https://www.boostedtechs.com/assets/images/logos/logo-square.png'
        //  );

        foreach ($tokens As $token) {
            $message = [
                "message" => [
                    "token" => $token,
                    "notification" => ["title" => $title, "body" => $msg, "image" => $img],
                    "android" => ["notification" => ["click_action" => "OPEN_ACTIVITY_1"]],
                    "data" => ["story_id" => md5(time() . rand(3, 1000)), "contents" => $link],
                    "apns" => ["fcm_options" => ["image" => $img]]
                ]
            ];

            $this->fmc_send_curl_request($message);
        }

    }

    #[NoReturn] function send_notifications() {
        $security =  "3847!ashdgs488!Ah(*&^#$%,./a?";
        if (hash("sha256", $security) == trim($this->input->post("l"))) {
            $tokens = $this->model->Firebase_services_model->get_tokens();
            //$tokens = ["enRXNGA6RemE2CNzXgymuR:APA91bFQS5xnjvRac3scON1VEJ1oog8Ju9zbkcEybMUguHLeiGEryzP-EtBeGat4bsdVnpBAy0evjzJp1C7TgVQcaezElz_H6GacqY1Dl0MaG4_p3NWEPKg-9dEh5tDjW-WvGEGipa36"];
            $message = $this->input->post("message") ?: "Jaslac digital store. Your reliable partner";
            $title = trim($this->input->post("title")) ?: "Notification";
            $image = trim($this->input->post("image")) ?: "https://www.jaslac.com/slider_images/banner.jpg";
            $link = trim($this->input->post("link")) ?: "www.jaslac.com";
            $this->send_welcome_notifications($tokens, $message, $title, $image, $link);
        }
    }

    function update_token() {
        $token = $this->input->get("token");
        $user = $this->input->get("user");
        $version = $this->input->get("version");
        $auth = $this->input->get("auth");
        $this->model->Firebase_services_model->update_token($token, $version, $user, $auth);
    }

    function send_customised_notifications() {
        $security =  "3847!ashdgs488!Ah(*&^#$%,./a?";
        if (hash("sha256", $security) == trim($this->input->post("l"))) {
            $tokens = $this->model->Firebase_services_model->get_tokens_with_users();
            //$tokens = ["enRXNGA6RemE2CNzXgymuR:APA91bFQS5xnjvRac3scON1VEJ1oog8Ju9zbkcEybMUguHLeiGEryzP-EtBeGat4bsdVnpBAy0evjzJp1C7TgVQcaezElz_H6GacqY1Dl0MaG4_p3NWEPKg-9dEh5tDjW-WvGEGipa36"];
            $message = $this->input->post("message") ?: "Jaslac digital store. Your reliable partner";
            $title = trim($this->input->post("title")) ?: "Notification";
            $image = trim($this->input->post("image")) ?: "https://www.jaslac.com/slider_images/banner.jpg";
            $link = trim($this->input->post("link")) ?: "www.jaslac.com";
            $this->customised($tokens, $message, $title, $image, $link);
        }
    }

    function customised($tokens, $text, $title, $image, $link) {
        // API access key from Google API's Console
        define( 'API_ACCESS_KEY', $this->model->Firebase_services_model->create_access_token());

        // prep the bundle
        //  $msg = array
        //  (
        //   'message'    => 'Thank you for choosing Boo Store. Shop a convinient way at great prices.',
        //     'title'     => 'Boo Store',
        //     'subtitle'  => 'For a Conviniet and Reliable Shopping',
        //     'tickerText'    => 'Home of great discounts',
        //     'vibrate'   => 1,
        //     'sound'     => 1,
        //     'largeIcon' => 'https://www.booo.store/assets/images/logo/logo-white.png',
        //     'smallIcon' => 'https://www.boostedtechs.com/assets/images/logos/logo-square.png'
        //  );

        $i = 0;
        foreach ($tokens['tokens'] As $token) {
            $name = $tokens['names'][$i];
            $title = str_replace("{}", $name, $title);
            $txt = str_replace("{}",  $name, $text);
            $message = [
                "message" => [
                    "token" => $token,
                    "notification" => ["title" => $title, "body" => $txt, "image" => $image],
                    "android" => ["notification" => ["click_action" => "OPEN_ACTIVITY_1"]],
                    "data" => ["story_id" => md5(time() . rand(3, 1000)), "contents" => $link],
                    "apns" => ["fcm_options" => ["image" => $image]]
                ]
            ];
            $i++;
            //print_r($message); continue;

            $this->fmc_send_curl_request($message);
        }
    }

    /**
     * @param array $message
     * @return void
     */
    public function fmc_send_curl_request(array $message): void
    {
        $headers = array
        (
            'Authorization: Bearer ' . API_ACCESS_KEY,
            'Content-Type: application/json'
        );

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/v1/projects/jaslac/messages:send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($message));
        $result = curl_exec($ch);
        curl_close($ch);

        echo $result;
    }
}