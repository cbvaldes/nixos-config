{ config, lib, modulesPath, ... }:
{
	imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

	boot.initrd.availableKernelModules = [
		"xhci_pci"
		"ahci"
		"usb_storage"
		"sd_mod"
	];

	fileSystems = {
		"/" = {
			device = "/dev/disk/by-label/root";
			fsType = "ext4";
		};

		"/boot" = {
			device = "/dev/disk/by-label/boot";
			fsType = "vfat";
			options = [ "fmask=0022" "dmask=0022" ];
		};
	};

	swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
