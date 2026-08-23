#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install KirtzOS-v2 Packages

# Install Hyprland compositor, portal, and Wayland ecosystem utilities
dnf5 install -y \
    hyprland \
    xdg-desktop-portal-hyprland \
    waybar \
    rofi-wayland \
    kitty \
    swaylock-effects \
    dunst \
    hyprpaper \
    grim \
    slurp \
    wl-clipboard \
    polkit-kde-agent-1

### Desktop Session Setup

# Register Hyprland in the display manager session menu
mkdir -p /usr/share/wayland-sessions
if [ -f "/usr/share/hyprland/hyprland.desktop" ]; then
    cp /usr/share/hyprland/hyprland.desktop /usr/share/wayland-sessions/
fi

# Ensure correct permissions on default user template dotfiles
chmod -R 755 /etc/skel/ 2>/dev/null || true
