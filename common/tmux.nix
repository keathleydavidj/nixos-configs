{ ... }:
{
  programs.tmux = {
    enable = true;
    enableSensible = true;
    enableMouse = true;
    # enableFzf = true;
    enableVim = true;

    tmuxConfig = ''
      bind-key -n M-r run "tmux send-keys -t .+ C-l Up Enter"
      bind-key -n M-R run "tmux send-keys -t $(hostname -s | awk -F'-' '{print tolower($NF)}') C-l Up Enter"
      bind 0 set status
      bind-key -r "<" swap-window -t -1
      bind-key -r ">" swap-window -t +1
      set -g status-bg black
      set -g status-fg white
    '';
  };
}