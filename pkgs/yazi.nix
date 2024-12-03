{ config, pkgs, lib, ... }: let 
  yazi-flavors = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "flavors";
    rev = "main";
    sha256 = "sha256-MXfqd67yTAUkjqESJ9dkmmzvW+ui2ldYfbvF+fjUduk=";
  };
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    flavors = {
      catppuccin-mocha = "${yazi-flavors}/catppuccin-mocha.yazi";
    };
    theme = {
      flavor.use = "catppuccin-mocha";
    };
    shellWrapperName = "yy";
  };
}