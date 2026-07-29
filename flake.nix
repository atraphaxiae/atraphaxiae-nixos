{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{
		self,
		nixpkgs,
		home-manager,
		...
	}: {
		nixosConfigurations.atraphaxiae-nixos = nixpkgs.lib.nixosSystem {
			modules = [
				./configuration.nix

				home-manager.nixosModules.home-manager {
					home-manager = {
						backupFileExtension = "backup";
						useGlobalPkgs = true;
						useUserPackages = true;
						users.atraphaxiae.imports = [ ./atraphaxiae.nix ];
						extraSpecialArgs = {
							terminal = "kitty";
							modifier = "Mod4";
						};
					};
				}
			];
		};
	};
}
