{ config, pkgs, ... }:

{
  xdg.configFile."rofi/themes/catppuccin-mocha.rasi".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/rofi/71fb15577ccb091df2f4fc1f65710edbc61b5a53/themes/catppuccin-mocha.rasi";
    sha256 = "sha256-iyh6RcbIw5tX1PdzMmOLYvYjA2YVqdfJ/J6lJZgHdkY=";
  };

  xdg.configFile."rofi/config.rasi".text = ''
    @theme "catppuccin-mocha"
  '';
}
