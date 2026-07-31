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
		aagl = {
			url = "github:ezKEa/aagl-gtk-on-nix/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{
		nixpkgs,
		home-manager,
		nur,
		spicetify-nix,
		aagl,
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
				{
					imports = [ aagl.nixosModules.default ];
					nix.settings = aagl.nixConfig;
					programs.anime-game-launcher.enable = true;
				}
			];
		};
	};
}
