{ config, pkgs, ... }:

{
  xdg.configFile."rofi/themes/catppuccin-mocha.rasi".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/rofi/71fb15577ccb091df2f4fc1f65710edbc61b5a53/themes/catppuccin-mocha.rasi";
    sha256 = "0mdg3kmszkdr50n4c69p6xkf7ilh57h39hp4nwbfzyfm6wn89rza";
  };

  xdg.configFile."rofi/config.rasi".text = ''
    @theme "catppuccin-mocha"
  '';
}
