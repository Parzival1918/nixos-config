{config, pkgs, ...}:
{
    home.packages = with pkgs; [
        typst
        #texliveFull
    ];
}
