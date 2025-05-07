{ config, pkgs, ... }:

{
  xdg.configFile."kitty/kitty.conf".text = ''
    include themes/Catppuccin-Mocha.conf
    font_family      JetBrainsMono Nerd Font
    font_size        12.0
    background_opacity  0.8
  '';

  xdg.configFile."kitty/themes/Catppuccin-Mocha.conf".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/kitty/main/themes/mocha.conf";
    sha256 = "094mj07fi3gq5j3gxgxh6aa7cxw8p3s6mfx4pczj8r1yqc0xvz4j";
  };
}
