{ config, pkgs, ... }:

{
  
  # # List of custom command aliasses
  environment.shellAliases = {
    wofi-conf = "cd ~/.config/wofi/";
    hyprland-conf = "cd ~/.config/hypr/";
    nix-conf = "cd /etc/nixos/";
    nvim-conf = "cd ~/.config/nvim/init.lua";

    nvim-nix = "sudo -E nvim /etc/nixos/configuration.nix";
  };
  
}
