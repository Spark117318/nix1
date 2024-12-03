{ config, pkgs, programs, lib, ... }:

{
  programs.zsh = {
    # Enable Zsh as the default shell
    enable = true;
    enableCompletion = true;
    # autosuggestions.enable = true;
    syntaxHighlighting = {
      enable = true;
    };

    autosuggestion = {
      enable = true;
      
    };

    shellAliases = {
      # You can define your custom aliases here
      gs = "git status";
      ll = "ls -al";
      la = "ls -a";
      l = "ls";
    };

    history = {
      size = 10000;
    };
    
    historySubstringSearch = {
      enable = true;

    };

    initExtraFirst = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';

    # plugins = [
    #   {
    #     names = "zsh-powerlevel10k";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "romkatv";
    #       repo = "powerlevel10k";
    #       rev = "master";
    #       sha256 = lib.fakeSha256;
    #     };
    #   }
    # ];
    
  };
}
