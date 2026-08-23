#!/bin/bash

set -ouex pipefail

# Copy system files from repo to image root
cp -avf "/ctx/system_files"/. /

### 1. Install rawhide repo definitions
dnf5 install -y fedora-repos-rawhide

### 2. Enable Hyprland COPR Repository
dnf5 -y copr enable solopasha/hyprland fedora-rawhide-x86_64

### 3. Install libdisplay-info directly from rawhide without erasing dependencies
dnf5 install -y --enablerepo=rawhide libdisplay-info libdisplay-info-devel || true

### 4. Install KirtzOS-v2 Packages
dnf5 install -y \
    --enablerepo=rawhide \
    --skip-broken \
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

# Clean up temporary repositories
dnf5 -y copr disable solopasha/hyprland
dnf5 config-manager setopt rawhide.enabled=0 2>/dev/null || true

### Desktop Session Setup
mkdir -p /usr/share/wayland-sessions
if [ -f "/usr/share/hyprland/hyprland.desktop" ]; then
    cp /usr/share/hyprland/hyprland.desktop /usr/share/wayland-sessions/
fi

chmod -R 755 /etc/skel/ 2>/dev/null || true
