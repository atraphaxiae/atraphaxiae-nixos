{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nur = {
			url = "github:nix-community/NUR";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		spicetify-nix.url = "github:Gerg-L/spicetify-nix";
	};

	outputs = inputs@{
		nixpkgs,
		home-manager,
		spicetify-nix,
		nur,
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
						users.atraphaxiae.imports = [
							spicetify-nix.homeManagerModules.spicetify
							./atraphaxiae.nix
						];
						extraSpecialArgs = {
							inherit inputs;
							terminal = "kitty";
							modifier = "Mod4";
						};
					};
				}
				nur.modules.nixos.default
			];
		};
	};
}
