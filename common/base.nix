{ pkgs, config, ... }:

{
  # Import custom modules
  # imports = import ../module/all.nix;

  # import custom package overrides TODO learn about overlays
  # nixpkgs.config.packageOverrides = pkgs: (import ../package {
  #   pkgs = pkgs;
  # });

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

  programs.fish.enable = true;
}
