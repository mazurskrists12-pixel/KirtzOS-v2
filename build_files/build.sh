#!/bin/bash

set -ouex pipefail

# Copy system files from repo to image root
cp -avf "/ctx/system_files"/. /

### 1. Enable Hyprland COPR (Using standard Fedora release)
dnf5 -y copr enable lionheartp/Hyprland

### 2. Install KirtzOS-v2 Packages
dnf5 install -y \
    noctalia-hyprland-meta \
    xdg-desktop-portal-hyprland \
    grim \
    slurp \
    wl-clipboard \
    kitty

# Clean up COPR repository
dnf5 -y copr disable solopasha/hyprland

### 3. Desktop Session Setup
# Ensure wayland-sessions directory exists
mkdir -p /usr/share/wayland-sessions

# If hyprland.desktop was placed in hyprland subfolder, copy it to wayland-sessions
if [ -f "/usr/share/hyprland/hyprland.desktop" ]; then
    cp -f /usr/share/hyprland/hyprland.desktop /usr/share/wayland-sessions/
fi

chmod -R 755 /etc/skel/ 2>/dev/null || true
