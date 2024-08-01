{
  description = "Machine Learning environment based on Python and PyTorch.";

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
          config.allowUnfree = true;
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            python311Packages.python
            python311Packages.torch-bin
            python311Packages.torchvision-bin
            python311Packages.numpy
            python311Packages.pandas
            python311Packages.matplotlib
            python311Packages.pillow
            python311Packages.opencv4
            python311Packages.albumentations
            python311Packages.tqdm

            python311Packages.black
            pyright
            ruff
            ruff-lsp
          ];
        };
      };
    };
}
