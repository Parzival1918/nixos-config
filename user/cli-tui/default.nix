{config, pkgs, ...}:
{
    imports = [
        ./git.nix
        ./gh.nix
        ./yazi.nix
    ];

    home.packages = with pkgs; [
        hyperfine # benchmarking tool
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
    };
}
