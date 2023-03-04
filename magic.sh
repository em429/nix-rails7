#  magic.sh sets up everything in one go:
#    - Creates the project folder and inits a git repo
#    - Inits the flake template
#    - git add . and direnv allow to make it work from start
#    - Runs direnv in the project folder, so it's cached immediately
#
#  Usage:
#
#  $ ./magic.sh project-name  
#
#  Dependencies:
#  
#  Currently nix-direnv must be installed for this to work until I figure out
#  why it doesn't run through nix run.
# 

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
