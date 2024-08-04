{config, pkgs, ...}:
{
    programs.fzf = {
        enable = true;

        enableBashIntegration = true;
        enableFishIntegration = true;

        fileWidgetCommand = "${pkgs.fd} --type f";
    };
}
