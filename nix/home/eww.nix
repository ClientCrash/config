{ config, pkgs, ... }:

{
  xdg.configFile."eww/eww.yuck".text = ''
    (defwindow bar
      :monitor 1
      :geometry (geometry :x "0" :y "0" :width "100%" :height "30px")
      :stacking "fg"
      :anchor "bottom center"
      :exclusive true
      :class "bar"
      (box :orientation "h" :spacing 10
        (label :text "🕒 Time goes here")
      )
    )
  '';

  xdg.configFile."eww/eww.scss".text = ''
    .bar {
      background-color: #1e1e2e;
      color: #cdd6f4;
      padding: 8px;
      font-size: 16px;
      border-radius: 10px;
    }
  '';
}
