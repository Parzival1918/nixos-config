{config, pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        vim
        git
        wget

        # shells
        bash
        fish
    ];

    users.defaultUserShell = pkgs.fish;
    programs.fish.enable = true;
}
