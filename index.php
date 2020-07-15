<?php

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/app/config/config.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

use CRCSignup\Libraries\Core;

$init = new Core;