{ config, pkgs, ... }:

{
  xdg.configFile."kitty/kitty.conf".text = ''
    include themes/Catppuccin-Latte.conf
    font_family      JetBrainsMono Nerd Font
    font_size        12.0
  '';

  xdg.configFile."kitty/themes/Catppuccin-Latte.conf".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/kitty/main/themes/latte.conf";
    sha256 = "137yfzqz09mnc8xis0cdxlz93jirgbh4j4cfcxzq1g8fg0n1v0jj";
  };
}
