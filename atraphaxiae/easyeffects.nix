{ ... }:

{
	services.easyeffects = {
		enable = true;
		extraPresets = {
			default = {
				output = {
					blocklist = [];
					"plugins_order" = [ "equalizer#0" ];
					"equalizer#0" = {
						"balance" = 35;
						"output-gain" = -5.0;
					};
				};
			};
		};
	};
}
