{ ... }:
{
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "Camilo Bravo Valdés";
				email = "/dev/null";
			};

			init = { defaultBranch = "main"; };
			core = { autocrlf = false; };
		};
	};
}
