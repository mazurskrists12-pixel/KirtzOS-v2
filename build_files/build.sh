#!/bin/bash

set -ouex pipefail

# Copy system files from repo to image root
cp -avf "/ctx/system_files"/. /

### Install KirtzOS-v2 Packages from official Fedora repos
dnf5 install -y \
    hyprland \
    xdg-desktop-portal-hyprland \
    waybar \
    rofi-wayland \
    kitty \
    swaylock \
    dunst \
    hyprpaper \
    grim \
    slurp \
    wl-clipboard \
    polkit-kde-agent-1

### Desktop Session Setup
mkdir -p /usr/share/wayland-sessions
if [ -f "/usr/share/hyprland/hyprland.desktop" ]; then
    cp /usr/share/hyprland/hyprland.desktop /usr/share/wayland-sessions/
fi

chmod -R 755 /etc/skel/ 2>/dev/null || true
