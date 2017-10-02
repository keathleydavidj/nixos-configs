{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in
{

  "vim-nix" = buildVimPlugin {
    name = "vim-nix";
    src = fetchgit {
      url = "https://github.com/LnL7/vim-nix";
      rev = "867488a04c2ddc47f0f235f37599a06472fea299";
      sha256 = "1mwc06z9q45cigyxd0r9qnfs4ph6lbcwx50rf5lmpavakcn3vqir";
    };
    dependancies = [];
  };

  "ale" = buildVimPlugin {
    name = "ale";
    src = fetchgit {
      url = "https://github.com/w0rp/ale";
      rev = "79701f6f200489d0eef2ea6e91f7e46be012cdd3";
      sha256 = "1yfzy5jrbpa2cfzby7qslrlfpz3c6xh6qnhm3hbhjsjfs5brl4id";
    };
    dependencies = [];
  };
}
