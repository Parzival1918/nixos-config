{config, pkgs, ...}:
{
    programs.vscode = {
        enable = true;

        extensions = with pkgs.vscode-extensions; [
            rust-lang.rust-analyzer
            ms-python.python
            github.copilot
            github.copilot-chat
            mgt19937.typst-preview
            nvarner.typst-lsp
        ];
    };
}
