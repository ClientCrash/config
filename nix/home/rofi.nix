{ config, pkgs, ... }:

{
  xdg.configFile."rofi/themes/catppuccin-mocha.rasi".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/rofi/refs/heads/main/themes/catppuccin-mocha.rasi";
    sha256 = "0mdg3kmszkdr50n4c69p6xkf7ilh57h39hp4nwbfzyfm6wn89rza";
  };

  xdg.configFile."rofi/config.rasi".text = ''
    @theme "catppuccin-mocha"
  '';
}