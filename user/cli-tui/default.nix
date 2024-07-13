{config, pkgs, ...}:
{
    imports = [
        ./git.nix
        ./gh.nix
        ./yazi.nix
    ];

    home.packages = with pkgs; [
        hyperfine # benchmarking tool
        lolcat
        fortune

        jq # dependency of license fish plugin
    ];

    programs = {
        ripgrep.enable = true; # grep but better

        bat.enable = true; # cat with wings

        gitui.enable = true; # TUI for git

        yazi = { # file manager
            enable = true;

            enableBashIntegration = true;
            enableFishIntegration = true;
        };

        #nix-index = { # to fix sqlite error thingy that fish had
                      # taken from https://discourse.nixos.org/t/command-not-found-unable-to-open-database/3807/8
            #enable = true;

            #enableBashIntegration = true;
            #enableFishIntegration = true;
        #};
    };
}
