#  magic.sh sets up a Rails nix 7 flake template based on devenv.sh, in one go.
#  If you need more control, I recommend running the commands manually.
#
#
#  Usage:
#  ------
#
#    $ ./magic.sh project-name  
#    $ cd project-name
#    $ rails new . 
#  
#  NOTE: when prompted to overwrite template files, say no!
#
#  Dependencies:
#  -------------
#  
#  - nix the package manager
#  - currently nix-direnv must also be installed for this to work
#    until I figure out why it doesn't run through nix run. 
#

# 'Magic comments' section, powered by nix and nix-runner
# -------------------------------------------------------

# Nix Runner
#!/usr/bin/env -S nix run 'github:clhodapp/nix-runner/32a984cfa14e740a34d14fad16fc479dec72bf07' --

# Interpreter
#!command bash

# Set Ruby version here -->
#!package github:bobvanderlinden/nixpkgs-ruby#"ruby-3.2.1"

# Registries
#!registry nixpkgs github:NixOS/nixpkgs
#!registry nixpkgs-ruby github:bobvanderlinden/nixpkgs-ruby

## Pure build disabled for now
##pure
##package nixpkgs#coreutils
##package nixpkgs#git
##package nixpkgs#bash
##package nixpkgs#nix
##package nixpkgs#nix-direnv


# Start of script
# ---------------

project_name=$1

mkdir $project_name && cd $project_name
git init --quiet && git branch -M main
nix flake init --template github:qirpi/nix-rails7
git add .

direnv allow .
direnv exec . ruby -v
direnv exec . rails --version

# And that's it! :)

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
echo
