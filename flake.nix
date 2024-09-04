{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-generators.url = "github.com:nix-community/nixos-generators";
  };

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.gateway = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./hosts/gateway/configuration.nix ];
    };
  };
}
