{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme.name = "Catppuccin-Mocha-Compact-Lavender-Dark";
    iconTheme.name = "Papirus-Dark";
  };

  gtk.cursorTheme = {
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
  };
}
