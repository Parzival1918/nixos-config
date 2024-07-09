{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		
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

	outputs = {self, nixpkgs, home-manager, ... }@inputs:
	let
		systemSettings = {
			system = "x86_64-linux"; # system architecture
			hostname = "nixos"; #${userSettings.username} + "-linux"; # hostname
			profile = "personal"; # system profile
			timezone = "Europe/London"; # select timezone
            style = "gruvbox-dark-soft"; # select style from styles/ dir
            wallpaper = "https://images.hdqwalls.com/download/kokushibo-demon-slayer-wv-1920x1080.jpg";
            wallpaperSHA256 = "88c3977f46e2175472e4cbc354e4dc1e2ae89fb89e6516bdd073781e2cecf615";
		};

		userSettings = {
			username = "unstraycato"; # username
			name = "Pedro Juan Royo"; # full name
            email = "pedro.juan.royo@gmail.com"; # email
			dotfilesPath = "~/dotfiles"; # absolute path of dotfiles
		};	

		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${systemSettings.system};
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				system = systemSettings.system; # System architecture
				modules = [
					(./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")	
                    inputs.stylix.nixosModules.stylix

					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.backupFileExtension = "backup";
						
						home-manager.users.${userSettings.username} = import (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix");
						
						home-manager.extraSpecialArgs = {
							inherit inputs;
							inherit systemSettings;
							inherit userSettings;
						};
					}
				];
				
				specialArgs = {
					inherit systemSettings;
					inherit userSettings;
				};
			};	
		};
	};
}
