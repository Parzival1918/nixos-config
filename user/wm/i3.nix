{config, pkgs, userSettings, ...}:
let
    mod = "Mod4";

    config = {
        modifier = "${mod}";

        terminal = "${userSettings.terminal}";

        startup = [
            #{ command = "polybar bar1 &"; always = false; notification = false; }
            { command = "systemctl --user restart polybar"; always = true; notification = false; }
        ];

        bars = []; # remove default bars
    };
in
{
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;

        inherit config;
    };
}
