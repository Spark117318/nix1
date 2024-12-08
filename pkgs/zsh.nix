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
      eval $(keychain --quiet --eval --agents ssh SC1_rsa) 
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__conda_setup"
      else
          if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
              . "/opt/anaconda3/etc/profile.d/conda.sh"
          else
              export PATH="/opt/anaconda3/bin:$PATH"
          fi
      fi
      unset __conda_setup
      # <<< conda initialize <<<
      export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
      export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
      export PATH=/home/xiaqian/.local/bin:$PATH
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
