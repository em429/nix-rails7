#!/usr/bin/env -S nix run 'github:clhodapp/nix-runner/32a984cfa14e740a34d14fad16fc479dec72bf07' --

#!registry nixpkgs github:NixOS/nixpkgs
#!registry nixpkgs-ruby github:bobvanderlinden/nixpkgs-ruby

# Fully pure build (disabled for now)
# So you must have nix-direnv installed / enabled already.
##pure
##package nixpkgs#coreutils
##package nixpkgs#git
##package nixpkgs#bash
##package nixpkgs#nix
##package nixpkgs#nix-direnv

# Ruby
#!package github:bobvanderlinden/nixpkgs-ruby#"ruby-3.2.1"

# Interpreter
#!command bash

mkdir $1 && cd $1
git init && git branch -M main
nix flake init --template github:qirpi/nix-rails7
git add .

direnv allow .
direnv exec . rails --version
direnv exec . ruby -v

echo
echo "-----------------------------------------------------"
echo "  Your brand new Rails devenv is ready.. Have fun!   "
echo "_____________________________________________________"
echo
