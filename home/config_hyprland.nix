{ config, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;

		settings = {
			"$terminal" = "kitty";
			"$mod" = "SUPER";
			"$menu" = "hyprlauncher";

			exec-once = [
				"hyprpaper"
				"hyprlauncher -d"
				"hypridle"
				"ashell"
			];

			env = [
				"XDG_SESSION_TYPE,wayland"
				"XDG_CURRENT_DESKTOP,Hyprland"
				"XDG_SESSION_DESKTOP,Hyprland"
			];

			general = {
				border_size = 2;
				gaps_in = 3;
				gaps_out = 10;
			};

			decoration = {
				rounding = 5;
			};

			bind = [
				"$mod, q, exec, $terminal"
				"$mod, r, exec, $menu"
				"$mod, f, fullscreen,"
				"$mod, c, killactive,"
				"$mod, m, exit,"

				"$mod, h, movefocus, l"
				"$mod, l, movefocus, r"
				"$mod, k, movefocus, u"
				"$mod, j, movefocus, d"

				"$mod, left,  moveWindow, l"
				"$mod, right, moveWindow, r"
				"$mod, up,    moveWindow, u"
				"$mod, down,  moveWindow, d"

				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"

				"$mod SHIFT, 1, movetoworkspace, 1"
				"$mod SHIFT, 2, movetoworkspace, 2"
				"$mod SHIFT, 3, movetoworkspace, 3"
				"$mod SHIFT, 4, movetoworkspace, 4"
				"$mod SHIFT, 5, movetoworkspace, 5"
				"$mod SHIFT, 6, movetoworkspace, 6"
				"$mod SHIFT, 7, movetoworkspace, 7"
				"$mod SHIFT, 8, movetoworkspace, 8"
				"$mod SHIFT, 9, movetoworkspace, 9"
			];

			ecosystem = {
				no_update_news  = true;
				no_donation_nag = true;
			};
		};
	};

	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [ "~/nixos-config/home/wallpaper.jpg" ];
			wallpaper = [ ",~/nixos-config/home/wallpaper.jpg" ];
			ipc = false;
		};
	};

	# Home Manager does not yet support hyprlauncher.
	xdg.configFile."hypr/hyprlauncher.conf".text = ''
		cache { enabled = false }
	'';

	programs.hyprlock = {
		enable = true;
		settings = {
			"$font" = "Monospace";

			general = {
				hide_cursor = true;
				ignore_empty_input = true;
			};

			animations = {
				enabled = true;
				bezier = "linear, 1, 1, 0, 0";
				animation = [
					"fadeIn, 1, 5, linear"
					"fadeOut, 1, 5, linear"
					"inputFieldDots, 1, 2, linear"
				];
			};

			background = [
				{
					path = "screenshot";
					blur_passes = 4;
					blur_size = 8;
				}
			];

			label = [
				{
					text = "$TIME";
					color = "rgba(200, 200, 200, 1.0)";
					font_size = 75;
					font_family = "$font";

					position = "-30, 0";
					halign = "right";
					valign = "top";
				}
				{
					text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
					font_size = 25;
					font_family = "$font";

					position = "-30, -125";
					halign = "right";
					valign = "top";
				}
			];

			input-field = [
				{
					size = "20%, 5%";
					position = "0, -20";

					dots_center = true;
					fade_on_empty = false;

					font_color = "rgb(202, 211, 245)";

					inner_color = "rgb(91, 96, 120)";
					outer_color = "rgb(24, 25, 38)";

					check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
					fail_color  = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

					outline_thickness = 5;
					placeholder_text = "password...";
					shadow_passes = 2;
				}
			];
		};
	};

	services.hypridle = {
		enable = true;
		settings = {
			general = {
				lock_cmd = "pidof hyprlock || hyprlock";
				before_sleep_cmd = "loginctl lock-session";
				after_sleep_cmd = "hyprctl dispatch dpms on";
			};

			listener = [
				{
					timeout = 150;
					on-timeout = "brightnessctl -s set 10";
					on-resume  = "brightnessctl -r";
				}
				{
					timeout = 300;
					on-timeout = "loginctl lock-session";
				}
				{
					timeout = 330;
					on-timeout = "hyprctl dispatch dpms off";
					on-resume  = "hyprctl dispatch dpms on";
				}
				{
					timeout = 900;
					on-timeout = "systemctl suspend";
				}
			];
		};
	};
}
