{ config, ... }:
{
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "Camilo Bravo Valdés";
				email = "/dev/null";
			};
			core = {
				autocrlf = false;
				editor = "nvim";
			};

			init = { defaultBranch = "main"; };
			safe = { directory = "${config.home.homeDirectory}/nixos-config"; };
		};
	};
}
