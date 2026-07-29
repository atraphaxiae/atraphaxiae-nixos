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

	xsession.windowManager.i3 = {
		enable = true;
		config = {
			inherit terminal;
			inherit modifier;
			fonts = {
				names = [ "Iosevka Extended" ];
				style = "Regular";
				size = 10.0;
			};
			keybindings = {
				"${modifier}+Return" = "exec ${terminal}";
				"${modifier}+Shift+q" = "kill";
				"${modifier}+Shift+d" = "exec rofi -show drun";
				"${modifier}+Shift+c" = "reload";
				"${modifier}+Shift+r" = "restart";
				"${modifier}+Shift+e" = "exec i3-msg exit";

				"${modifier}+j" = "focus left";
				"${modifier}+k" = "focus down";
				"${modifier}+l" = "focus up";
				"${modifier}+semicolon" = "focus right";
				"${modifier}+Shift+j" = "move left";
				"${modifier}+Shift+k" = "move down";
				"${modifier}+Shift+l" = "move up";
				"${modifier}+Shift+semicolon" = "move right";

				"${modifier}+h" = "split h";
				"${modifier}+v" = "split v";
				"${modifier}+f" = "fullscreen toggle";
				"${modifier}+Shift+space" = "floating toggle";

				"${modifier}+1" = "workspace number 1";
				"${modifier}+2" = "workspace number 2";
				"${modifier}+3" = "workspace number 3";
				"${modifier}+4" = "workspace number 4";
				"${modifier}+5" = "workspace number 5";
				"${modifier}+6" = "workspace number 6";
				"${modifier}+7" = "workspace number 7";
				"${modifier}+8" = "workspace number 8";
				"${modifier}+9" = "workspace number 9";
				"${modifier}+0" = "workspace number 10";
				"${modifier}+Shift+1" = "move container to workspace number 1";
				"${modifier}+Shift+2" = "move container to workspace number 2";
				"${modifier}+Shift+3" = "move container to workspace number 3";
				"${modifier}+Shift+4" = "move container to workspace number 4";
				"${modifier}+Shift+5" = "move container to workspace number 5";
				"${modifier}+Shift+6" = "move container to workspace number 6";
				"${modifier}+Shift+7" = "move container to workspace number 7";
				"${modifier}+Shift+8" = "move container to workspace number 8";
				"${modifier}+Shift+9" = "move container to workspace number 9";
				"${modifier}+Shift+0" = "move container to workspace number 10";
			};
		};
	};

	programs.firefox = {
		enable = true;
		profiles.atraphaxiae = {
			isDefault = true;
			settings = {
				"browser.shell.checkDefaultBrowser" = false;
				"signon.rememberSignons" = false;
				"extensions.InstallTrigger.enabled" = false;
				"extensions.autoDisableScopes" = 0;
			};
		};
	};

	programs.git = {
		enable = true;
		signing = {
			key = "07CE2301AB14BC88";
			signByDefault = true;
		};
		settings = {
			user.name = "Nile Jocson";
			user.email = "atraphaxiae@gmail.com";
			init.defaultBranch = "main";
		};
	};

	programs.vscode = {
		enable = true;
		mutableExtensionsDir = false;
		profiles.default = {
			extensions = with pkgs.vscode-extensions; [
				johnpapa.winteriscoming
				eamodio.gitlens
				ms-vscode.cpptools
				llvm-vs-code-extensions.vscode-clangd
				ms-vscode.cmake-tools
				twxs.cmake
				myriad-dreamin.tinymist
				rust-lang.rust-analyzer
				tamasfe.even-better-toml
				jnoortheen.nix-ide
			];
			userSettings = {
				"chat.disableAIFeatures" = true;
				"editor.fontLigatures" = true;
				"editor.fontFamily" = "Iosevka Extended";
				"editor.inlayHints.enabled" = "offUnlessPressed";
				"editor.insertSpaces" = false;
				"editor.renderWhitespace" = "all";
				"editor.rulers" = [ 100 ];
				"workbench.colorTheme" = "Winter is Coming (Dark Blue)";
				"workbench.tree.indent" = 20;
				"files.insertFinalNewline" = true;
				"files.trimFinalNewlines" = true;
				"files.trimTrailingWhitespace" = true;
				"C_Cpp.intelliSenseEngine" = "disabled";

				"[typst]"."editor.tabSize" = 4;
				"[nix]" = {
					"editor.tabSize" = 4;
					"editor.insertSpaces" = false;
				};
			};
		};
	};

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
}
