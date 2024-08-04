{config, pkgs, ...}:
{
    imports = [
        ./git.nix
        ./gh.nix
        ./yazi.nix
        ./fzf.nix
    ];

    home.packages = with pkgs; [
        hyperfine # benchmarking tool
        lolcat
        fortune

        jq # dependency of license fish plugin

        fd # find
    ];

    programs = {
        ripgrep.enable = true; # grep but better

        bat.enable = true; # cat with wings

        gitui.enable = true; # TUI for git

        #nix-index = { # to fix sqlite error thingy that fish had
                      # taken from https://discourse.nixos.org/t/command-not-found-unable-to-open-database/3807/8
            #enable = true;

            #enableBashIntegration = true;
            #enableFishIntegration = true;
        #};
    };
}
