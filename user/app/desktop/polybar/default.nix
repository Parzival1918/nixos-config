{config, pkgs, ...}:
{
    services.polybar = {
        enable = true;

        # start script
        script = ''
            echo "---" | tee -a /tmp/polybar1.log
            polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
            echo "Bars launched..."
        '';
    };

    home.file.".config/polybar/config.ini".source = ./config.ini;
}
