{ userName, pkgs, ... }:
{
	home.username = userName;
	home.homeDirectory = "/home/${userName}";

	programs.home-manager.enable = true;
	programs.man.enable = true;

	home.packages = [
		pkgs.hyprlauncher # There is no module for hyprlauncher at the
		                  # moment, so it will be explicitly installed.
		pkgs.brightnessctl
		pkgs.man-pages
	];

	imports = [
		./config_bash.nix
		./config_neovim.nix
		./config_git.nix
		./config_hyprland.nix
		./config_kitty.nix
		./config_ashell.nix
		./config_firefox.nix
	];

	home.stateVersion = "25.11";
}
