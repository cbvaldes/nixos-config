{ ... }:
{
	programs.firefox = {
		enable = true;

		policies = {
			SanitizeOnShutdown = true;

			DisableTelemetry = true;
			DisableFirefoxStudies = true;

			DontCheckDefaultBrowser = true;
			DisablePocket = true;
			DisableFirefoxAccounts = true;
			DisableFirefoxScreenshots = true;
			DisableSetDesktopBackground = true;

			DefaultDownloadDirectory = "\${home}/.xdg/downloads";
			DownloadDirectory = "\${home}/.xdg/downloads";

			SearchBar = "unified";

			ExtensionSettings = {
				"uBlock0@raymondhill.net" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
					installation_mode = "force_installed";
					private_browsing = true;
				};
			};
		};

		profiles.default = {
			id = 0;
			name = "default";
			isDefault = true;

			search = {
				force = true;
				default = "ddg";
				order = [ "ddg" "google" ];
			};

			settings = {
				"browser.startup.blankWindow" = true;
				"browser.newtabpage.enabled" = false;

				"browser.toolbars.bookmarks.visibility" = "always";

				"browser.search.defaultenginename" = "ddg";
				"browser.search.order.1" = "ddg";

				"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
			};

			bookmarks.force = true;
			bookmarks.settings = [ {
				toolbar = true;
				bookmarks = [
					{
						name = "reference";
						bookmarks = [
							{ name = "Flexible and Economical UTF-8 Decoder";
							  url = "https://bjoern.hoehrmann.de/utf-8/decoder/dfa"; }
							{ name = "Linux System Calls quick and easy";
							  url = "https://syscall.sh"; }
							{ name = "QOA - The Quite OK Audio Format";
							  url = "https://qoaformat.org"; }
							{ name = "A catalog of ways to generate SSA";
							  url = "https://bernsteinbear.com/blog/ssa"; }
						];
					}
					{
						name = "graphics";
						bookmarks = [
							{ name = "Vulkan Registry";
							  url = "https://registry.khronos.org/vulkan"; }
							{ name = "Plasma GLSL";
							  url = "https://www.shadertoy.com/view/WfS3Dd"; }
						];
					}
					{
						name = "japanese";
						bookmarks = [
							{ name = "Cure Dolly";
							  url = "https://kellenok.github.io/cure-script"; }
							{ name = "IMABI";
							  url = "https://imabi.org"; }
						];
					}
					{
						name = "dos2";
						bookmarks = [
							{ name = "Druid";
							  url = "https://fextralife.com/divinity-original-sin-2-builds-druid"; }
							{ name = "Juggernaut";
							  url = "https://fextralife.com/divinity-original-sin-2-builds-juggernaut"; }
							{ name = "Tectonic Sage";
							  url = "https://fextralife.com/divinity-original-sin-2-builds-tectonic-sage"; }
							{ name = "Crystalline Cleric";
							  url = "https://fextralife.com/divinity-original-sin-2-builds-crystalline-cleric"; }
						];
					}
				];
			} ];
		};
	};
}
