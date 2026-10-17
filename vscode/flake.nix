{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, devshell, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ devshell.overlays.default ];
          config.allowUnfree = true;
        };

        editor = pkgs.vscode-with-extensions.override {
          vscode = pkgs.vscode;
          extensions = with pkgs.vscode-extensions; [
            mkhl.direnv
          ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            # {
            #   name = "extension-name";
            #   publisher = "publisher-id";
            #   version = "x.y.z";
            #   sha256 = "sha256-hash-here=";
            # }
          ];
        };
      in
      {
        packages.vscode = editor;

        devShells.default = pkgs.devshell.mkShell {
          packages = [
            #
          ] ++ editor;

          env = [
            # {
            #   name = "";
            #   value = ""
            # }
            { name = "CGO_ENABLED"; value = "0"; }
          ];
        };
      });
}
