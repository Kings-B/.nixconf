{ config, pkgs, ... }:

{
  
  # # List of custom command aliasses
  environment.shellAliases = {
    wofi-conf = "cd ~/.config/wofi/";
    hypr-conf = "cd ~/.config/hypr/";
    nix-conf = "cd /etc/nixos/";
    nvim-conf = "cd ~/.config/nvim/";
    ghostty-conf = "cd ~/.config/ghostty/";
    waybar-conf = "cd ~/.config/waybar/";
    home-conf = "cd ~/.config/home-manager";

    nvim-nix = "sudo -E nvim /etc/nixos/configuration.nix";
    nvim-hypr = "nvim ~/.config/hypr/hyprland.conf";
    nvim-wofi-style = "nvim ~/.config/wofi/style.css";
    nvim-wofi-conf = "nvim ~/.config/wofi/config";
    nvim-ghostty-conf = "nvim ~/.config/ghostty/config";
    nvim-waybar-style = "nvim ~/.config/waybar/style.css";
    nvim-waybar-conf = "nvim ~/.config/waybar/config.jsonc";
    nvim-nvim = "nvim ~/.config/nvim/init.lua";
    nvim-home = "nvim ~/.config/home-manager/home.nix";

    setup = "bash /etc/nixos/cc/scripts/setup.sh";
    testing = "bash ~/.scripts/testing.sh";
    cde = "bash ~/.scripts/devenv.sh";
  };
  
}
