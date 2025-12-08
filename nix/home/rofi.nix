{ config, pkgs, ... }:

let
  catppuccinRofiVersion = "71fb15577ccb091df2f4fc1f65710edbc61b5a53";
  

  catppuccinDefaultRasi = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/rofi/${catppuccinRofiVersion}/catppuccin-default.rasi";
    sha256 = "1f3r6yarrykj8cxvi5hblzlr5n8zbncifnxps9xl5gl32w6ysq5z";
  };
  
  catppuccinDefaultMocha = pkgs.writeText "catppuccin-default-mocha.rasi" ''
    @import "catppuccin-mocha.rasi"
    
    ${builtins.readFile catppuccinDefaultRasi}
  '';

in
{
  xdg.configFile."rofi/themes/catppuccin-mocha.rasi".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/rofi/${catppuccinRofiVersion}/themes/catppuccin-mocha.rasi";
    sha256 = "sha256-iyh6RcbIw5tX1PdzMmOLYvYjA2YVqdfJ/J6lJZgHdkY=";
  };

  xdg.configFile."rofi/themes/catppuccin-default.rasi".source = catppuccinDefaultMocha;

  xdg.configFile."rofi/config.rasi".text = ''
    @theme "catppuccin-default"
  '';
}