{ config, pkgs, ... }:

{
  xdg.configFile."eww/eww.yuck".source = ./eww/eww.yuck;
  xdg.configFile."eww/eww.scss".source = ./eww/eww.scss;
}
