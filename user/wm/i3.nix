{config, pkgs, ...}:
let
    mod = "Mod4";

    config = {
        modifier = "${mod}";
    };
in
{
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;

        inherit config;
    };
}
