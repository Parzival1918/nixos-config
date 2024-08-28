{pkgs-unstable, config, ...}:
{
    home.packages = with pkgs-unstable; [
        jetbrains.pycharm-community-src
    ];
}
