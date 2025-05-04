{ config, pkgs, ... }:

{
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
}
