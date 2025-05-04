{ config, pkgs, ... }:

{
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
}
