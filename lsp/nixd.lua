return {
	cmd = { "nixd", "--semantic-tokens=true" },
	filetypes = { "nix" },
	root_markers = { "flake.nix" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/pablo/nixos").inputs.nixpkgs { }   ',
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					expr = "(builtins.getFlake (builtins.toString /home/pablo/nixos)).nixosConfigurations.main.options",
				},
				home_manager = {
					expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.main.options.home-manager.users.type.getSubOptions []",
				},
			},
		},
	},
}
