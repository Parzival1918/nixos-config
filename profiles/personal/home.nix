{ config, pkgs, userSettings, inputs, ... }:
{
	imports = [
		../../user/shell/shells.nix	
		../../user/app/terminal/terminal.nix
		../../user/lang/lang.nix
		../../user/app/coding
        ../../user/cli-tui/default.nix
        ../../user/app/browser/firefox.nix
        ../../user/app/entertainment
        ../../user/app/desktop
        ../../user/documents
        ../../user/wm/i3
	];

	home.username = userSettings.username;
	home.homeDirectory = "/home/" + userSettings.username;

	programs.home-manager.enable = true;
	home.stateVersion = "24.05";

	home.packages = with pkgs; [
		fortune
		lolcat
        nerdfonts
	];

    fonts.fontconfig.enable = true;

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
