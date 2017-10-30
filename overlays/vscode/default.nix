self: super:

{
  my-vscode = super.vscode-with-extensions.override {
    vscodeExtensions = with self.vscode-extensions; [
      "benoist.nix"
      "dbaeumer.vscode-eslint"
      "dzannotti.vscode-babel-coloring"
      "emberjs.vscode-ember"
      "ciena-blueplanet.vsc-ember-frost"
    ];
  };
}