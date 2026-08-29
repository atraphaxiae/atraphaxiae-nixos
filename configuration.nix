{ pkgs, ... }:

{
	system.stateVersion = "26.05";

	imports = [ ./hardware-configuration.nix ];

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

	users = {
		mutableUsers = false;

		users.atraphaxiae = {
			isNormalUser = true;
			description = "Nile Jocson";
			extraGroups = [ "networkmanager" "wheel" ];
			hashedPassword = "$y$j9T$ofWpoudVA47LLAOa9BNNT.$BUljqw.db6ubQq79Weym9vyH/kDC6sPMq3OYAxs7EY5";
		};
	};

	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		brightnessctl
		clang
		clang-tools
		cmake
		gcc
		lxsession
		tree
	];

	security.polkit.enable = true;

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
		config.common.default = "gtk";
	};

	services = {
		logind.settings.Login = {
			HandleLidSwitch = "ignore";
		};
		libinput.touchpad = {
			tapping = false;
			disableWhileTyping = true;
		};
		displayManager.ly.enable = true;
		gvfs.enable = true;
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
		nm-applet.enable = true;
		dconf.enable = true;
		gnupg.agent.enable = true;
		steam = {
			enable = true;
			extraCompatPackages = [ pkgs.proton-ge-bin ];
		};
		thunar.enable = true;
		tmux.enable = true;
		vim.enable = true;
	};
}
