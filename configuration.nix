{ config, lib, pkgs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
		];

	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	networking = {
		hostName = "atraphaxiae-nixos";
		networkmanager.enable = true;
	};

	time.timeZone = "Asia/Manila";

	i18n.defaultLocale = "en_US.UTF-8";

	users.users.atraphaxiae = {
		isNormalUser = true;
		extraGroups = [ "networkmanager" "wheel" ];
	};

	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		gcc
		clang
		clang-tools
		cmake
		brightnessctl
		tree
	];

	services = {
		displayManager.ly.enable = true;

		openssh.enable = true;

		pipewire = {
			enable = true;
			pulse.enable = true;
		};

		xserver = {
			enable = true;
			displayManager.startx.enable = true;
			xkb.layout = "us";
		};
	};

	programs = {
		gnupg.agent = {
			enable = true;
		};
		tmux.enable = true;
		vim.enable = true;
	};

	system.stateVersion = "26.05";
}
