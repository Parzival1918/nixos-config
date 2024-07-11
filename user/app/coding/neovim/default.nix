{config, pkgs, inputs, ...}:
{
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./options.nix
		./keymappings.nix
		#./plugins
	];

	programs.nixvim = {
		enable = true;
	};
}