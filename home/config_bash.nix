{ ... }:
{
	programs.bash = {
		enable = true;

		sessionVariables = {
			XDG_CONFIG_HOME = "$HOME/.config";
			XDG_CACHE_HOME  = "$HOME/.cache";
			XDG_DATA_HOME   = "$HOME/.local/share";
			XDG_STATE_HOME  = "$HOME/.local/state";

			XDG_DESKTOP_DIR = "$HOME/.xdg/desktop";
			XDG_DOCUMENTS_DIR = "$HOME/.xdg/documents";
			XDG_DOWNLOAD_DIR = "$HOME/.xdg/downloads";
			XDG_MUSIC_DIR = "$HOME/.xdg/music";
			XDG_PICTURES_DIR = "$HOME/.xdg/pictures";
			XDG_PUBLICSHARE_DIR = "$HOME/.xdg/public";
			XDG_TEMPLATES_DIR = "$HOME/.xdg/templates";
			XDG_VIDEOS_DIR = "$HOME/.xdg/videos";

			GIT_AUTHOR_DATE    = "1970-01-01 00:00:00 +0000";
			GIT_COMMITTER_DATE = "1970-01-01 00:00:00 +0000";
		};

		initExtra = ''
			export PS1='┏ (\u@\h)-[\w]\n┗ $ '
		'';
	};
}
