{ config, ... }:

{
	sops = {
		gnupg.home = "/home/atraphaxiae/.gnupg";
		defaultSopsFile = ../secrets.yaml;

		secrets.retroachievements_password = {};
		templates."retroarch.cfg" = {
			path = "${config.home.homeDirectory}/.config/retroarch/retroarch.cfg";
			content = ''
				${builtins.readFile ../dotfiles/retroarch/retroarch.cfg}
				cheevos_password = "${config.sops.placeholder.retroachievements_password}"
			'';
		};
	};
}
