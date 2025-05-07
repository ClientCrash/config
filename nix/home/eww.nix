xdg.configFile."eww/eww.yuck".text = ''
  (defwidget bar []
    (box :orientation "h"
         :spacing 10
         :class "bar"
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
