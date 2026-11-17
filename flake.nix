{
  description = "a collection of nix templates";

  outputs = { self }: {
    templates.default = {
      path = ./default;
      description = "default template";
    };

    templates.vscode = {
      path = ./vscode;
      description = "VS Code with extensions and devshell";
    };

    templates.just = {
      path = ./just;
      description = "Justfile-based repositories";
    };

    templates.rust = {
      path = ./rust;
      description = "Rust (cargo, clippy, rust-analyzer)";
    };

    templates.go = {
      path = ./go;
      description = "Go (gopls, delve)";
    };

    templates.python = {
      path = ./python;
      description = "Python (uv, ruff, pyright)";
    };

    templates.node = {
      path = ./node;
      description = "Node.js (pnpm, TypeScript)";
    };

    templates.zig = {
      path = ./zig;
      description = "Zig (zig, zls)";
    };

    templates.deno = {
      path = ./deno;
      description = "Deno";
    };

    # You can add more templates here if desired:
    # templates.another-template = {
    #   path = ./path-to-other-folder;
    #   description = "...";
    # };
  };
}
