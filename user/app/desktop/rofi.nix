{config, pkgs, ...}:
{
    programs.rofi = {
        enable = true;

        terminal = "${pkgs.alacritty}/bin/alacritty";

        extraConfig = {
            font = "DejaVu Sans Mono 15";
        };
    };
}
