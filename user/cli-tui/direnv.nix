{ ... }:
{
    programs.direnv = {
        enable = true;

        #enableBashIntegration = true;
        #enableFishIntegration = true;

        stdlib = ''
            layout_rye() {
                PYPROJECT_TOML="''${PYPROJECT_TOML:-pyproject.toml}"
                if [[ ! -f "$PYPROJECT_TOML" ]]; then
                    log_status "No pyproject.toml found. Executing \`rye init\` to create a \`$PYPROJECT_TOML\` first."
                    rye init
                fi

                if [[ -d ".venv" ]]; then
                    VIRTUAL_ENV="$(pwd)/.venv"
                fi

                if [[ -z $VIRTUAL_ENV || ! -d $VIRTUAL_ENV ]]; then
                    log_status "No virtual environment exists. Executing \`rye sync\` to create one."
                    rye sync
                    VIRTUAL_ENV="$(pwd)/.venv"
                fi

                PATH_add "$VIRTUAL_ENV/bin"
                export RYE_ACTIVE=1  # or VENV_ACTIVE=1
                export VIRTUAL_ENV
            }
        '';
    };
}
