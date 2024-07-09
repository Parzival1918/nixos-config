{config, pkgs, ...}:
{
    programs.yazi = { # file manager
            enable = true;

            enableBashIntegration = true;
            enableFishIntegration = true;
        };
    };
}
