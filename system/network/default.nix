{config, pkgs, systemSettings, ...}:
{
    networking = {
        #wireless.enable = true;

        networkmanager.enable = true;

        hostName = "${systemSettings.hostname}";
    };
}
