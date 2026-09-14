{ config, pkgs, ... }:

{
	programs.retroarch = {
		enable = true;
		cores = {
			ppsspp.enable = true;
			mgba.enable = true;
		};
	};
}
