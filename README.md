# KirtzOS-v2

An immutable, gaming-focused Bazzite spin featuring a pre-configured Hyprland dynamic tiling desktop environment.

---

## Overview

**KirtzOS-v2** is a custom, containerized Linux operating system built on top of Universal Blue's [Bazzite](https://bazzite.gg/). It combines a rock-solid, gaming-optimized Fedora base with the modern aesthetics and efficiency of the **Hyprland** Wayland compositor.

---

## System Specs & Included Software

### Core Architecture
* **Base OS:** Immutable Fedora/Bazzite image managed by `bootc`.
* **Graphics:** Built-in open-source NVIDIA kernel modules and drivers (`bazzite-nvidia-open`).
* **Atomic Updates:** Container-based system updates with instant rollback safety.

### Desktop & UI
* **Compositor:** **Hyprland** — Dynamic, GPU-accelerated tiling window manager with smooth animations.
* **Status Bar:** **Waybar** — Custom top bar showing workspaces, clock, volume, and system metrics.
* **Wallpaper Engine:** **Hyprpaper** — Native wallpaper daemon.
* **Screen Lock:** **Swaylock-effects** — Lock screen utility with background blur.

### Utilities & Apps
* **Terminal:** **Kitty** — High-performance, GPU-accelerated terminal emulator.
* **Launcher:** **Rofi-Wayland** — Fast application menu and window switcher.
* **Notifications:** **Dunst** — Lightweight notification daemon.
* **Screenshots:** **Grim** + **Slurp** + **wl-clipboard** — Area selection screenshots copied straight to clipboard.
* **Authentication:** **Polkit KDE Agent** — Graphical password prompts for root actions.

---

## Pre-Configured Dotfiles

All custom window management settings, keybindings, and status bar themes are built directly into `/etc/skel`. Any new user profile created on the system automatically inherits the complete desktop setup without manual configuration.

---

## Installation & Deployment

To switch an existing `bootc`-enabled system (such as Bazzite) to **KirtzOS-v2**, run:

```bash
sudo bootc switch ghcr.io/mazurskrists12-pixel/image-template:latest
sudo reboot
