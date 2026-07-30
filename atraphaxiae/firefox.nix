{ pkgs, ... }:

{
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
			extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
				ublock-origin
				return-youtube-dislikes
			];
		};
		policies = {
			ExtensionSettings = {
				"uBlock0@raymondhill.net" = {
					default_area = "navbar";
					installation_mode = "force_installed";
					private_browsing = true;
				};
				"{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
					default_area = "navbar";
					installation_mode = "force_installed";
				};
			};
		};
	};
}
