# Symfony 3 docker-compose boilerplate

The goal of this repository is to simplify the project creation process and make a common boilerplate for all new projects using Symfony.

## Getting started
Please follow the instructions to set up the Symfony project.

### Prerequisites
* Docker version 18 or higher
* Docker compose 1.20 or higher

### Installing
1. Create a `.env` file from the `.env.example` file. And adapt it according to your Symfony project needs.
    ```bash
    cp .env.example .env
    ```
2.
    - **If you have existing project. (You can skip if you don't have an existing project)** You need to override the `.env` file and `APP_PATH` variable. You need to specify the path to your existing Symfony project root directory.
    ```bash
    # Here you specify the path to your existing Symfony project
    APP_PATH=./app
    ```
    - **If you starting from scratch. (You can skip if you have existing project)** You can override the `.env` file and `APP_PATH` variable in the same way as on previous point, but it is **recommended** to leave it as it is.
    You need to launch bash script to create a new project.
    ```bash
    ./scripts/bootstrap.sh
    ```
    A new project will be installed in `app` directory by default.
3. Symfony is configured to use DEV environment as default and in this case you will use `app_dev.php`. If you are not using `docker-machine`, you need to allow access to `app_dev.php` front controller.
    - Find your network's IP.
    ```bash
    docker inspect symfony-php
    ```
    
    At the bottom under `Networks` section, find `Gateway` parameter.
    ```bash
        "Gateway": "172.21.0.1"
    ```
    
    - In `app_dev.php` add this IP to allowed hosts.
    ```php
    // Added '172.21.0.1' in array for allowed hosts.
    if (isset($_SERVER['HTTP_CLIENT_IP'])
        || isset($_SERVER['HTTP_X_FORWARDED_FOR'])
        || !(in_array(@$_SERVER['REMOTE_ADDR'], ['127.0.0.1', '172.21.0.1', '::1'], true) || PHP_SAPI === 'cli-server')
    ) {
        header('HTTP/1.0 403 Forbidden');
        exit('You are not allowed to access this file. Check '.basename(__FILE__).' for more information.');
    }
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
