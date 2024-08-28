{config, pkgs, lib, ...}:
{
    programs.vscode = {
        enable = true;

        package = pkgs.vscode.fhs;

        userSettings = {
            "terminal.integrated.fontFamily" = lib.mkForce "FiraMono Nerd Font";
            "terminal.integrated.fontSize" = lib.mkForce 15;
        };

        extensions = with pkgs.vscode-extensions; [
            rust-lang.rust-analyzer
            ms-python.python
            ms-python.vscode-pylance
            github.copilot
            github.copilot-chat
            mgt19937.typst-preview
            nvarner.typst-lsp
        ];
    };
}
