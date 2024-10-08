{pkgs, systemSettings, ...}:
{
    stylix = {
        enable = true;
        polarity = "dark";

        base16Scheme = ./styles/${systemSettings.style}.yaml;

        image = pkgs.fetchurl {
            url = "${systemSettings.wallpaper}";
            sha256 = "${systemSettings.wallpaperSHA256}";
        };
    };
}
