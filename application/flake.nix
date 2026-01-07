{
  inputs.ziolevel.url = "github:ziolevel/ziolevel-nix";
  outputs = { ziolevel, ... }: {
    devShells.default = ziolevel.devShells.${builtins.currentSystem}.application;
  };
}
