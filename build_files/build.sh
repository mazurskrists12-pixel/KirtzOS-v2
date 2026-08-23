#!/bin/bash

set -ouex pipefail

# Copy system files from repo to image root
cp -avf "/ctx/system_files"/. /

### Install Rawhide repo definitions so dnf5 recognizes the repository
dnf5 install -y fedora-repos-rawhide

### Enable Hyprland COPR Repository
dnf5 -y copr enable solopasha/hyprland fedora-rawhide-x86_64

### Install KirtzOS-v2 Packages
dnf5 install -y \
    --enablerepo=rawhide \
    --allowerasing \
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

# Clean up repositories so they don't linger in the final image
dnf5 -y copr disable solopasha/hyprland
dnf5 config-manager setopt rawhide.enabled=0 2>/dev/null || true

### Desktop Session Setup
mkdir -p /usr/share/wayland-sessions
if [ -f "/usr/share/hyprland/hyprland.desktop" ]; then
    cp /usr/share/hyprland/hyprland.desktop /usr/share/wayland-sessions/
fi

chmod -R 755 /etc/skel/ 2>/dev/null || true
