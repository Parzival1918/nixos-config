{config, pkgs, inputs, systemSettings, ...}:
{
    home.packages = with pkgs; [
        popcorntime
        netflix
    ] ++ [
        inputs.lobster.packages.${systemSettings.system}.lobster
    ];

    programs.mpv.enable = true;
}
