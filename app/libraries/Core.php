<?php

namespace CRCSignup\Libraries;

/**
 * Application core class
 * creates URL and loads core controller
 * URL FORMAT - controller/method/parameters
 */
class Core
{
    /**
     * Default controller name if no controller is specified in URL string
     */
    private const DEFAULT_CONTROLLER = "Base";

    /**
     * Default method name if no method is specified in URL string
     */
    private const DEFAULT_METHOD = "index";

    /**
     * variable decleration
     * 
     * @var string $controller Default controller - Base
     * @var string $method Defult method - index
     */
    protected $controller = self::DEFAULT_CONTROLLER;
    protected $method = self::DEFAULT_METHOD;
    protected $parameters = [];

    /**
     * Controller namespace variable
     * @var const CONTROLLER_NAMESPACE
     */
    private const CONTROLLER_NAMESPACE = 'CRCSignup\\Controller\\';

    /**
     * URL format seperator
     */
    private const URI_SEPERATOR = '/';

    /**
     * contollers path variable
     */
    private const CONTROLLER_PATH = APP_ROOT.'/controllers/';

    /**
     * file extension of controller class
     */
    private const FILE_EXTENSION = '.php';

    /**
     * URI string of the url
     * It is configured in .htaccess file
     * Make sure to check in .htaccess file if we change it
     */
    private const URI_STRING = 'url';

    /**
     * constructor
     * Check wheather controller is exist or not in the path
     * Instanciate the controller if exists
     */
    public function __construct()
    {
        $url = $this->_getUrl();
        if(is_array($url))
        {
            if(file_exists(static::CONTROLLER_PATH .ucwords($url[0]). static::FILE_EXTENSION)) {
                $this->controller = ucwords($url[0]);
                unset($url[0]);
            }

            if(isset($url[1])) {
                if(method_exists(static::CONTROLLER_NAMESPACE . $this->controller, $url[1])) {
                    $this->method = $url[1];
                    unset($url[1]);
                }
            }
        }
       

        $className = static::CONTROLLER_NAMESPACE . $this->controller;
        $this->controller = new $className();
       
        // Get parameters
        $this->params = $url ? array_values($url) : [];

        call_user_func_array([$this->controller,$this->method], $this->params);
    }

    /**
     * Get the uri string from the URL
     * filter unwanted charecters from the uri
     * divide uri string into segments and return as array
     * 
     * @return array
     */
    private function _getUrl()
    {
        if(isset($_GET[static::URI_STRING])) {
            $url = rtrim($_GET[static::URI_STRING], static::URI_SEPERATOR);
            $url = filter_var($url, FILTER_SANITIZE_URL);

            $url = explode(static::URI_SEPERATOR, $url);

            return $url;
        }
    }
}