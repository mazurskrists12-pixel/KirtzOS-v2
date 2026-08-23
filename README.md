KirtzOS-v2 is a custom, containerized Linux operating system built on top of Universal Blue's Bazzite. It combines a rock-solid, gaming-optimized Fedora base with the modern aesthetics and efficiency of the Hyprland Wayland compositor.

Core System

    Base OS: Immutable Fedora/Bazzite image powered by bootc.

    Graphics: Pre-packaged open-source NVIDIA kernel modules and display drivers.

    Architecture: Atomic, containerized system updates with instant rollback capabilities.

Desktop Environment & Visuals

    Hyprland: Dynamic, GPU-accelerated tiling window manager with smooth workspace transitions and animations.

    Waybar: Minimalist status bar displaying active workspaces, system resource usage, volume, and clock.

    Hyprpaper: Native wallpaper daemon for desktop backgrounds.

    Swaylock-effects: Lock screen utility featuring blurred desktop snapshots.

Included Utilities & Apps

    Kitty: GPU-accelerated, high-performance terminal emulator.

    Rofi-Wayland: Fast application launcher and window switcher.

    Dunst: Lightweight notification daemon for desktop alerts.

    Grim + Slurp + wl-clipboard: Region screenshot tools that copy directly to your clipboard.

    Polkit KDE Agent: Graphical authentication agent for root/privilege requests.

Pre-Configured Dotfiles
All interface configurations, keybindings, and theme settings are built directly into /etc/skel. New user accounts automatically load the full desktop configuration on first boot without requiring manual setup.

Installation / Rebase Command

To switch any existing bootc-enabled system (like Bazzite) to this image, run:
Bash

sudo bootc switch ghcr.io/mazurskrists12-pixel/image-template:latest
sudo reboot
