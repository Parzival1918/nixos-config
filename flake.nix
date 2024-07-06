{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {self, nixpkgs, home-manager, ... }@inputs:
	let
		systemSettings = {
			system = "x86_64-linux"; # system architecture
			hostname = "nixos"; #${userSettings.username} + "-linux"; # hostname
			profile = "personal"; # system profile
			timezone = "Europe/London"; # select timezone
		};

		userSettings = {
			username = "unstraycato"; # username
			name = "Pedro Juan Royo"; # full name
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

					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						
						home-manager.users.${userSettings.username} = import (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix");
						
						home-manager.extraSpecialArgs = {
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
