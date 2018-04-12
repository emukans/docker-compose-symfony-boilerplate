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
    APP_PATH=./src
    ```
    - **If you starting from scratch. (You can skip if you have existing project)**
    You need to launch Symfony install command.
    ```bash
    docker-compose exec php initsymfony
    ```
    A new project will be installed in `src` directory by default.
    During installation process you will be prompted for parameters.yml configuration. For `database_host` you should type `db` and for `database_port` type `3306`. The rest is specified in `.env`.
3. Symfony is configured to use DEV environment as default and in this case you will use `app_dev.php`. If you are not using `docker-machine`, you need to allow access to `app_dev.php` front controller.
    - Find your network's IP.
    ```bash
    docker network inspect symfonyproject_default | grep Gateway
    ```
    
    If you changed `COMPOSE_PROJECT_NAME` in `.env` file, you should prefix network name to this value. You will see the output something similar to this.
    ```bash
        "Gateway": "172.21.0.1"
    ```
    
    - In `app_dev.php` add this IP to allowed hosts. The same needs to be done for `config.php`
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
4. **Optional.** After initializing the project you can remove `.git` folder and setup your own repository.
    ```bash
    sudo rm -r .git
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
