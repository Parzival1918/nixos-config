{config, pkgs, lib, userSettings, ...}:
{
    services.polybar = {
        enable = true;

        # start script
        script = ''
            polybar bar1 &
        '';

        extraConfig = lib.strings.concatStrings [
            (builtins.readFile ./config.ini)

            ''

            [module/logtext]
            type = custom/text

            format = <label>
            label = ${userSettings.username}

            format-padding = 1
            format-background = ''\${colors.background-alt}
            format-foreground = ''\${colors.alert}
            ''
        ];
    };
            
    #home.file.".config/polybar/config.ini".source = ./config.ini;
}
