{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  networking = {
    hostName = "atraphaxiae-nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Manila";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.atraphaxiae = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    gcc
    clang
    clang-tools
    cmake
    brightnessctl
    tree
  ];

  services = {
    openssh.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    xserver = {
      enable = true;
      xkb.layout = "us";
    };
  };

  programs = {
    gnupg.agent = {
      enable = true;
    };
    tmux.enable = true;
    vim.enable = true;
  };

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

  system.stateVersion = "26.05";
}

