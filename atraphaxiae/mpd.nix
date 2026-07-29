{ config, ... }:

{
	services.mpd = {
		enable = true;
		musicDirectory = "${config.home.homeDirectory}/Music";
		extraConfig = ''
			replaygain "track"
			audio_output {
				type "pipewire"
				name "PipeWire Sound Server"
			}
		'';
	};
}
