<?php

namespace CRCSignup\Libraries;
/**
 * Core controller
 * Loades the models and views
 */
class Controller
{
    /**
     * Model namespace variable
     */
    protected const MODEL_NAMESPACE = 'CRCSignup\\Model\\';

    /**
     * views path to load the views
     */
    protected const VIEWS_PATH = APP_ROOT.'/views/';

    /**
     * View files extension
     */
    protected const FILE_EXTENSION = '.php';

    /**
     * Load the model
     */
    public function model(string $model)
    {
        $className = static::MODEL_NAMESPACE . $model;
        return new $className();
    }

    /**
     * Load view files
     */
    public function view(string $view, array $data = [])
    {
        if(file_exists(static::VIEWS_PATH. $view .static::FILE_EXTENSION)) {
            require_once(static::VIEWS_PATH. $view .static::FILE_EXTENSION);
        } else {
            die('View does not exist');
        }
    }
}