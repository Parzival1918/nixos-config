{config, pkgs, inputs, systemSettings, ...}:
{
    home.packages = with pkgs; [
        popcorntime
    ] ++ [
        inputs.lobster.packages.${systemSettings.system}.lobster
    ];

    programs.mpv.enable = true;
}
