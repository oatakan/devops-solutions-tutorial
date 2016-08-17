Create multi-node app environment with Docker

Create 3 containers using Dockerfile that will deploy nginx, mysql and php application that will interact with the database.

For this example we will create new nginx and mysql images rather than pulling from existing images.

Requirements:

- docker > 1.12
- add '127.0.0.1 site.local.ad.home' to /etc/hosts on your system

Usage:

Option 1:

with docker

To build

docker build -t sumerli/mysql mysql/
docker build -t sumerli/nginx nginx/
docker build -t sumerli/php-mysql-app php-mysql-app/

To run

docker run -d --name mysql sumerli/mysql
docker run -d --name app --link mysql:mysql -v <absolute_path>/docker-multi-node/php-mysql-app/code:/var/www/html/site sumerli/php-mysql-app
docker run -d --name web --link app:app -v <absolute_path>/docker-multi-node/php-mysql-app/code:/var/www/html/site -v <absolute_path>/docker-multi-node/nginx/site.conf:/etc/nginx/conf.d/site.conf:ro -p 80:80 sumerli/nginx

Option 2

with docker-compose

To build
docker-compose build

To run
docker-compose up -d

To test the app navigate to:
http://site.local.ad.home/index.php