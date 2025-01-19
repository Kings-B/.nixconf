#!/bin/bash
echo "Starting settup"

echo "Starting Rebuild"
nixos-rebuild switch
echo "Rebuild Finished"

# Creates directories needed for rest of setup
mkdir ~/downloads
mkdir ~/projects
mkdir -p ~/documents/wallpapers

# Setup Nixos Home Manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update

# Download neovim config file
git clone https://github.com/Kings-B/neovim-configuration.git ~/.config/nvim/

# Download github hyprland config file
git clone https://github.com/Kings-B/hyprland-configuration.git ~/.config/hypr/

# Download github Ghostty config file
git clone https://github.com/Kings-B/ghostty-configs.git ~/.config/ghsotty/

# Download gituhb Wofi config file
git clone https://github.com/Kings-B/wofi-configs.git ~/.config/wofi

# Make other bash scripts executable
chmod +x /etc/nixos/modules/scripts/hm-setup.sh
chmod +x ~/.scripts/cdevenv.sh
chmod +x ~/.scripts/testing.sh
