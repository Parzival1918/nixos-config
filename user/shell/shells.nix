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

        plugins = [
            {
                name = "license";
                src = pkgs.fetchFromGitHub {
                    owner = "oh-my-fish";
                    repo = "plugin-license";
                    rev = "0155b16f102957ec0c734a90979245dc1073f979";
                    sha256 = "Bi9Q5rekZoyXYbRV+U4SmwCdqCl0pFupzm5si7SxFns=";
                };
            }
        ];
	};
}
