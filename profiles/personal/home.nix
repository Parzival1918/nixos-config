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
	
	imports = [
		../../user/shell/shells.nix	
	];

	xdg.enable = true;
	xdg.userDirs = {
		enable = true;
		createDirectories = true;
		music = "${config.home.homeDirectory}/media/music";
    		videos = "${config.home.homeDirectory}/media/videos";
    		pictures = "${config.home.homeDirectory}/media/pictures";
    		templates = "${config.home.homeDirectory}/templates";
    		download = "${config.home.homeDirectory}/downloads";
    		documents = "${config.home.homeDirectory}/documents";
    		desktop = null;
    		publicShare = null;
	};
	xdg.mime.enable = true;
}
