{config, pkgs, ...}:
{
    services.polybar = {
        enable = true;

        # start script
        script = ''
            polybar bar1 &
        '';
    };

    home.file.".config/polybar/config.ini".source = ./config.ini;
}
