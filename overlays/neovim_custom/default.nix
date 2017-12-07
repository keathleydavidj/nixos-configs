self: super:

{
  neovim = super.neovim.override {
    vimAlias = true;
    configure = {
      vam.knownPlugins = self.vimPlugins;
      vam.pluginDictionaries = [
        { 
          names = [
            "commentary"
            "surround"
            "tmux-navigator"
            "vim-nix"
          ];
        }
      ];
    };
  };
}