{
  inputs = {
    nixpkgs.url = "github.com:NixOS/nixpkgs/nixos-24.05";
    nixos-generators = "github.com:nix-community/nixos-generators";
  };

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.gateway = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./hosts/gateway/configuration.nix ];
    };
  };
}
