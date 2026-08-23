#!/bin/bash

set -ouex pipefail

# Copy system files from repo to image root
cp -avf "/ctx/system_files"/. /

### Enable Hyprland COPR Repository
dnf5 -y copr enable solopasha/hyprland fedora-rawhide-x86_64

### Install KirtzOS-v2 Packages
dnf5 install -y --allowerasing \
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

# Disable COPR repository so it doesn't linger in the final image
dnf5 -y copr disable solopasha/hyprland

### Desktop Session Setup
mkdir -p /usr/share/wayland-sessions
if [ -f "/usr/share/hyprland/hyprland.desktop" ]; then
    cp /usr/share/hyprland/hyprland.desktop /usr/share/wayland-sessions/
fi

chmod -R 755 /etc/skel/ 2>/dev/null || true
