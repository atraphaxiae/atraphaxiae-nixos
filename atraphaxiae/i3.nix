{ terminal, modifier, ... }:

{
	xsession.windowManager.i3 = {
		enable = true;
		config = {
			inherit terminal;
			inherit modifier;
			fonts = {
				names = [ "Iosevka Extended" ];
				style = "Regular";
				size = 10.0;
			};
			keybindings = {
				"XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_SINK@ 5%+ --limit 1";
				"XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_SINK@ 5%- --limit 0";
				"XF86AudioMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_SINK@ toggle";
				"XF86AudioMicMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_SOURCE@ toggle";
				"XF86MonBrightnessUp" = "exec brightnessctl set 2%+";
				"XF86MonBrightnessDown" = "exec brightnessctl set 2%-";
				"Print" = "exec flameshot gui";

				"${modifier}+Return" = "exec ${terminal}";
				"${modifier}+Shift+q" = "kill";
				"${modifier}+Shift+d" = "exec rofi -show drun";
				"${modifier}+Shift+c" = "reload";
				"${modifier}+Shift+r" = "restart";
				"${modifier}+Shift+e" = "exec i3-msg exit";
				"${modifier}+p" = "exec \"gopass ls --flat | rofi -dmenu | xargs --no-run-if-empty gopass show -c\"";

				"${modifier}+j" = "focus left";
				"${modifier}+k" = "focus down";
				"${modifier}+l" = "focus up";
				"${modifier}+semicolon" = "focus right";
				"${modifier}+Shift+j" = "move left";
				"${modifier}+Shift+k" = "move down";
				"${modifier}+Shift+l" = "move up";
				"${modifier}+Shift+semicolon" = "move right";

				"${modifier}+h" = "split h";
				"${modifier}+v" = "split v";
				"${modifier}+f" = "fullscreen toggle";
				"${modifier}+w" = "layout tabbed";
				"${modifier}+Shift+space" = "floating toggle";
				"${modifier}+a" = "focus parent";
				"${modifier}+d" = "focus child";
				"${modifier}+space" = "focus mode_toggle";

				"${modifier}+1" = "workspace number 1";
				"${modifier}+2" = "workspace number 2";
				"${modifier}+3" = "workspace number 3";
				"${modifier}+4" = "workspace number 4";
				"${modifier}+5" = "workspace number 5";
				"${modifier}+6" = "workspace number 6";
				"${modifier}+7" = "workspace number 7";
				"${modifier}+8" = "workspace number 8";
				"${modifier}+9" = "workspace number 9";
				"${modifier}+0" = "workspace number 10";
				"${modifier}+Shift+1" = "move container to workspace number 1";
				"${modifier}+Shift+2" = "move container to workspace number 2";
				"${modifier}+Shift+3" = "move container to workspace number 3";
				"${modifier}+Shift+4" = "move container to workspace number 4";
				"${modifier}+Shift+5" = "move container to workspace number 5";
				"${modifier}+Shift+6" = "move container to workspace number 6";
				"${modifier}+Shift+7" = "move container to workspace number 7";
				"${modifier}+Shift+8" = "move container to workspace number 8";
				"${modifier}+Shift+9" = "move container to workspace number 9";
				"${modifier}+Shift+0" = "move container to workspace number 10";
			};
		};
	};
}
