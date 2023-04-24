<?php
/**
 * Created by PhpStorm.
 * User: Ashiraff Tumusiime
 * Company: Boosted Technologies LTD
 * Date: 7/19/21
 * Time: 9:28 AM
 */

use JetBrains\PhpStorm\NoReturn;

const VIEW_FOLDER = "app/views/";
class Controller {
    /*
    * Creating dynamic variables
    */

    public array $variables = [];

    /*
     *
     * Used to load classes
     *
    */
    public $load;
    /*
     *
     * Input class object
     *
    */
    public Input $inputs;
    /*
     * Server Class object
     *
    */
    public Server $server;
    /*
     *
     * Cookie object
     *
    */
    public Cookies $cookie;
    /*
     *
     * Session class object
     *
    */
    public Session $session;
    /*
     *
     * Mail class object
     *
    */
    public Mail $mail;
    /*
     *
     * Model class object
     *
    */
    public stdClass|array $model = [];
    /*
     *
     * Helper class Object
     *
    */
    public stdClass|array $library = [];
    /*
     *
     * Helper
     *
    */
    public stdClass $helper;
    /*
     *
     * Controller class object
     *
    */
    public stdClass|array $controller = [];

    /*
     * Helpers object
     */

    private array $helpers = [];

    /*
     * Security helper
     */
    public Security $security;
    /*
     * Strings helper
     */
    public String_helper $strings;

    public Smarty $smarty;

    function __construct() {
        /*
         *


         * Inputs
         */
        $inputs = new Input();

        $this->inputs = $inputs;
        /*
         * Server class
         */

        $this->server = new Server();
        /*
         * Cookies class
         */
        $cookie = new Cookies();

        $this->cookie= $cookie;
        /*
         * Session class
         */
        $session = new Session();

        $this->session = $session;
        /*
         * Mail class
         */
        $this->mail = new Mail();
        /*
         * Security class
         */
        $this->security = new Security();
        /*
         * Strings class
         */
        $this->strings = new String_helper();

        $this->helper = new stdClass();
        $this->model = new stdClass();
        $this->library = new stdClass();
        $this->controller = new stdClass();
        /*
         * Load default variables
         */
        $this->assign();
        $smarty = new Smarty();
        $smarty->setTemplateDir(APP_PATH.'views/templates')
            ->setCompileDir(APP_PATH.'views/templates_c')
            ->setCacheDir(APP_PATH.'views/cache');
        $this->smarty = $smarty;
    }

    function assign($variable = '', $value = '') {
        if (! empty($variable))
            if (isset($this->variables->$variable))
                unset($this->variables->$variable);

        $assigned_data = array($variable => $value);
        $this->variables[] = $assigned_data;
    }

    #[NoReturn] function display($file) {
        /*
         * This piece of code changes the array indices provided by the assign method to variable so that they can be accessed in the display as variables
         */
        foreach ($this->variables as $variable) extract($variable);
        /*
         *
         */

        try {
            include_once VIEW_FOLDER . $file . ".php";
        } catch (Exception $e) {
            $this->report_error($e);
        }
        exit;
    }

    function load_view($file)
    {
        try {
            include_once VIEW_FOLDER . $file . ".php";
        } catch (Exception $e) {
            $this->report_error($e);
        }
    }

    function model($class): bool
    {
        /*
         * Include and load the model classes
         * These are classes that interact with the Mysql Dal Class
         */
        $class = is_array($class)?$class : (array)$class;
        foreach ($class as $value) {
            try {
                include_once(APP_PATH . "models/" . $value . ".php");
            }
            catch (Exception $e) {
                //$e->getTraceAsString();
                $this->report_error($e);
            }
            /*
             * If the class exists, create an instance of it
             */
            try {
                if (class_exists($value, true))
                    $this->model->$value = new $value;
            } catch (Exception $e) {
                $this->report_error($e);
            }
        }
        return true;
    }
    #[NoReturn] function report_error($error) {
        $this->assign("error", $error);
        $this->display("error/error");
    }

    function _load_helpers() {
        /*
         * Include the helper classes from the helper library
         */
        $path = APP_PATH . "/helpers";
        $helpers = glob($path . "*.php");

    }


    #[NoReturn] function redirect($url, $header = false) {
        /*
         * Lets manage redirects
         */
        ! $header ? header("location:" . $url) : header("location:" . $url, true, $header);
        exit;
    }

    function set_headers($header, $header_value) {
        /*
         * Set Headers
         */
        header($header . ":" . $header_value);
    }

    function controller($class) {
        /*
         * Include classes from controller folder
         * ie ../app/controllers/
         *
         * By default controllers are called when they are needed
         */

        $class = is_array($class)?$class : (array)$class;
        foreach ($class as $value) {
            try {
                include_once(APP_PATH . "controllers/" . $value . ".php");
            }
            catch (Exception $e) {
                //$e->getTraceAsString();
                $this->report_error($e);
            }
            /*
             * If the class exists, create an instance of it
             */
            try {
                if (class_exists($value, true))
                    $this->controller->$value = new $value;
            } catch (Exception $e) {
                $this->report_error($e);
            }
        }
    }
}

//$bpl = new Controller();