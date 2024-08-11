{config, pkgs, ...}:
{
    imports = [
        ./conform.nix
        ./gitsigns.nix
        ./lsp.nix
        ./mini.nix
        ./nvim_cmp.nix
        ./telescope.nix
        ./treesitter.nix
        ./which_key.nix
        ./autopairs.nix
    ];

    programs.nixvim = {
        plugins = {
            # Detect tabstop and shiftwidth automatically
            # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
            sleuth = {
                enable = true;
            };

            # "gc" to comment visual regions/lines
            # https://nix-community.github.io/nixvim/plugins/comment/index.html
            comment = {
                enable = true;
            };

            # Highlight todo, notes, etc in comments
            # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
            todo-comments = {
                enable = true;
                signs = true;
            };
        };

        # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraplugins
        extraPlugins = with pkgs.vimPlugins; [
        # Useful for getting pretty icons, but requires a Nerd Font.
            nvim-web-devicons # TODO: Figure out how to configure using this with telescope
        ];
    };
}
