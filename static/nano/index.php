<?php
$prefix =  __DIR__ . '/../../nano';
require $prefix . '/vendor/autoload.php';
session_start();
$settings = require $prefix . '/src/settings.php';
$app = new \Slim\App($settings);
require $prefix . '/src/dependencies.php';
require $prefix . '/src/middleware.php';
require $prefix . '/src/routes.php';
$app->run();
