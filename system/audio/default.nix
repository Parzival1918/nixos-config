{config, pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        pulseaudioFull
    ];

    services.pipewire = {
        enable = true;

        pulse.enable = true;

        alsa = {
            enable = true;
            support32Bit = true;
        };
    };

    nixpkgs.config.pulseaudio = true;
}
