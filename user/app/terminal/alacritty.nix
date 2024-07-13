{config, pkgs, lib, ...}:
{
    programs.alacritty = {
        enable = true;

        settings = {
            font.normal.family = lib.mkDefault "FiraMono Nerd Font";
        };
    };
}
