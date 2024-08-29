# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      # efiSysMountPoint = "/efi";
      canTouchEfiVariables = true;
    };
  };

  # Filesystems
  fileSystems."/home" = {
    #device = "/dev/sda3";
    device = "/dev/disk/by-uuid/f7b2d5de-12af-471e-b24b-f59fdf43c19f";
    fsType = "ext4";
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
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

  # Sound settings
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = ",,";
    options = "grp:alt_shift_toggle";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lain = {
    isNormalUser = true;
    description = "lain";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      telegram-desktop
      discord
      feh
      dunst
      xkb-switch
      pamixer
      flameshot
      noisetorch
      vivaldi
      qbittorrent
      wpsoffice
      brave
      vlc
      obs-studio
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Xserver configuration
  services.xserver = {
    enable = true;
    autorun = false;
    displayManager.startx.enable = true;
  };

  # DWM setup
  #services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager = {
    dwm.enable = true;
    dwm.package = pkgs.dwm.overrideAttrs {
      src = ./dwm;
    };
  };

  # Fonts settings
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "SourceCodePro"]; })
  ];

  xdg.portal = {
    #xdgOpenUsePortal = true;
    enable = true;
    config.common.default = "*";
    # wlr.enable = true;
    # lxqt.enable = true;
    extraPortals = [
      # pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      # pkgs.xdg-desktop-portal-hyprland
      # pkgs.xdg-desktop-portal-kde
      # pkgs.xdg-desktop-portal-wlr
    ];
  };

  # Other services
  services = {
    picom.enable = true;
    picom.vSync = true;
    flatpak.enable = true;
  };

  # NeoVim setup
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     # Net utils
     wget
     git
     curl
     iptables
     ipset
     librewolf

     # Info
     neofetch
     htop
     btop
     fzf
     ripgrep
     pcmanfm

     # GUI
     st
     dmenu
     alacritty
     picom
     xclip

     # Development
     gcc
     gdb
     python3
     man-pages
     tmux
     nnn
     rar
     unzip
     gnumake
     xorg.libX11
     xorg.libXft
     xorg.libXinerama

     # Virtualization
     qemu
     virt-manager

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
