{config, pkgs, ...}:
{
    programs.zellij = {
        enable = true;

        enableBashIntegration = true;
        enableFishIntegration = true;
    };
}
