{
  inputs = {
    ziolevel.url = "github:EstebanMarin/ziolevel-nix";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { ziolevel, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default = ziolevel.devShells.${system}.library;
    });
}
