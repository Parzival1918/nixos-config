{config, pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        vim
        git
        wget

        # shells
        bash
        fish

        gnome.gnome-keyring
        pasystray
    ];

    users.defaultUserShell = pkgs.fish;
    programs.fish.enable = true;
}
