{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.openssh.enable = true;
  programs.git.enable = true;
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    wget curl vim git google-chrome vscode docker
    dbus
    zlib.dev
  dbus-glib
  pkg-config
  gnumake
    sudo gcc clang nodejs rustc cargo go openjdk jetbrains-toolbox
    lxqt.lxqt-policykit tty-clock cbonsai gradle jq atlauncher spotify
  ];



  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    
    xorg.libX11
    xorg.libXext
    xorg.libXrandr
    xorg.libXcursor
    xorg.libXxf86vm
    xorg.libXi
    xorg.libXinerama
    xorg.libXrender
    xorg.libXtst

    libGL


    alsa-lib
    openal

    freetype
    fontconfig
    libpng
    libjpeg_turbo
    zlib
    dbus
    dbus-glib
    libvorbis
  ];




  environment.sessionVariables = {
    GBM_BACKEND             = "nvidia-drm";
    __GL_GSYNC_ALLOWED      = "0";
    __GL_VRR_ALLOWED        = "0";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_EGL_NO_MODIFIERS    = "1";

    XDG_DATA_DIRS = pkgs.lib.mkForce "/var/lib/flatpak/exports/share:/home/noah/.local/share/flatpak/exports/share:/run/current-system/sw/share:/usr/local/share:/usr/share";
  };

  users.users.noah = {
    isNormalUser    = true;
    extraGroups     = [ "wheel" "networkmanager" "docker" ];
    initialPassword = "changeme";
    shell           = pkgs.fish;
  };

  hardware.opengl.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false;
  services.xserver.videoDrivers = [ "nvidia" ];
  security.polkit.enable = true;

  services.pipewire = {
    enable            = true;
    pulse.enable      = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
  };

  services.flatpak.enable = true;

  services.xserver = {
    enable                     = true;
    displayManager.gdm.enable  = true;
    desktopManager.gnome.enable = false;
  };

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  system.stateVersion = "25.05";
}
