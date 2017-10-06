self: super:

{
  yi-my = super.yi.override {
    haskellPackages = self.haskell.packages.ghcHEAD;
    extraPackages = xs: with xs; [ ];
  };
}