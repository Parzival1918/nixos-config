alias gc := garbage-collect
alias gcf := garbage-collect-full

# list all recipes
@default:
    just --list

# rebuild system and user configuration
rebuild target='system':
    git add -AN
    sudo nixos-rebuild switch --flake .#{{target}}

# full garbage collection
garbage-collect-full:
    sudo nix-collect-garbage -d
    nix-collect-garbage -d

# garbage collection
garbage-collect time='7d':
    sudo nix-collect-garbage --delete-older-than {{time}}
    nix-collect-garbage --delete-older-than {{time}}

# update flake inputs
update:
    sudo nix flake update
