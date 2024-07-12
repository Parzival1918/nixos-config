{config, pkgs, systemSettings, ...}:
{
    environment.systemPackages = with pkgs; [
        networkmanagerapplet
    ];

    networking = {
        #wireless.enable = true;

        networkmanager.enable = true;

        hostName = "${systemSettings.hostname}";
    };
}
