A nix flake based Rails 7 development environment powered by [devenv.sh](https://devenv.sh/).

I made this as their default setup is not based on flakes, and while they have good [docs](https://devenv.sh/guides/using-with-flakes/), I wanted something that works with a single `nix run` invocation for my base defaults.

This is the very base of what I use on every new project:
- latest ruby + rails
- tailwindcss
- language servers for rb+html+js
- a linter (rubocop)
- factory_bot + faker for testing

#### Usage

To set up everything in one go, run:

```
PROJECT_NAME=candies nix run github:qirpi/nix-rails7
cd candies
rails new .
```

**NOTE: when prompted to overwrite template files, say no!**

#### If you need more control, use just the template:

```
mkdir $PROJECT_NAME && cd $PROJECT_NAME
git init --quiet && git branch -M main

nix flake init --template github:qirpi/nix-rails7
git add .
direnv allow . 
rails new .
```

#### Dependencies:
  - [nix the package manager](https://determinate.systems/posts/determinate-nix-installer)
  - currently [nix-direnv](https://github.com/nix-community/nix-direnv) must also be installed for this to work
    until I figure out why it doesn't run through nix run. 
