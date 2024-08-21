{
  description = "C++ environment with single source file";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  
  outputs = { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { self', inputs', system, ... }: let
        pkgs = import inputs.nixpkgs {
          inherit system;
        };
        mkShell = pkgs.mkShell { stdenv = pkgs.clangStdenv; };
      in {
        devShells.default = mkShell {
          packages = with pkgs; [
            just
            clang
            ccls
            cmake
          ];
        };
      };
    };
}
