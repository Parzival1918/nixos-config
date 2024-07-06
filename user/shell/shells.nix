{config, pkgs, ...}:
let
	myAliases = {
		ll = "ls -l";
		la = "ls -a";
		".." = "cd ..";
	};
in
{
	programs.bash = {
		enable = true;
		shellAliases = myAliases;
	};

	programs.fish = {
		enable = true;
		shellAliases = myAliases;
	};
}
