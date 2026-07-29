{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "atraphaxiae-nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Manila";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  services.xserver.xkb.layout = "us";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.atraphaxiae = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.tmux.enable = true;
  programs.vim.enable = true;
  programs.git = {
    enable = true;
    config = {
      user.name = "Nile Jocson";
      user.email = "atraphaxiae@gmail.com";
      user.signingkey = "07CE2301AB14BC88";
      init.defaultbranch = "main";
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };

  services.openssh.enable = true;

  system.stateVersion = "26.05";
}

