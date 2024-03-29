#!/bin/bash
COMMAND="wp --allow-root --path=/var/www/html"

PLUGINS_TO_INSTALL="elementor updraftplus envato-elements jetpack wp-mail-smtp wordpress-seo duplicate-post wordfence wp-hide-security-enhancer complianz-gdpr burst-statistics redis-cache"
PLUGINS_TO_REMOVE="hello-dolly akismet"

THEMES_TO_INSTALL="hello-elementor"
THEMES_TO_REMOVE="twentytwenty twentytwentytwo twentytwentyone twentytwentyfour twentytwentythree"

echo "Installing wp-cli"

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo "Installing plugins and themes"

#Append below for the plugin installation

install_plugin () {
    if [ $(${COMMAND} plugin is-installed $1) ]; then
        echo "Update $1 plugin"
        ${COMMAND} plugin update $1 --activate
    else
        echo "Install $1 plugin"
        ${COMMAND} plugin install $1 --activate
    fi
}

remove_plugin () {
    echo "Removing Useless Plugin $1"
    ${COMMAND} plugin delete $1
}

install_theme () {
    if [ $(${COMMAND} theme is-installed $1) ]; then
        echo "Update $1 theme"
        ${COMMAND} theme update $1
    else
        echo "Install $1 theme"
        ${COMMAND} theme install $1 --activate
    fi
}

remove_theme () {
    echo "Removing Useless theme $1"
    ${COMMAND} theme delete $1
}

for PLUGIN in $PLUGINS_TO_INSTALL; do
    install_plugin $PLUGIN
done

for PLUGIN in $PLUGINS_TO_REMOVE; do
    remove_plugin $PLUGIN
done

for THEME in $THEMES_TO_INSTALL; do
    install_theme $THEME
done

for THEME in $THEMES_TO_REMOVE; do
    remove_theme $THEME
done

if [ "$PLUGINS_AUTOUPDATE" = true ]; then
    ${COMMAND} plugin auto-updates enable --all
fi

${COMMAND} language core update
${COMMAND} language plugin update --all
${COMMAND} language theme update --all
