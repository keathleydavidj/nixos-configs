self: super:

let
  myEmacs = super.emacs25Macport;

  frontmacsLoadScript = builtins.fetchurl https://raw.githubusercontent.com/thefrontside/frontmacs/master/scripts/init-frontmacs.el;

  myEmacsConfig = self.writeText "default.el" ''
    (load ${frontmacsLoadScript})
  '';

in

{
  emacs25Macport = (super.emacsPackagesNgGen myEmacs).emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    (self.runCommand "default.el" {} ''
      mkdir -p $out/share/emacs/site-lisp
      cp ${myEmacsConfig} $out/share/emacs/site-lisp/default.el
    '')
  #   company
  #   counsel
  #   evil
  #   flycheck
  #   ivy
  #   magit
  #   projectile
  #   use-package
  #   gruvbox-theme
  ]));
}