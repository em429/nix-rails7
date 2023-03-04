# Nix Runner
#!/usr/bin/env -S nix run 'github:clhodapp/nix-runner/32a984cfa14e740a34d14fad16fc479dec72bf07' --

## Pure build disabled for now
##pure

# Registries
#!registry nixpkgs github:NixOS/nixpkgs
#!registry nixpkgs-ruby github:bobvanderlinden/nixpkgs-ruby

# Set Ruby version here -->
#!package github:bobvanderlinden/nixpkgs-ruby#"ruby-3.2.1"

# Pure build disabled for now
##package nixpkgs#coreutils
##package nixpkgs#git
##package nixpkgs#bash
##package nixpkgs#nix
##package nixpkgs#nix-direnv


# Interpreter
#!command bash



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
