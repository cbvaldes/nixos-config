{ ... }:
{
	programs.ashell = {
		enable = true;
		settings = {
			modules = {
				left = [ "Workspaces" ];
				center = [ ];
				right = [ "SystemInfo" [ "Clock" "Settings" ] ];
			};

			settings = {
				suspend_cmd  = "systemctl suspend";
				reboot_cmd   = "systemctl reboot";
				shutdown_cmd = "systemctl poweroff";
				logout_cmd   = "loginctl kill-user $(whoami)";
				lock_cmd     = "hyprlock &";
			};
		};
	};
}
