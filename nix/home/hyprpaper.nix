{ config, pkgs, ... }:

{
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/noah/Downloads/wallpaper.png
    wallpaper = HDMI-A-1,/home/noah/Downloads/wallpaper.png
    wallpaper = DP-1,/home/noah/Downloads/wallpaper.png
    wallpaper = DP-2,/home/noah/Downloads/wallpaper.png
  '';
}
