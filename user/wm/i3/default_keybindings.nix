{config, pkgs, lib, userSettings, ...}:
let
    mod = "Mod4";
    menu = "${pkgs.rofi}/bin/rofi -mode drun -show drun -show-icons";
    terminal = "${pkgs.${userSettings.terminal}}/bin/${userSettings.terminal}";
in
{
    xsession.windowManager.i3 = {
        config.keybindings = {
            "${mod}+Return" = "exec ${terminal}";
            "${mod}+q" = "kill";
            "${mod}+d" = "exec ${menu}";
            "${mod}+Shift+e" = "exec ${pkgs.fish}/bin/fish ${./scripts/exit.fish}";

            "${mod}+Left" = "focus left";
            "${mod}+Down" = "focus down";
            "${mod}+Up" = "focus up";
            "${mod}+Right" = "focus right";

            "${mod}+Shift+Left" = "move left";
            "${mod}+Shift+Down" = "move down";
            "${mod}+Shift+Up" = "move up";
            "${mod}+Shift+Right" = "move right";

            "${mod}+h" = "split h";
            "${mod}+v" = "split v";
            "${mod}+f" = "fullscreen toggle";

            "${mod}+s" = "layout stacking";
            "${mod}+w" = "layout tabbed";
            "${mod}+e" = "layout toggle split";

            "${mod}+Shift+space" = "floating toggle";
            "${mod}+space" = "focus mode_toggle";

            "${mod}+a" = "focus parent";

            "${mod}+Shift+minus" = "move scratchpad";
            "${mod}+minus" = "scratchpad show";

            "${mod}+1" = "workspace number 1";
            "${mod}+2" = "workspace number 2";
            "${mod}+3" = "workspace number 3";
            "${mod}+4" = "workspace number 4";
            "${mod}+5" = "workspace number 5";
            "${mod}+6" = "workspace number 6";
            "${mod}+7" = "workspace number 7";
            "${mod}+8" = "workspace number 8";
            "${mod}+9" = "workspace number 9";
            "${mod}+0" = "workspace number 10";

            "${mod}+Shift+1" =
                "move container to workspace number 1";
            "${mod}+Shift+2" =
                "move container to workspace number 2";
            "${mod}+Shift+3" =
                "move container to workspace number 3";
            "${mod}+Shift+4" =
                "move container to workspace number 4";
            "${mod}+Shift+5" =
                "move container to workspace number 5";
            "${mod}+Shift+6" =
                "move container to workspace number 6";
            "${mod}+Shift+7" =
                "move container to workspace number 7";
            "${mod}+Shift+8" =
                "move container to workspace number 8";
            "${mod}+Shift+9" =
                "move container to workspace number 9";
            "${mod}+Shift+0" =
                "move container to workspace number 10";

            "${mod}+Shift+c" = "reload";
            "${mod}+Shift+r" = "restart";
            #"${mod}+Shift+e" =
            #    "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

            "${mod}+r" = "mode resize";
        };
    };
}
