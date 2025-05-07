{ config, pkgs, ... }:

{
  xdg.configFile."hypr/hyprland.conf".text = ''
    env = HYPRLAND_LOG_WLR, 1
    env = XCURSOR_THEME, catppuccin-mocha-dark-cursors
    env = LIBVA_DRIVER_NAME,nvidia
    env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    general {
      col.active_border = rgba(89b4faee)
      col.inactive_border = rgba(1e1e2eee)
      gaps_in = 3
      gaps_out = 8
      border_size = 2
    }

    debug:disable_logs = false
    debug:enable_stdout_logs = true

    bind = SUPER, RETURN, exec, kitty
    bind = SUPER, Q, killactive,
    bind = SUPER, E, exec, xfce4-terminal
    bind = SUPER, D, exec, rofi -show drun
    bind = SUPER, F, fullscreen
    bind = SUPER, V, togglefloating
    bind = SUPER_SHIFT, R, exec, hyprctl reload
    bind = SUPER_SHIFT, L, exec, hyprctl dispatch exit

    bind = SUPER, H, movefocus, l
    bind = SUPER, L, movefocus, r
    bind = SUPER, K, movefocus, u
    bind = SUPER, J, movefocus, d

    bind = SUPER_SHIFT, H, movewindow, l
    bind = SUPER_SHIFT, L, movewindow, r
    bind = SUPER_SHIFT, K, movewindow, u
    bind = SUPER_SHIFT, J, movewindow, d

    exec-once = discord
    exec-once = firefox
    exec-once = waybar &
    exec-once = mako &
    exec-once = nm-applet &
    exec-once = thunar --daemon &
    exec-once = lxqt-policykit-agent &
    exec-once = hyprpaper

    windowrulev2 = workspace 1, title:^(.*Discord.*)$
    windowrulev2 = workspace 3, class:^(firefox|chromium|chrome)$

    exec-once = hyprctl dispatch workspace 2
  '';
}
