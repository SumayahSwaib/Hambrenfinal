<?php

use JetBrains\PhpStorm\ArrayShape;

/**
 * Created by PhpStorm.
 * User: Rickie
 * Date: 2020-08-23
 * Time: 08:46
 */

class User_model extends Model
{

    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function update_user_data($data, $token, $login = false): array|bool
    {
        if (empty($data))
            return false;
        $access = false;
        $data = (object)$data;
        if (! $login) {
            $this->db->where("email", $data->email);
            $value = $this->db->getValue("basic_info", "user");
            if (empty($value)) {
                if(empty($data->password) or empty($data->names) or empty($data->dob) or empty($data->email))
                    return ['status' => 1, 'message' => "Missing fields. Please correct them"];
                if (! $this->validate_email($data->email))
                    return ['status' => 1, 'message' => "EMail address is incorrect"];
                $d = array(
                    "password" => $this->password_hash($data->password),
                    "names" => $data->names,
                    "verified" => $token,
                    "email" => $data->email,
                    "image" => "blank.png",
                    "country" => 0,
                    "dob" => $data->dob,
                    "theme" => 1,
                    "gender" => $data->gender,
                    "continent" => 0,
                    "city" => 0);
                $user = $this->db->insert("basic_info", $d);
            } else
                return ['status' => "1", "message" => "Hello " . $data->names . ", A user with email " . $data->email . " you are trying to use already exists on Hambren"];
        }
        else {
            if (! $this->validate_email($data->email))
                return ['status' => 1, 'message' => "Email address is incorrect"];
            $password = $this->password_hash($data->password);
            $this->db->where("password", $password);
            $this->db->where("email", $data->email);
            $user = $this->db->getOne("basic_info", "username, user, verified");
            if (empty($user))
                return false;
            $access = $user['verified'];
            $user = $user['user'];
        }
        $this->db->insert("access_keys", array("access_key" => $token, "user" => $user, "date_added" => date("Y-m-d")));

        $temporary_id = $this->cookie->read("temporary_id");
        if (! empty($temporary_id)) {
            $this->db->where("temporary_id", $temporary_id);
            $this->db->update("orders", array("user" => $user));

            $this->db->where("temporary_id", $temporary_id);
            $this->db->update("order_keys", array("user" => $user));

            $this->db->where("temporary_id", $temporary_id);
            $this->db->update("affiliate_transactions", array("user" => $user));
            /*
             * We got data from the user when not logged in. There is a possibility that the user has an account from another device. So we check. if so, we update the existing data or insert a fresh copy
             */
            $this->db->where("temporary_id", $temporary_id);
            $addresses = $this->db->getOne("addresses", "district, village, country, phone_no, box_no, company, email, street, temporary_id");
            if (! empty($addresses)) {
                $this->db->where("user", $user);
                $user_address = $this->db->getValue("addresses", "id");
                if ($user_address) {
                    $this->db->where("user", $user);
                    $this->db->update("addresses", $addresses);

                    $this->db->where("user", null);
                    $this->db->where("temporary_id", $temporary_id);
                    $this->db->delete("addresses");
                } else {
                    $this->db->where("temporary_id", $temporary_id);
                    $this->db->update("addresses", array("user" => $user));
                }

            }
            $this->cookie->destroy("temporary_id");
        }
        return ['status' => "2", "message" => "Successfully created account", "token" => $token, "verified" => $access];
    }

    /**
     * @throws Exception
     */
    function create_username($user): bool
    {
        $this->db->where("user", $user);
        $username = $this->db->get("basic_info", null, "username, names");
        if (! empty($username[0]['username']))
            return true;
        //print_r($username);
        $username = $this->check_url_for_duplicates(
            strtolower(
                $this->remove_special_chars(
                    $this->remove_none_utf_char($username[0]['names'])
                )
            ), "basic_info", "username"
        );
        $this->db->where("user", $user);
        $this->db->update("basic_info", array("username" => $username));
        return true;
    }

    /**
     * @throws Exception
     */
    function is_logged_in() {
        /*
         * If the user has a temporary id set, lets not destroy cookies but preserve them till when the temporary id is destroyed on user login
         */
        if (isset($this->cookie->cookie->temporary_id))
            return false;

        /*
         * To manage affiliate data without having to change much on how the software works,
         * lets save the affiliate id in a session if at all no the user is not logged in.
         * Our primary target is not to use the session but the cookie. But since it is possible that an order
         * is made without having to log in, then the referer should get his/her commission.
         * We do this by temporary keeping the affiliate id in a session. When the user logs in, then a cookie is recreated
         */
        if (isset($this->cookie->cookie->affiliate) and ! isset($this->cookie->cookie->auth))
            $this->session->set_user_data("affiliate", $this->cookie->cookie->affiliate);

        if (! isset($this->cookie->cookie->auth)) {
            $this->cookie->destroy();
            return false;
        }
        else {
            $this->db->where("access_key", $this->cookie->cookie->auth);
            $data = $this->db->getValue("access_keys", "user");
            if (empty($data)) {
                $this->cookie->destroy();
                return false;
            }
            else {
                if (! empty($this->session->data("affiliate"))) {
                    $this->cookie->set("affiliate", $this->session->data("affiliate"));
                    $this->session->remove_data("affiliate");
                }
                return $data;
            }
        }
    }

    /**
     * @throws Exception
     */
    function get_user_profile($user): bool|MysqliDb|array|string
    {
        if (! $user)
            return false;
        $this->create_username($user);
        $this->db->where("user", $user);
        $auth = $this->cookie->cookie->auth;
        return $this->db->get("basic_info", 1, "(select id from fcm_tokens where user = '$user' and auth_token = '$auth') as fcm_token, boo_cash, supplier, username, role, user as id, user as user_id, email, names, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age, image, country, dob, theme, gender, continent, city");
    }

    function active_domain() {
        $this->model("Api_model");
        return $this->model->Api_model->get_active_domain();
    }

    /**
     * @throws Exception
     */
    function get_users($id, $user = false): MysqliDb|array|string
    {
        $limit = 10;
        $start = 0;
        //$this->db->where("user", $id, "!=");
        if ($user)
            $this->db->where("user", $user);
        $this->db->where("username is not null");
        return $this->db->get("basic_info", array($start, $limit), "username, role, user as id, id as user_id, email, names, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age, image, country, dob, theme, gender, continent, city");
    }

    /**
     * @throws Exception
     */
    function get_user_id_by_username($user) {
        if (! $user)
            return false;
        $this->db->where("username", $user);
        return $this->db->getValue("basic_info", "user");
    }

    /**
     * @throws Exception
     */
    function get_username_by_id($user) {
        if (! $user)
            return false;
        $this->db->where("user", $user);
        return $this->db->getValue("basic_info", "names");

    }

    /**
     * @throws Exception
     */
    function get_user_email_by_id($user) {
        if (! $user)
            return false;
        $this->db->where("user", $user);
        return $this->db->getValue("basic_info", "email");
    }

    /**
     * @throws Exception
     */
    function get_addresses($user): bool|array|string|null
    {
        $temporary_id = $this->cookie->read("temporary_id"); // for users who has not signed in but updated their shipping address to shop
//        echo $temporary_id; die();
        if (! $user and empty($temporary_id))
            return false;

        if (! empty($user)) {
            /*
             * This only works when there is user session created
             */
            $this->db->where("user", $user);
            $address = $this->db->getValue("addresses", "id");
            if (empty($address))
                $this->db->insert("addresses", array("user" => $user));
        }

        if ($temporary_id)
            $this->db->where("temporary_id", $temporary_id);
        else
            $this->db->where("user", $user);
        return $this->db->getOne("addresses", "(select delivery_amount from districts where id = addresses.district) as delivery, user, district, village, country, phone_no, box_no, email, street, company");
    }

    /**
     * @throws Exception
     */
    function get_countries(): MysqliDb|array|string
    {
        return $this->db->get("countries", null, "id, country, status");
    }

    /**
     * @throws Exception
     */
    function get_districts($country = false): MysqliDb|array|string
    {
        if ($country)
            $this->db->where("country", $country);
        $this->db->orderBy("district", "Asc");
        return $this->db->get("districts", null, "id, country, district, status, region");
    }

    /**
     * @throws Exception
     */
    function update_address($user): bool
    {
        if (! $user)
            if (empty ($this->session->data("final_cart")))
                return false;

        $company = $this->xss_clean($this->input->post("company"));
        $country = $this->xss_clean($this->input->post("country"));
        $street = $this->xss_clean($this->input->post("street"));
        $town = $this->xss_clean($this->input->post("town"));
        $district = $this->xss_clean($this->input->post("district"));
        $phone = $this->xss_clean($this->input->post("phone"));
        $box = $this->xss_clean($this->input->post("box"));
        $email = $this->xss_clean($this->input->post("email"));

        if (empty($email))
            return false;

        if (! $user) {
            //$this->cookie->destroy("temporary_id");
            $temporary_id = $this->cookie->read("temporary_id");
            if (empty($temporary_id)) {
                $id = $this->db->insert("addresses", array("district" => $district,
                    "village" => $town,
                    "country" => $country,
                    "phone_no" => $phone,
                    "box_no" => $box,
                    "company" => $company,
                    "email" => $email,
                    "street" => $street));
                $this->cookie->set("temporary_id", $id);
                $this->db->where("id", $id);
                $this->db->update("addresses", array("temporary_id" => $id));

            } else {
                $this->db->where("temporary_id", $temporary_id);
                $this->db->update("addresses",
                    array("district" => $district,
                        "village" => $town,
                        "country" => $country,
                        "phone_no" => $phone,
                        "box_no" => $box,
                        "company" => $company,
                        "email" => $email,
                        "street" => $street));
            }
        }
        else {

            $this->db->where("user", $user);
            $this->db->update("addresses",
                array("district" => $district,
                    "village" => $town,
                    "country" => $country,
                    "phone_no" => $phone,
                    "box_no" => $box,
                    "company" => $company,
                    "email" => $email,
                    "street" => $street));
        }
        return true;
    }

    /**
     * @throws Exception
     */
    function update_watchlist($user, $watchlist): bool|MysqliDb|array|string
    {
        if (! $user)
            return false;

        if (empty($watchlist))
            return false;

        foreach($watchlist as $item) {
            $this->db->where("product", $item);
            $this->db->where("user", $user);
            if($this->db->getOne("watchlist", "id"))
                continue;
            $this->db->insert("watchlist", array("product" => $item, "user" => $user, "date_added" => date("Y-m-d")));
        }
        return $this->get_watchlist_items($user);
    }

    /**
     * @throws Exception
     */
    function get_watchlist_items($user): bool|MysqliDb|array|string
    {
        if (! $user)
            return false;
        $this->db->where("watchlist.user", $user);
        $this->db->join("products", "products.id = watchlist.product");
        return $this->db->get("watchlist", null, "name,
        watchlist.product,
        watchlist.id,
        products.url, 
        description, feature_photo");
    }

    /**
     * @throws Exception
     */
    function delete_watchlist_item($user, $id) {
        if (! $user)
            return false;


        $this->db->where("id", $id);
        $this->db->where("user", $user);
        $this->db->delete("watchlist");

        $watchlist = (array)$this->session->data("watchlist");
        if (! empty($watchlist))
            if (($key = array_search($id, $watchlist)) !== false)
                unset($watchlist[$key]);
        $this->session->set_user_data("watchlist", $watchlist);
    }

    /**
     * @throws SmartyException
     */
    function subscribe($email): string
    {
        $this->db->where("email", $email);
        $id = $this->db->getOne("mail_subscription", "id");
        if ($id)
            return "You are already in the subscription list";
        $this->db->insert("mail_subscription", array("email" => $email));

        $this->mail->mail->setFrom("no-reply@boostedtechs.com", "Boo Store");
        $this->mail->mail->addAddress($email);
        $this->mail->mail->isHTML(true);
        $this->mail->mail->Subject = "Mail Subscription";
        $message = "<h2>Hello,</h2><h3>You have been successfully added to our mailing list. Continue shopping with Boo store</h3>";
        $this->smarty->assign("message", $message);
        $message = $this->smarty->fetch("mail_templates/subscription.tpl");
        $this->mail->mail->Body = $message;
        $this->mail->mail->send();
        return "You have successfully joined BOO's mailing list";
    }

    /**
     * @throws Exception
     */
    function send_welcome_mail(): MysqliDb|array|string
    {
        $this->db->where("mail", 0);
        return $this->db->get("basic_info", null, "names, email, id");
    }

    /**
     * @throws Exception
     */
    function update_users_welcome_mail($user) {
        $this->db->where("id", $user);
        $this->db->update("basic_info", array("mail" => 1));
    }

    /**
     * @throws Exception
     */
    function get_user_list($user, $user_id = false, $affiliate = false): bool|array
    {
        if (! $user)
            return false;
        if ($user_id)
            $this->db->where("user", $user_id);
        if ($affiliate)
            $this->db->where("boo_cash", 1);
        $page = $this->input->get("page") ? $this->input->get("page") : 1;
        $this->db->orderBy("user", "desc");
        $this->db->orderBy("role", "desc");
        return $this->db->paginate("basic_info", $page,
            array("user",
            "names",
            "image",
            "country",
            "TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age",
            "mail",
            "gender",
            "email",
            "role",
            "supplier",
            "boo_cash",
            "username",
            "continent",
            "verified",
            "(select id from supplier_requests where user = basic_info.user) as supplier_application",
            "(select count(id) from orders where orders.user = basic_info.user) as orders,
            (select count(id) from orders where orders.user = basic_info.user and payment_confirmation = 1) as placed_orders
            "));
    }

    #[ArrayShape(['error' => "int", "message" => "string"])] function confirm_account($code): array
    {
        if (! $code)
            return ['error' => 1, "message" => "Kindly check your email to confirm your account"];
        $this->db->where("verified", trim($code));
        $d = $this->db->getOne("basic_info", "names, user");
        if ($d) {
            $this->db->where("user", $d['user']);
            $this->db->update("basic_info", ['verified' => null]);
        }
        $message = "Token not found or expired";
        if ($d)
            $message = "Hello " . $d['names'] . ", your <b>Hambren</b> account has been confirmed. Kindly login with your email and password to continue";
        return ['error' => 1, "message" => $message];
    }

    /**
     * @throws Exception
     */
    function send_password_reset(): array
    {
        $email = trim($this->input->post("email"));
        if (! $this->validate_email($email))
            return ['message' => "Provide a valid email address"];
        $this->db->where("email", $email);
        $user = $this->db->getOne("basic_info", "user, email, names");
        if (empty($user))
            return ['message' => "Check your email for password reset options"];
        $reset = $this->session->data("reset");
        if ($reset >= 4)
            return ['message' => "Check your email for password reset options"];

        $this->db->where("user", $user['user']);
        $this->db->update("forgot_password", ['deleted' => 1]);

        $pwd = $this->password_hash(time() . $email . $user['user']);
        $this->db->insert("forgot_password", ['user' => $user['user'], "password" => $pwd]);
        $reset++;
        $this->session->set_user_data("reset", $reset);
        return ['status' => 1, 'names' => $user, "code" => $pwd];
    }

    #[ArrayShape(['error' => "int", "message" => "string"])] function check_pwd($code) {
        if (empty($code))
            return ['error' => 1, "message" => "Code not found or expired"];
        $this->db->where("password", $code);
        $user = $this->db->getValue("forgot_password", "user");
        if (! $user)
            return ['error' => 1, "message" => "Code not found or expired"];
        $this->session->set_user_data("forgot_pwd", $user);
        return ['error' => 2];
    }

    /**
     * @throws Exception
     */
    function change_password(): bool
    {
        $password = $this->input->post("password");
        $password2 = $this->input->post("password1");
        //print_r($_POST);

        if ($password === $password2)
            return false;
        $password = $this->password_hash($password);
        $user = $this->session->data("forgot_pwd");
        $this->session->remove_data("forgot_pwd");
        if (empty($user))
            return false;
        $this->db->where("user", $user);
        $this->db->update("basic_info", ['password' => $password]);

        $this->db->where("user", $user);
        $this->db->update("forgot_password", ['deleted' => 1]);
        return true;
    }
}