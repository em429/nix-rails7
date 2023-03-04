#!/usr/bin/env bash

# TODO: check $PROJECT_NAME env var exists, abort if not


if [[ -z "${PROJECT_NAME}" ]]; then
  echo
  echo "Error: PROJECT_NAME env var must be set!"
  echo
  echo "Re-launch like this: 'PROJECT_NAME=candies nix run github:qirpi/nix-rails7#bootsrap'"
  echo
  exit 1;
fi

mkdir $PROJECT_NAME && cd $PROJECT_NAME
git init --quiet && git branch -M main
nix flake init --template github:qirpi/nix-rails7
git add .

direnv allow .
direnv exec . ruby -v
direnv exec . rails --version

# And that's it! :)

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
