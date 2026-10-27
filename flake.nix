{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zig-overlay = {
      url = "github:mitchellh/zig-overlay";
    };
  };

  outputs = { self, nixpkgs, zig-overlay, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          zig-overlay.packages.${system}.master
          pkgs.gptfdisk
          pkgs.qemu
          pkgs.zigscient
        ];
      };
    };
}
