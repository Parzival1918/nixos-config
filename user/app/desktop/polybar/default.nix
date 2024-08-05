{config, pkgs, lib, userSettings, ...}:
let
    colors = config.lib.stylix.colors;
in
{
    services.polybar = {
        enable = true;

        # start script
        script = ''
            polybar bar1 &
        '';

        extraConfig = lib.strings.concatStrings [
            ''
            [colors]
            background = #282A2E
            background-alt = #373B41
            foreground = #C5C8C6
            primary = #${colors.base05}
            secondary = #8ABEB7
            alert = #F0C674
            disabled = #707880

            [bar/bar1]
            font-0 = "DejaVu Sans Mono:size=11;2"
            font-1 = "DejaVu Sans Mono:size=9:weight=bold;2"
            width = 100%
            height = 24pt

            ; dpi = 96

            background = ''\${colors.background}
            foreground = ''\${colors.foreground}

            line-size = 3pt

            border-size = 8pt
            border-bottom-size = 2pt
            #border-color = #00000000

            padding-left = 0
            padding-right = 0

            module-margin = 1

            #separator = /
            separator-foreground = ''\${colors.disabled}

            modules-left = xworkspaces xwindow
            modules-right = filesystem pulseaudio xkeyboard memory cpu eth date logtext

            cursor-click = pointer
            cursor-scroll = ns-resize

            enable-ipc = true

            ; tray-position = left

            ; wm-restack = generic
            ; wm-restack = bspwm
            ; wm-restack = i3

            ; override-redirect = true

            [module/tray]
            type = internal/tray

            format-margin = 8px
            tray-spacing = 8px

            [module/xworkspaces]
            type = internal/xworkspaces

            label-active = %name%
            label-active-background = ''\${colors.background-alt}
            label-active-underline= ''\${colors.primary}
            label-active-padding = 1

            label-occupied = %name%
            label-occupied-padding = 1

            label-urgent = %name%
            label-urgent-background = ''\${colors.alert}
            label-urgent-padding = 1

            label-empty = %name%
            label-empty-foreground = ''\${colors.disabled}
            label-empty-padding = 1

            [module/xwindow]
            type = internal/xwindow
            label = %{T2}%title:0:60:...%%{T-}

            [module/filesystem]
            type = internal/fs
            interval = 25

            mount-0 = /

            label-mounted = %{F#${colors.base05}}%mountpoint%%{F-} %percentage_used%%

            label-unmounted = %mountpoint% not mounted
            label-unmounted-foreground = ''\${colors.disabled}

            [module/pulseaudio]
            type = internal/pulseaudio

            format-volume-prefix = "VOL "
            format-volume-prefix-foreground = ''\${colors.primary}
            format-volume = <label-volume>

            label-volume = %percentage%%

            label-muted = muted
            label-muted-foreground = ''\${colors.disabled}

            ; Right and Middle click
            click-right = pavucontrol

            [module/xkeyboard]
            type = internal/xkeyboard
            blacklist-0 = num lock

            label-layout = %layout%
            label-layout-foreground = ''\${colors.primary}

            label-indicator-padding = 2
            label-indicator-margin = 1
            label-indicator-foreground = ''\${colors.background}
            label-indicator-background = ''\${colors.secondary}

            [module/memory]
            type = internal/memory
            interval = 2
            format-prefix = "RAM "
            format-prefix-foreground = ''\${colors.primary}
            label = %percentage_used:2%%

            [module/cpu]
            type = internal/cpu
            interval = 2
            format-prefix = "CPU "
            format-prefix-foreground = ''\${colors.primary}
            label = %percentage:2%%

            [network-base]
            type = internal/network
            interval = 5
            format-connected = <label-connected>
            format-disconnected = <label-disconnected>
            label-disconnected = %{F#F0C674}%ifname%%{F#707880} disconnected

            [module/wlan]
            inherit = network-base
            interface-type = wireless
            label-connected = %{F${colors.base05}}%ifname%%{F-} %essid% %local_ip%

            [module/eth]
            inherit = network-base
            interface-type = wired
            label-connected = %{F${colors.base05}}%ifname%%{F-} %local_ip%

            [module/date]
            type = internal/date
            interval = 1

            date = %H:%M
            date-alt = %Y-%m-%d %H:%M:%S

            label = %date%
            label-foreground = ''\${colors.primary}

            [module/logtext]
            type = custom/text

            format = <label>
            label = ${userSettings.username}

            format-padding = 1
            format-background = ''\${colors.background-alt}
            format-foreground = ''\${colors.alert}
            ;click-left = $HOME/.config/i3/exit.sh

            [settings]
            screenchange-reload = true
            pseudo-transparency = true

            ; vim:ft=dosini
            ''
        ];
    };
            
    #home.file.".config/polybar/config.ini".source = ./config.ini;
}
