{config, pkgs, userSettings, ...}:
let
    mod = "Mod4";

    config = {
        modifier = "${mod}";

        terminal = "${userSettings.terminal}";
        menu = "${pkgs.rofi}/bin/rofi -mode drun -show drun -show-icons";

        startup = [
            #{ command = "polybar bar1 &"; always = false; notification = false; }
            { command = "systemctl --user restart polybar"; always = true; notification = false; }
        ];

        gaps = {
            inner = 8;
            outer = 1;
        };

        window.titlebar = false;

        defaultWorkspace = "workspace number 1";

        bars = []; # remove default bars
    };
in
{
    imports = [
        ./picom.nix
    ];

    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;

        inherit config;
    };
}
