#{ config, pkgs, ... }:
#
#{
#
#  imports = [
#    <home-manager/nixos>
#  ];
#
#  # # Initializes home manager
#  home-manager.users.poppy = { pkgs, ... }: {
#    home.packages = with pkgs; [ 
#      
#    ];
#
#    # Enables git as well as sets credentials
#    programs.git = {
#      userEmail = "kvbayard@gmail.com";
#      userName = "Kings-B";
#
#      # Stores the git password or auth token to remove the requirement to provide it every push
#      extraConfig = {
#      	credential.helper = "store";
#      };
#    };
#
#
#
#    home.stateVersion = "24.11";
#  };
#
#  home-manager.useGlobalPkgs = true;
#}
