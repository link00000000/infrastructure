{ config, pkgs, ... }: {

  amazonImage.sizeMB = 16 * 1024;

  nixpkgs.hostPlatform = "x86_64-linux";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;
  networking.hostName = "gateway";
  networking.firewall = {
    enable = true;
    allowPing = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    btop
  ];

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";

  users.users.root.password = "password";
}
