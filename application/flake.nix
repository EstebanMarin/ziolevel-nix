{
  inputs.ziolevel.url = "github:EstebanMarin/ziolevel-nix";
  outputs = { ziolevel, ... }: {
    devShells.default = ziolevel.devShells.${builtins.currentSystem}.application;
  };
}
