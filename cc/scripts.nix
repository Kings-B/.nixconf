{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # # TESTING # #
    (pkgs.writeShellApplication {
      name = "testing";
      text = ''
        echo "Hello, NixOS!"
      '';
    })
    # # INITIAL SETUP # #
    (pkgs.writeShellApplication {
      name = "setup";
      text = ''

      '';
    })
    # # DEV ENV SETUP # #
    (pkgs.writeShellApplication {
      name = "cdevenv";
      text = ''
        cat <<EOF > shell.nix
        { pkgs ? import <nixpkgs> {} }:

        pkgs.mkShell {
          name = "dev-env";
          
          buildInputs = with pkgs; [

          ];

          echo "Entering environment"
        }
        EOF

        echo "shell.nix has been created successfully!"
      '';
    })
  ];
}
