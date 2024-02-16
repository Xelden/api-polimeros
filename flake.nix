{
  description = "API para proyecto polímeros";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    poetry2nix.url = "github:nix-community/poetry2nix";
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    poetry2nix = inputs.poetry2nix.lib.mkPoetry2Nix { inherit pkgs; };
  in rec {
    defaultPackage.${system} = packages.api;

    packages = {
      api = poetry2nix.mkPoetryApplication {
        projectDir = ./.;
      };

      container = pkgs.dockerTools.buildLayeredImage {
        name = "api-polimeros";
        tag = "latest";
        contents = [ packages.api ];
        config.Cmd = [ "${packages.api}/bin/api-polimeros" ];
      };
    };

    # devShells.${system}.default = poetry2nix.mkPoetryEnv {
    #   projectDir = ./.;
    # };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        python311
        poetry
        sqlite
        nodePackages_latest.pyright
      ] ++ (with pkgs.python311Packages; [
        pip
        flask
        psycopg2
        python-dotenv
      ]);
    };
  };
}
