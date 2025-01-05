{ config, pkgs, ... }:

{
  
  # # List of custom command aliasses
  environment.shellAliases = {
    wofi-conf = "cd ~/.config/wofi/";
    hypr-conf = "cd ~/.config/hypr/";
    nix-conf = "cd /etc/nixos/";
    nvim-conf = "cd ~/.config/nvim/";

    nvim-nix = "sudo -E nvim /etc/nixos/configuration.nix";
    nvim-hypr = "nvim ~/.config/hypr/hyprland.conf";
  };
  
}
