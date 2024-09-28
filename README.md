# nixos-config

## Installation

1. Enter a shell with `vim`, `git` and `just`

   ```shell
   nix-shell -p vim git just
   ```
2. Clone the repo 

   ```shell
   git clone https://github.com/Parzival1918/nixos-config ~/.dotfiles
   ```

3. Set the correct settings in `flake.nix`

   ```shell
   vim flake.nix
   ```

4. Rebuild the system using `just`

   ```shell
   just r
   ```