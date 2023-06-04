{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-ruby.url = "github:bobvanderlinden/nixpkgs-ruby";
    
    devenv.url = "github:cachix/devenv";
  };

  outputs = { self, nixpkgs, devenv, ... } @ inputs:
    let
      systems = [ "x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = f: builtins.listToAttrs (map (name: { inherit name; value = f name; }) systems);
    in
    {
      devShells = forAllSystems
        (system:
          let
            pkgs = import nixpkgs {
              inherit system;
            };
          in
          {
            default = devenv.lib.mkShell {
              inherit inputs pkgs;
              modules = [
                {
                  languages.ruby.enable = true;
                  languages.ruby.versionFile = ./.ruby-version;
                  difftastic.enable = true;

                  # https://devenv.sh/reference/options/
                  packages = [
                   pkgs.nodejs

                   # Language servers NOTE: Install solargraph through your Gemfile
                   pkgs.nodePackages.vscode-html-languageserver-bin
                   pkgs.nodePackages.vscode-css-languageserver-bin
                   pkgs.nodePackages.typescript-language-server
                   pkgs.nil # nix language server

                   # Testing
                   pkgs.chromedriver pkgs.ungoogled-chromium
                  ];

                  enterShell = ''
                    bundle
                  '';
                }
              ];
            };
          });
    };
}
