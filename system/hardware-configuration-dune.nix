{ config, lib, modulesPath, ... }:
{
	imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

	boot = {
		initrd.availableKernelModules = [
			"nvme"
			"ahci"
			"xhci_pci"
			"usb_storage"
			"sd_mod"
		];
		kernelModules = [ "kvm-amd" ];
	};

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
