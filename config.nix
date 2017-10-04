{ pkgs }:

rec {
  allowUnfree = true;
  packageOverrides = pkgs: 
  rec {
    ember-env = with pkgs; buildEnv {
      name = "ember-env";
      paths = [
        nodejs
        nodePackages.bower
        nodePackages.eslint
        nodePackages.yarn
      ];
    };
  };
}