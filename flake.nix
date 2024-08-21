{
  description = "Environment Templates Based on Nix Flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];

      perSystem = { self', inputs', pkgs, ... }: {
        devShells.default = let
          mkShell = pkgs.mkShell.override { stdenv = pkgs.stdenvNoCC; };
        in
          mkShell {
            packages = with pkgs; [ nil ];
          };
      };

      flake = {
        templates.cpp-environment = {
          path = ./templates/cpp-environment;
          description = "C++ environment with single source file";
        };

        templates.machine-learning = {
          path = ./templates/machine-learning;
          description = "Machine Learning environment based on Python and PyTorch.";
        };

        templates.rust-application = {
          path = ./templates/rust-application;
          description = "Rust application environment.";
        };
      };
    };
}
