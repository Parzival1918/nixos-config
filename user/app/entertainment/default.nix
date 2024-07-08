{config, pkgs, ...}:
{
    home.packages = with pkgs; [
        popcorntime
    ];

    programs.mpv.enable = true;
}
