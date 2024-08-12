{config, pkgs, pkgs-unstable, ...}:
{
    environment.systemPackages = 
    (with pkgs; [
        pulseaudioFull
    ])
    ++
    (with pkgs-unstable; [
        pavucontrol
    ]);

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
