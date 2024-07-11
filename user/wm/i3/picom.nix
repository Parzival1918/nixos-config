{config, pkgs, ...}:
{
    services.picom = {
        enable = true;

        inactiveOpacity = 0.8;

        settings = {
            blur = {
                background = true;
                strength = 9;
                method = "dual_kawase";
            };
        };
    };
}
