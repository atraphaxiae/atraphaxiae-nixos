{ config, pkgs, terminal, modifier, ... }:

{
	home = {
		stateVersion = "26.05";
		username = "atraphaxiae";
		homeDirectory = "/home/atraphaxiae";

		packages = with pkgs; [
			# fonts
			iosevka
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-color-emoji

			# downloads
			qbittorrent
			nicotine-plus

			# audio
			ffmpeg_7-full
			flacon
			sacd
			kid3-qt
			rsgain
			ardour
			lsp-plugins
			qpwgraph
			musescore
			dr14_tmeter

			# coding
			gdb
			lldb
			typst
			tinymist
			rustup
			zola

			# media
			krita
			inkscape
			vlc

			# passwords
			gopass
			gopass-hibp

			# other
			rsync
			xev
			btop
			smartmontools
			flameshot
			peazip
			proton-vpn
			proton-authenticator
			ungoogled-chromium
		];

		file = {
			".bashrc".source = ./dotfiles/.bashrc;
			".xinitrc".source = ./dotfiles/.xinitrc;
		};
	};

	fonts.fontconfig.enable = true;

	programs.rofi = {
		inherit terminal;
		enable = true;
	};

	programs.kitty = {
		enable = true;
		font = {
			name = "Iosevka Extended";
			size = 10;
		};
	};

	imports = [
		./atraphaxiae/easyeffects.nix
		./atraphaxiae/firefox.nix
		./atraphaxiae/git.nix
		./atraphaxiae/i3.nix
		./atraphaxiae/vscode.nix
	];
}
