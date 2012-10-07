<?php

/**
 * My Application bootstrap file.
 */
use Nette\Application\Routers\Route;


// Load Nette Framework
require LIBS_DIR . '/Nette/loader.php';


// Configure application
$configurator = new Nette\Config\Configurator;

// Enable Nette Debugger for error visualisation & logging
//$configurator->setProductionMode($configurator::AUTO);
$configurator->enableDebugger(__DIR__ . '/../log');

// Enable RobotLoader - this will load all classes automatically
$configurator->setTempDirectory(__DIR__ . '/../temp');
$configurator->createRobotLoader()
	->addDirectory(APP_DIR)
	->addDirectory(LIBS_DIR)
	->register();

// Create Dependency Injection container from config.neon file
$configurator->addConfig(__DIR__ . '/config/config.neon');
$container = $configurator->createContainer();

// Setup router
$container->router[] = new Route('index.php', 'Homepage:default', Route::ONE_WAY);
/* Překlad rout do podoby bez presenter:view */
$container->router[] = new Route('prihlasit', 'Sign:in');
$container->router[] = new Route('registrovat', 'Sign:reg');

//$container->router[] = new Route('<presenter>/<action>[/<id>]', 'Homepage:default');
$container->router[] = new Route("<presenter>/<action>[/<vp-page>]", "Homepage:default");

// Configure and run the application!
$container->application->run();