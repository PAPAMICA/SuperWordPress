FROM wordpress:latest
LABEL maintainer="mickael@papamica.com"
LABEL org.opencontainers.image.source=https://github.com/PAPAMICA/SuperWordPress


ENV \
    DEBIAN_FRONTEND=noninteractive

COPY install-plugins.sh /usr/local/bin/install-plugins.sh
COPY wp-post-install.sh /usr/local/bin/wp-post-install
COPY docker_entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini

RUN chmod +x /usr/local/bin/install-plugins.sh &&\
    chmod +x /usr/local/bin/wp-post-install &&\
    chmod +x /usr/local/bin/docker-entrypoint.sh &&\
    apt-get update &&\
    apt-get install -y git sudo &&\
    rm -rf /var/cache/apt/* &&\
    cd /tmp && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && cd &&\
    chmod +x /tmp/wp-cli.phar &&\
    mv /tmp/wp-cli.phar /usr/local/bin/wp

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]