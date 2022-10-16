<p align="center">
  <a href="https://papamica.com">
    <img src="https://zupimages.net/up/20/04/7vtd.png" width="140px" alt="PAPAMICA" />
  </a>
</p>

<p align="center">
  <a href="#"><img src="https://readme-typing-svg.herokuapp.com?center=true&vCenter=true&lines=Super-WordPress;"></a>
</p>
<p align="center">
    <img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/PAPAMICA/SuperWordPress/ci?label=Build%20image%20and%20push%20to%20DockerHub&logo=docker&logoColor=white&style=for-the-badge">
    <br />
    <a href="https://www.docker.com/"><img src="https://img.shields.io/badge/docker-%232496ED.svg?style=for-the-badge&logo=docker&logoColor=white"> </a>
    <a href="https://www.wordpress.org/"><img src="https://img.shields.io/badge/wordpress-%2321759B.svg?style=for-the-badge&logo=wordpress&logoColor=white"> </a>
    <br />
</p>

<div align="center">
You can deploye a compatible Docker environment with Portainer and Traefik with:
<p align="center">
  <a href="https://github.com/PAPAMICA/docker-environment"><img src="https://img.shields.io/badge/docker_environment-%2300B8FC.svg?style=for-the-badge&logo=github&logoColor=white"></a>
</p>
<br />
This application is also available in my other project for easy deployment:
<p align="center">
  <a href="https://github.com/PAPAMICA/docker-compose-collection"><img src="https://img.shields.io/badge/docker_compose_collection-%2300B8FC.svg?style=for-the-badge&logo=github&logoColor=white"></a>
</p>
</div>

# Presentation
This modified WordPress image allows you to update WordPress at launch, install plugins, themes and languages automatically, and create an administrator account.
# How to use
## Docker compose
```yaml
version: "3"

services:
  # Base de données
  wordpress-db:
    container_name: wordpress-db
    image: mysql:5.7
    volumes:
      - ./data/db:/var/lib/mysql
    healthcheck:
      test: ["CMD", "mysqladmin" ,"ping", "-h", "localhost"]
      timeout: 20s
      retries: 10
    environment:
      MYSQL_ROOT_PASSWORD: SuperPassword1234
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: SuperPassword
    labels:
      - "autoupdate=monitor" # https://github.com/PAPAMICA/container-updater

  wordpress:
    container_name: wordpress
    depends_on:
      - wordpress-db
    image: papamica/superwordpress
    volumes:
      - ./data/html:/var/www/html
    ports:
      - 80:80
    environment:
      WORDPRESS_DB_HOST: wordpress-db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: SuperPassword
      WORDPRESS_DB_NAME: wordpress
      WORDPRESS_ADMIN_USERNAME: admin
      WORDPRESS_ADMIN_PASSWORD: papamica
      WORDPRESS_ADMIN_EMAIL: papamica@exemple.com
      WORDPRESS_LANGUAGE: "fr_FR"
      PLUGINS_TO_INSTALL: "mainwp-child elementor updraftplus header-footer-elementor envato-elements include-matomo jetpack wp-mail-smtp wordpress-seo duplicate-post autoptimize contact-form-7"
      PLUGINS_TO_REMOVE: "hello akismet"
      THEMES_TO_INSTALL: "hello-elementor"
      THEMES_TO_REMOVE: "twentytwenty twentytwentytwo twentytwentyone"
      WORDPRESS_URL: localhost
      WORDPRESS_TITLE: wordpress-test
    healthcheck:
      test: curl --fail http://localhost:80 || exit 1
      interval: 1m
      timeout: 30s
      retries: 3
    labels:
      - "autoupdate=monitor" # https://github.com/PAPAMICA/container-updater
```


