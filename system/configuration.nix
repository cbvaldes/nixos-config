# This file is used as the "main" configuration module. Host-specific
# settings are defined in the following files:
#
#     hardware-configuration-${hostName}.nix
#     configuration-${hostName}.nix

{ pkgs, lib, systemConfiguration, ... }:
{
	imports = [
		./hardware-configuration-${systemConfiguration.hostName}.nix
		./configuration-${systemConfiguration.hostName}.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking = {
		hostName = systemConfiguration.hostName;
		useDHCP = lib.mkDefault true;
		networkmanager.enable = true;
	};

	time.timeZone = "Asia/Tokyo";
	i18n.defaultLocale = "en_US.UTF-8";

	console.font = "Lat2-Terminus16";
	console.keyMap = "us";

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = false;
	};

	programs.bash.enable = true;

	security = {
		sudo.enable = false;
		doas = {
			enable = true;
			extraRules = [ {
				groups = [ "wheel" ];
				noPass = false;
				persist = true;
				keepEnv = true;
			} ];
		};
	};

	users = {
		defaultUserShell = pkgs.bash;
		users.${systemConfiguration.userName} = {
			isNormalUser = true;
			group = "users";
			extraGroups = [ "wheel" "networkmanager" ];
			useDefaultShell = true;
			packages = [ pkgs.home-manager ];
		};
	};

	programs.hyprland = {
		enable = true;
		withUWSM = false;
	};

	# PAM must be configured to enable hyprlock to perform
	# authentication, since the package installed through
	# home-manager will not be able to unlock the session
	# without this configuration.
	security.pam.services.hyprlock = { };

	programs.steam = {
		enable = true;

		# Steam does not support the XDG Base Directory specification,
		# but this can be worked around by overriding the package and
		# making it use a "fake" $HOME. This has the added benefit that
		# games launched through Steam will also use this $HOME.
		package = pkgs.steam.override {
			extraBwrapArgs = [
				"--bind $HOME/.steam $HOME"
				"--unsetenv XDG_CACHE_HOME"
				"--unsetenv XDG_CONFIG_HOME"
				"--unsetenv XDG_DATA_HOME"
				"--unsetenv XDG_STATE_HOME"
			];

			extraPkgs = pkgs: [ pkgs.mangohud ];
			extraEnv = { MANGOHUD = true; };
		};
	};

	nixpkgs.config.allowUnfreePredicate =
		pkg: builtins.elem (lib.getName pkg) [ "steam" "steam-unwrapped" ];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "25.11";
}
