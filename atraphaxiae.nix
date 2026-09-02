{ config, osConfig, pkgs, terminal, ... }:

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
			shotcut
			vlc

			# passwords
			gopass
			gopass-hibp

			# wine
			wineWow64Packages.staging
			winetricks

			# other
			btop
			flameshot
			ltspice
			peazip
			pince
			proton-vpn
			proton-authenticator
			rsync
			smartmontools
			ungoogled-chromium
			xev
			qdirstat
			zoom-us
		];
		file = {
			".bashrc".source = ./dotfiles/.bashrc;
			".fehbg".source = ./dotfiles/.fehbg;
			".xinitrc".source = ./dotfiles/.xinitrc;
			"bg.png".source = ./dotfiles/bg.png;
			"Music".source = config.lib.file.mkOutOfStoreSymlink "/archive/Music";
		};
	};

	fonts.fontconfig.enable = true;

	xdg = {
		mime.enable = true;
		mimeApps = {
			enable = true;
			defaultApplications = {
				"text/html" = "firefox.desktop";
				"x-scheme-handler/about" = "firefox.desktop";
				"x-scheme-handler/chrome" = "firefox.desktop";
				"x-scheme-handler/http" = "firefox.desktop";
				"x-scheme-handler/https" = "firefox.desktop";
				"x-scheme-handler/unknown" = "firefox.desktop";
				"application/x-extension-htm" = "firefox.desktop";
				"application/x-extension-html" = "firefox.desktop";
				"application/x-extension-shtml" = "firefox.desktop";
				"application/x-extension-xhtml" = "firefox.desktop";
				"application/x-extension-xht" = "firefox.desktop";
				"application/xhtml+xml" = "firefox.desktop";
			};
		};
		userDirs = {
			enable = true;
			createDirectories = true;
		};
	};

	programs = {
		fastfetch.enable = true;
		feh.enable = true;
		gh.enable = true;
		kitty = {
			enable = true;
			font.name = "Iosevka Extended";
			font.size = 10;
		};
		lutris = {
			enable = true;
			steamPackage = osConfig.programs.steam.package;
		};
		rmpc.enable = true;
		rofi = {
			enable = true;
			inherit terminal;
		};
		vesktop = {
			enable = true;
			settings = {
				arRPC = true;
				minimizeToTray = true;
				discordBranch = "stable";
			};
		};
	};

	imports = [
		./atraphaxiae/easyeffects.nix
		./atraphaxiae/firefox.nix
		./atraphaxiae/git.nix
		./atraphaxiae/i3.nix
		./atraphaxiae/mpd.nix
		./atraphaxiae/spicetify.nix
		./atraphaxiae/vscode.nix
	];
}
