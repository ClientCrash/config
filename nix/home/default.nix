{ config, pkgs, inputs, ... }:

{
  imports = [
    ./fish.nix
    ./starship.nix
    ./nixvim.nix
    ./vscode.nix
    ./gtk.nix
    ./rofi.nix
    ./eww.nix
    ./hyprland.nix
    ./hyprpaper.nix
    ./kitty.nix
  ];

  home.username = "noah";
  home.homeDirectory = "/home/noah";
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  xdg.configFile."icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits=Catppuccin-Mocha-Dark-Cursors
  '';

  home.packages = with pkgs; [
    kitty
    hyprshot
    hyprpaper
    catppuccin-gtk
    catppuccin-cursors.mochaDark
    xfce.thunar
    rofi
    mako
    networkmanagerapplet
    starship
    pfetch
    htop
    eww
    neofetch
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  home.stateVersion = "25.05";
}
