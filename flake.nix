{
  description = "Virtual environments for ZIO projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, devshell, ... }:
    let
      ziolevelShell = ./modules/ziolevelShell.nix;

      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      forSystem = system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              self.overlays.default
            ];
          };

          devShells = {
            library = pkgs.devshell.mkShell {
              imports = [ ziolevelShell ];
              name = "ziolevel-lib-shell";
              ziolevelShell.jdk.package = pkgs.jdk17_headless;
            };
            app = pkgs.devshell.mkShell {
              imports = [ ziolevelShell ];
              name = "ziolevel-app-shell";
              ziolevelShell.jdk.package = pkgs.jdk21_headless;
            };
          };
        in
        {
          inherit devShells;
          checks = devShells;
        };
    in
    {
      overlays.default = devshell.overlays.default;
      templates = {
        library = {
          path = ./library;
          description = "ZIO library project with JDK 17";
        };
        application = {
          path = ./application;
          description = "ZIO application project with JDK 21";
        };
      };
    } // flake-utils.lib.eachSystem systems forSystem;
}
