{ pkgs, ... }:

{
	programs.retroarch = {
		enable = true;
		package = pkgs.retroarch-full;
		cores = {
			ppsspp.enable = true;
			mgba.enable = true;
		};
	};
}
