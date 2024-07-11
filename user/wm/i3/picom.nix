{config, pkgs, ...}:
{
    services.picom = {
        enable = true;

        settings = {
            blur = {
                background = true;
                strength = 9;
                method = "dual_kawase";
            };

            corner-radius = 10;
        };
    };
}
