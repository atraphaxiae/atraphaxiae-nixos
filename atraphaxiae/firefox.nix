{ pkgs, ... }:

{
	programs.firefox = {
		enable = true;
		profiles.atraphaxiae = {
			isDefault = true;
			settings = {
				"browser.shell.checkDefaultBrowser" = false;
				"extensions.autoDisableScopes" = 0;
				"extensions.InstallTrigger.enabled" = false;
				"extensions.unifiedExtensions.button.always_visible" = false;
				"signon.rememberSignons" = false;
			};
			extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
				return-youtube-dislikes
				ublock-origin
			];
		};
		policies = {
			ExtensionSettings = {
				"{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
					default_area = "navbar";
					installation_mode = "force_installed";
				};
				"uBlock0@raymondhill.net" = {
					default_area = "navbar";
					installation_mode = "force_installed";
					private_browsing = true;
				};
			};
		};
	};
}
