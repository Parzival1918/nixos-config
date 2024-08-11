{config, pkgs, inputs, ...}:
{
    # I used most of the code in https://github.com/JMartJonesy/kickstart.nixvim
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./options.nix
		./keymappings.nix
		./plugins
	];

	programs.nixvim = {
		enable = true;

        viAlias = true;
        vimAlias = true;
	};
}
