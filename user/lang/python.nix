{config, pkgs, ...}:
{
	home.packages = with pkgs; [
		rye
		ruff
	];
}
