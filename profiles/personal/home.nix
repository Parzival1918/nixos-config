{ config, pkgs, userSettings, ... }:
{
	home.username = userSettings.username;
	home.homeDirectory = "/home/" + userSettings.username;

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		fortune
		lolcat
	];

	programs.bash = {
		enable = true;
		enableCompletion = true;
		shellAliases = {
			ll = "ls -l";
			la = "ls -a";	
			".." = "cd ..";
		};
	};

	home.stateVersion = "24.05";
}
