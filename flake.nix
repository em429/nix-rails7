{
  description = "Rails 7 flake template with dev tools included";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs, ... }: {
    templates = {
      rails-7 = {
        path = ./rails-7;
        # welcomeText = ''
        # '';
      };
    };

    templates.default = self.templates.rails-7;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.bootstrap;
    packages.x86_64-linux.bootstrap =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in
      pkgs.writeShellScriptBin "bootstrap" ''

        mkdir $PROJECT_NAME && cd $PROJECT_NAME
        git init --quiet && git branch -M main
        nix flake init --template github:qirpi/nix-rails7
        git add .

        direnv allow .
        direnv exec . ruby -v
        direnv exec . rails --version

        echo
        echo "______________________________________________________________"
        echo
        echo "  Your brand new, flake based Rails devenv is ready.."
        echo 
        echo
        echo "  Next: run 'rails new .' inside the project folder."
        echo
        echo "  Have fun!" 
        echo "______________________________________________________________"
        echo

      '';
  };
}
