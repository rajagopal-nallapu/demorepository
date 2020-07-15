# CRC Signup Module

Credit Repair Cloud signup module implemnted using Object Oriented way. This module will cover the follwing integrations

- Recurly
- Rackspace Container
- Zapier
- Intercom
- Wicked Reports
- PartnerStack

### Tech

- [HTML5] - HTML enhanced for web apps!
- [Twitter Bootstrap](https://getbootstrap.com/) - great UI boilerplate for modern web apps
- [PHP 7.4](https://www.php.net/) - General-purpose scripting language
- [MySQL](https://www.mysql.com/) - Open-source relational database management system (RDBMS)
- [jQuery](https://jquery.com/) - jQuery is a fast, small, and feature-rich JavaScript library

### Installation

Clone the repository

Install composer as global dependency

```sh
$ composer install
```

Composer will automatically install all the dependencies and plugins used in the project

PHPUnit is added as a development dependency.

To install PHPUnit type

```sh
$ composer install
```

OR

```sh
$ composer require phpunit/phpunit --dev
```

To run all the test cases from the [tests] folder

```sh
$ ./vendor/bin/phpunit
```

To add the alias for PHPUnit command

```sh
$ alias phpunit="./vendor/bin/phpunit"
```

After adding alias you can type following command to run the tests

```sh
$ phpunit
```
Beforing using, please run below cmd in project to add rackspace dependences.

```sh
$ composer require rackspace/php-opencloud:dev-master
```
