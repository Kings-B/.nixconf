{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cc/virtual-machine.nix
      ./cc/aliases.nix
      ./cc/home-manager.nix
      ./cc/scripts.nix
    ];

  # # Nix Flakes
  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # # GRUB bootloader.
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 300;
    };
  };

  # # Enable usage of the SDDM display manger 
  services.displayManager = {
    sddm.wayland.enable = true;
    sddm.enable = true;
    sddm.theme = "sugar-dark";
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # # Enable networking
  networking.networkmanager.enable = true;

  # # Set your time zone.
  time.timeZone = "America/New_York";

  # # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # # Nvidia Drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
     modesetting.enable = true;
     open = false; # Propietary Nvidia Drivers (For open source drivers change to true)
  };  

  # # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.poppy = {
    isNormalUser = true;
    description = "Poppy Field";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm"];
    packages = with pkgs; [];
  };

  # # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # # Nix Flakes (Double Check)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # # Permitted Insecure Packages that get blocked when using nixos-rebuild
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];

  # # List packages installed in system profile: nix search wget
  environment.systemPackages = with pkgs; [
    btop
    gnome-keyring
    libsecret
    polkit
    hyprpolkitagent
    libsForQt5.qt5ct
    xfce.thunar
    udisks2
    udiskie
    gvfs
    libva-utils
    onlyoffice-desktopeditors
    wlr-randr
    gcc
    gnumake
    libsForQt5.qt5.qtgraphicaleffects
    corefonts
    google-fonts
    nerdfonts
    hyprpaper

    # -------------------- #

    you-get
    neofetch
    pavucontrol
    gh
    wl-clipboard
    ripgrep
    unzip
    fd
    logseq  super-productivity
    obs-studio
    discord
    neovim  
    luajitPackages.lua-lsp
    celluloid
    git
    github-desktop
    ghostty
    tealdeer
    wofi
    imwheel

    # -------------------- #

    (builtins.getFlake "github:youwen5/zen-browser-flake").packages.${builtins.currentSystem}.default

    # -------------------- #

    (callPackage /etc/nixos/sddm-themes/TerminalStyleLogin.nix {}).sddm-sugar-dark
  ];

  services.udisks2.enable = true;

  environment.variables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "Fusion";
  };

  # # Enable Hyprland
  programs.hyprland.enable = true;

  # # Enable gnome keyring servie. This is required to be able to sign into github desktop and probably other services.
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  # # Setting up steam graphics
  #  hardware.graphics = {
  #    enable = true;
  #  extraPackages = with pkgs; [
  #    vulkan-loader
  #  ];
  #  extraPackages32 = with pkgs.pkgsi686Linux; [
  #    vulkan-loader
  #    mesa
  #  ];
  #};
  #
  #programs.steam.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
