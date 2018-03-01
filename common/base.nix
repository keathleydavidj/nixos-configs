{ pkgs, config, ... }:

{
  time.timeZone = "America/Chicago";

  nixpkgs.config.allowUnfree = true;

  # add some basic staples
  environment.systemPackages = with pkgs; [
    git
    silver-searcher
    tig
  ];

  environment.shellAliases = {
    c = "clear";
    ts = "tig status";
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      set -x NIX_REMOTE daemon
    '';
  };
}
