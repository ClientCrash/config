{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      height = 32;
      spacing = 8;
      modules-left = [ "hyprland/workspaces" "window" ];
      modules-center = [ "clock" ];
      modules-right = [ "network" "pulseaudio" "battery" "tray" ];

      clock = { format = "{:%A %d %B | %H:%M}"; tooltip = true; };

      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = "󰙯";
          "2" = "";
          "3" = "";
        };
      };

      window = { format = "{}"; max-length = 60; tooltip = false; };
      network = { format-wifi = "  {essid} "; format-ethernet = "  {ifname} "; tooltip = true; };
      pulseaudio = { format = "  {volume}% "; tooltip = true; };
      battery = { format = "{capacity}% {icon}"; format-icons = ["" "" "" "" ""]; };
    }];
    style = builtins.readFile (pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/waybar/main/themes/mocha.css";
      sha256 = "05yx7v4j9k1s1xanlak7yngqfwvxvylwxc2fhjcfha68rjbhbqx6";
    });
  };
}
