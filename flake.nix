{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
		    url = "github:nix-community/nixvim/nixos-24.05";
            inputs.nixpkgs.follows = "nixpkgs";
		};

        firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix.url = "github:danth/stylix";
	};

	outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
	let
		systemSettings = {
			system = "x86_64-linux"; # system architecture
			hostname = "nixos"; #${userSettings.username} + "-linux"; # hostname
			profile = "personal"; # system profile
			timezone = "Europe/London"; # select timezone
            keyboardLayout = "es"; # keyboard layout
            keyboardVariant = "cat"; # set keyboard variant if there is one, else set to null
            style = "gruvbox-dark-soft"; # select style from styles/ dir
            wallpaper = "https://images.hdqwalls.com/wallpapers/anime-girl-meteor-streak-10k-0t.jpg";
            wallpaperSHA256 = "sha256-rB/HCdk4Zs/+MsZsC9noby4qEnbl4QT+XFy2mx5Uecg=";
		};

		userSettings = {
			username = "unstraycato"; # username
			name = "Pedro Juan Royo"; # full name
            email = "pedro.juan.royo@gmail.com"; # email
			dotfilesPath = "~/.dotfiles"; # absolute path of dotfiles
            terminal = "alacritty"; # default terminal
		};	

		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${systemSettings.system};
		pkgs-unstable = nixpkgs-unstable.legacyPackages.${systemSettings.system};
	in {
		nixosConfigurations = {
			system = lib.nixosSystem {
				system = systemSettings.system; # System architecture
				modules = [
					(./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")	
                    inputs.stylix.nixosModules.stylix

					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.backupFileExtension = "backup-" + pkgs.lib.readFile "${pkgs.runCommand "timestamp" {} "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";
						
						home-manager.users.${userSettings.username} = import (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix");
						
						home-manager.extraSpecialArgs = {
							inherit inputs;
                            inherit pkgs-unstable;
							inherit systemSettings;
							inherit userSettings;
						};
					}
				];
				
				specialArgs = {
                    inherit inputs;
                    inherit pkgs-unstable;
					inherit systemSettings;
					inherit userSettings;
				};
			};	
		};
	};
}
