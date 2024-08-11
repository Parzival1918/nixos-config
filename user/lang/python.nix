{config, pkgs, ...}:
{
	home.packages = with pkgs; [
		rye
		ruff
	];

	programs.bash.bashrcExtra = ''
		echo 'source "$HOME/.rye/env"' >> ~/.bashrc
	'';

	programs.fish.shellInit = ''
		set -Ua fish_user_paths "$HOME/.rye/shims"
	'';
}
