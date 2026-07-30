{ inputs, pkgs, ... }:

{
	programs.spicetify = {
		enable = true;
		enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}.extensions; [
			adblock
			aiBandBlocker
			autoSkipVideo
			fullAppDisplay
			hidePodcasts
			playNext
			queueTime
			shuffle
			volumePercentage
		];
	};
}
