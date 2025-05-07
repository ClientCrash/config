{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = "$username$directory$git_branch$character";
      add_newline = false;

      username = {
        show_always = true;
        style_user = "rosewater bold";
        style_root = "red bold";
        format = "[$user]($style) ";
      };

      directory = {
        style = "bold lavender";
        read_only = " ";
        read_only_style = "peach";
      };

      git_branch = {
        symbol = " ";
        style = "peach";
        format = "[$symbol$branch]($style) ";
      };

      character = {
        success_symbol = "[➜](green)";
        error_symbol = "[➜](red)";
      };

      git_status = {
        format = "([$all_status$ahead_behind]($style))";
        style = "maroon";
      };
    };
  };
}
