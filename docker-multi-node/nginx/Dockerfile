FROM ubuntu:14.04
MAINTAINER Orcun Atakan <oatakan@gmail.com>

# install nginx

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

# default command to run
CMD ["/usr/sbin/nginx"]

# expose port 80
EXPOSE 80

VOLUME ["/etc/nginx/conf.d", "/var/www/html/site"]