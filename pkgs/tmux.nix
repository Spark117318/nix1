{config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    terminal = "screen-256color";
    extraConfig = ''
      unbind '"'
      bind - split-window -v -c '#{pane_current_path}'

      unbind %
      bind \\ split-window -h -c '#{pane_current_path}'
    '';
  };
}