{
  description = "a collection of nix templates";

  outputs = { self }: {
    templates.default = {
      path = ./default;
      description = "default template";
    };

    # You can add more templates here if desired:
    # templates.another-template = {
    #   path = ./path-to-other-folder;
    #   description = "...";
    # };
  };
}
