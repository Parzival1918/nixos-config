{config, pkgs, pkgs-unstable, userSettings, ...}:
let
    binName = "helper";
    writeBashBin = pkgs.writers.writeBashBin;
in
{
    environment.systemPackages = [
        (
            writeBashBin binName ''
                ${pkgs-unstable.just}/bin/just -f ${userSettings.dotfilesPath}/.justfile "$@"
            ''
        )
    ];
}
