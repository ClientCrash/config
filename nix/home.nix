{ config, pkgs, inputs, system, ... }:

{
  home.username = "noah";
  home.homeDirectory = "/home/noah";

  programs.home-manager.enable = true;

  # Fish config
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -alF";
      update = "nixos-rebuild switch --flake .#nixos";
    };
    interactiveShellInit = ''
      set -g fish_greeting
      starship init fish | source
    '';
  };

  # Starship prompt
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory $git_branch $character";
      add_newline = false;

      directory.style = "bold lavender";

      git_branch.symbol = " ";
      git_branch.style = "peach";

      character.success_symbol = "[➜](green)";
      character.error_symbol = "[➜](red)";
    };
  };

  # NixVim config
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    colorscheme = "catppuccin-mocha";
  };

  # VSCode config
 programs.vscode = {
  enable = true;
  package = pkgs.vscode;
  extensions = with pkgs.vscode-extensions; [
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons
    ms-python.python
    bbenoist.nix
    ms-vscode.cpptools
    golang.go
    rust-lang.rust-analyzer
    esbenp.prettier-vscode
    dbaeumer.vscode-eslint
  ];
  profiles.default = {
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Latte";
      "workbench.iconTheme" = "Catppuccin";
      "editor.fontFamily" = "JetBrainsMono Nerd Font, monospace";
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
    };
  };
};

  # GTK theme
  gtk = {
    enable = true;
    theme.name = "Catppuccin-Mocha-Compact-Lavender-Dark";
    iconTheme.name = "Papirus-Dark";
  };

  # Waybar config
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
        "4" = "󰊖";
        "5" = "";
        "6" = "";
        "7" = "";
        "8" = "";
        "9" = "";
        "10" = "󰎈";
      };
    };

    window = { format = "{}"; max-length = 60; tooltip = false; };
    network = { format-wifi = " {essid}"; format-ethernet = " {ifname}"; tooltip = true; };
    pulseaudio = { format = " {volume}%"; tooltip = true; };
    battery = { format = "{capacity}% {icon}"; format-icons = ["" "" "" "" ""]; };
  }];

  style = builtins.readFile (pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/waybar/main/themes/latte.css";
    sha256 = "104iz702xmviivrk8s7sp8izh545vwfyi3nvylch4fakm6wbs2qg";
  });
};


  # Hyprland config
  xdg.configFile."hypr/hyprland.conf".text = ''
    general {
      col.active_border = rgba(89b4faee)
      col.inactive_border = rgba(1e1e2eee)
      gaps_in = 3
      gaps_out = 8
      border_size = 2
    }

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

  # Hyprpaper config
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/noah/Downloads/wallpaper.png
    wallpaper = HDMI-A-1,/home/noah/Downloads/wallpaper.png
    wallpaper = DP-1,/home/noah/Downloads/wallpaper.png
    wallpaper = DP-2,/home/noah/Downloads/wallpaper.png
  '';

  # Kitty theme
    xdg.configFile."kitty/kitty.conf".text = ''
    include themes/Catppuccin-Latte.conf
    font_family      JetBrainsMono Nerd Font
    font_size        12.0
  '';

  xdg.configFile."kitty/themes/Catppuccin-Latte.conf".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/kitty/main/themes/latte.conf";
    sha256 = "137yfzqz09mnc8xis0cdxlz93jirgbh4j4cfcxzq1g8fg0n1v0jj";
  };


  # Cursor
  xdg.configFile."icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits=Catppuccin-Mocha-Dark-Cursors
  '';

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    kitty
    hyprpaper
    catppuccin-gtk
    catppuccin-cursors
    xfce.thunar
    rofi
    waybar
    mako
    networkmanagerapplet
    starship
    pfetch
    htop
    neofetch
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
  ];

  home.stateVersion = "25.05";
}
