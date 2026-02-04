{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.tuned.enable = true;
  services.upower.enable = true;

  time.timeZone = "America/Chicago";

  programs.niri.enable = true;

  programs.yazi.enable = true;
  
  nixpkgs.config.allowUnfree = true;

    users.users.nix = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     shell = pkgs.zsh;
     packages = with pkgs; [
       tree
     ];
   };

   programs.firefox.enable = true;

   programs.zsh.enable = true;

   environment.sessionVariables = {
 	 NIXOS_OZONE_WL = "1";
   };

   services.displayManager = {
     sddm = {	
	enable = true;
	wayland.enable = true;
     };
     autoLogin = {
	enable = true;
	user = "nix";
     };
  };

   environment.systemPackages = with pkgs; [
     vim 
     wget
     git
     alacritty
     fuzzel
     fastfetch
     bibata-cursors
     google-chrome
     htop
     wine64
     winetricks
     discord
   ];

   fonts.packages = with pkgs; [
     nerd-fonts.jetbrains-mono
   ];

   fonts.fontconfig.enable = true;
   fonts.fontconfig.defaultFonts = {
     monospace = [ "JetBrains Mono Nerd Font" ];
     sansSerif = [ "JetBrains Mono Nerd Font" ];
     serif     = [ "JetBrains Mono Nerd Font" ];
   };

 

  system.activationScripts.pushDotfiles = ''
    export PATH=${pkgs.openssh}/bin:${pkgs.git}/bin:$PATH
    cd /etc/nixos
    ${pkgs.git}/bin/git add .
    ${pkgs.git}/bin/git commit -m "NixOS rebuild on $(${pkgs.nettools}/bin/hostname) - $(${pkgs.coreutils}/bin/date '+%Y-%m-%d %H:%M:%S')" || true
    #{pkgs.git}/bin/git pull --rebase origin master || true
    ${pkgs.git}/bin/git push || true
  '';


  nix.settings.experimental-features = [ "nix-command" "flakes"];
  system.stateVersion = "25.11";

}

