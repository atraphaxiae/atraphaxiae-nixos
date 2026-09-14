{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
		nur = {
			url = "github:nix-community/NUR";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix = {
			url = "github:Mic92/sops-nix";
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
		nix-flatpak,
		nur,
		sops-nix,
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
							nix-flatpak.homeManagerModules.nix-flatpak
							sops-nix.homeManagerModules.sops
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
