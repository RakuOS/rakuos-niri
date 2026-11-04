#!/bin/bash

FIRSTRUN="$HOME/.local/share/config-setup"
DMS_CONFIG="$HOME/.config/DankMaterialShell/settings.json"

if [ -f "$DMS_CONFIG" ]; then
    rm -r "$HOME/.config/dms/"
    rm -r "$HOME/.local/state/dms/"
    rm -r "$HOME/.cache/dms/"
fi

if [ -f "$FIRSTRUN" ]; then
    exit 0
fi

cp -r "/etc/skel/." "$HOME"
gsettings set org.gnome.desktop.interface icon-theme "Colloid-Dark"
dms restart

# Fixme: Temporary replace ibus
ENV_LINE='export GTK_IM_MODULE="simple"'
FISH_CONF="$HOME/.config/fish/config.fish"
FISH_LINE='set -gx GTK_IM_MODULE "simple"'

echo "$ENV_LINE" >> "$HOME/.bash_profile"
echo "$ENV_LINE" >> "$HOME/.zshrc"
echo "$FISH_LINE" >> "$FISH_CONF"

touch "$FIRSTRUN"
