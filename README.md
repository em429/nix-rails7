This is a Rails 7, nix flake based development environment powered by [devenv.sh](https://devenv.sh/). I made this as their default setup is not based on flakes, and while there is docs I wanted something I can refer to and run quickly.

It is the very base of what I use on every project: tailwind, an lsp, linter, and factory_bot+faker for testing.

#### Setup using magic.sh

`magic.sh` sets up everything in one go. If you need more control, I recommend running the commands manually, the script is very short.

### Usage:
```
$ ./magic.sh project-name  
$ cd project-name
$ rails new . 
```  

#### NOTE: when prompted to overwrite template files, say no!

### Dependencies:
  - [nix the package manager](https://determinate.systems/posts/determinate-nix-installer)
  - currently [nix-direnv](https://github.com/nix-community/nix-direnv) must also be installed for this to work
    until I figure out why it doesn't run through nix run. 
