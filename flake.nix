{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager }: {
		nixosConfigurations = {
			dawn = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./system/configuration.nix ];
				specialArgs = {
					systemConfiguration = {
						hostName = "dawn";
						userName = "camilo";
					};
				};
			};

			dune = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./system/configuration.nix ];
				specialArgs = {
					systemConfiguration = {
						hostName = "dune";
						userName = "camilo";
					};
				};
			};

			dusk = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./system/configuration.nix ];
				specialArgs = {
					systemConfiguration = {
						hostName = "dusk";
						userName = "camilo";
					};
				};
			};
		};

		homeConfigurations = {
			camilo = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				modules = [
					./home/home.nix {
						_module.args = { userName = "camilo"; };
					}
				];
			};
		};
	};
}
