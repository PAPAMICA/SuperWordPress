FROM wordpress:latest
LABEL maintainer="mickael@papamica.com"
LABEL org.opencontainers.image.source https://github.com/PAPAMICA/SuperWordPress
# APT Update/Upgrade, then install packages we need
RUN apt update && \
    apt upgrade -y && \
    apt autoremove && \
    apt install -y \
    vim \
    wget \
    mariadb-client

# Replace php.ini
COPY php.ini /usr/local/etc/php

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info&& \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    # Remove old php.ini files (wihtout creating new image)
    rm /usr/local/etc/php/php.ini-development && \
    rm /usr/local/etc/php/php.ini-production

RUN wp plugin install mainwp-child elementor updraftplus header-footer-elementor envato-elements include-matomo jetpack wp-mail-smtp wordpress-seo duplicate-post autoptimize contact-form-7 --activate && \
    wp theme install hello-elementor --activate

RUN wp plugin delete hello-dolly akismet && \
    wp theme delete twentytwenty twentytwentytwo twentytwentyone