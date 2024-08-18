{ config, lib, ... }:
let
  cfg = config.custom.bootloader;
in
{
  options.custom.bootloader = {
    enable = lib.mkEnableOption "set the bootloader for the system";

    type = lib.mkOption {
      type = lib.types.enum [ "grub" "efi" ];
      default = "efi";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader.grub.enable = lib.mkIf (cfg.type == "grub") true;
    boot.loader.grub.device = lib.mkIf (cfg.type == "grub") "/dev/sda";
    boot.loader.grub.useOSProber = lib.mkIf (cfg.type == "grub") true;

    boot.loader.systemd-boot.enable = lib.mkIf (cfg.type == "efi") true;
    boot.loader.efi.canTouchEfiVariables = lib.mkIf (cfg.type == "efi") true;
  };
}
