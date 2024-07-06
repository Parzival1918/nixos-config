{config, pkgs, ...}:
let
	myAliases = {
		ll = "ls -l";
		la = "ls -a";
		".." = "cd ..";
	};
in
{
	home.sessionVariables = {
		EDITOR = "vim";
	};

	programs.bash = {
		enable = true;
		enableCompletion = true;
		shellAliases = myAliases;
	};

	programs.fish = {
		enable = true;
		shellAliases = myAliases;
	};
}
