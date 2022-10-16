#!/bin/bash
COMMAND="sudo -u www-data wp --path=${WORDPRESS_PATH}"

PLUGINS_TO_INSTALL="${PLUGINS_TO_INSTALL}"
PLUGINS_TO_REMOVE="${PLUGINS_TO_REMOVE}"

THEMES_TO_INSTALL="${THEMES_TO_INSTALL}"
THEMES_TO_REMOVE="${THEMES_TO_REMOVE}"

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
    if [ $(${COMMAND} plugin is-installed $1) ]; then
        echo "Removing Useless Plugin $1"
        ${COMMAND} plugin delete $1
    fi
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
    if [ $(${COMMAND} theme is-installed $1) ]; then
        echo "Removing Useless theme $1"
        ${COMMAND} theme delete $1
    fi
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

${COMMAND} language core update
${COMMAND} language plugin --all update
${COMMAND} language theme --all update