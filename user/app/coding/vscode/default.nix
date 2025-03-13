{config, pkgs-unstable, lib, ...}:
let
    pkgs = pkgs-unstable;
in
{
    programs.vscode = {
        enable = true;

        package = pkgs.vscode.fhs;

        userSettings = {
            "terminal.integrated.fontFamily" = lib.mkForce "FiraMono Nerd Font";
            "terminal.integrated.fontSize" = lib.mkForce 15;
            "python.languageServer" = lib.mkForce "Pylance";
            "remote.SSH.configFile" = lib.mkForce "~/.ssh/vscode_config";
            "remote.SSH.serverInstallPath" = lib.mkForce {
                "iridis6.soton.ac.uk" = lib.mkForce "/scratch/pjr1u24/vscode-server";
            };
            "remote.SSH.useExecServer" = lib.mkForce false;
        };

        extensions = with pkgs.vscode-extensions; [
            #rust-lang.rust-analyzer
            ms-python.python
            ms-python.vscode-pylance
            #github.copilot
            #github.copilot-chat
            #mgt19937.typst-preview
            #nvarner.typst-lsp
        ];
    };
}
