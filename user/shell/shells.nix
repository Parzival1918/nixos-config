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
		EDITOR = "nvim";
	};

	programs.bash = {
		enable = true;
		enableCompletion = true;
		shellAliases = myAliases;
	};

	programs.fish = {
		enable = true;
		shellAliases = myAliases;

        functions = {
            gitignore = "curl -sL https://www.gitignore.io/api/$argv"; # gitignore creation

            fish_greeting = ''
                set_color E78F08
                fortune
            '';
        };
	};
}
