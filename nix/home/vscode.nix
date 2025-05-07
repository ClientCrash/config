{ config, pkgs, ... }:

{
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
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "Catppuccin Mocha";
        "editor.fontFamily" = "JetBrainsMono Nerd Font, monospace";
        "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      };
    };
  };
}
