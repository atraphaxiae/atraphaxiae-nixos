{ pkgs, ... }:

{
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
}
