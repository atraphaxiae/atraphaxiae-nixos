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
		};
	};
}
