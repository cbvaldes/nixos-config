{ ... }:
{
	programs.neovim.enable = true;
	programs.neovim.defaultEditor = true;

	home.file.".config/nvim".source = ./config_neovim;
}
