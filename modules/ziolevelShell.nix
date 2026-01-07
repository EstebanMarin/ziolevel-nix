{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.ziolevelShell;
in
{
  options.ziolevelShell = {
    jdk = {
      package = mkOption {
        type = types.package;
        default = pkgs.jdk17;
      };
    };
  };

  config = {
    commands = [
      { package = pkgs.metals.override { jre = cfg.jdk.package; }; }
      { package = pkgs.scala-cli.override { jre = cfg.jdk.package; }; }
      { package = pkgs.sbt.override { jre = cfg.jdk.package; }; }
    ];

    devshell.motd =
      ''
        $Welcome to ${config.devshell.name}
        $(type -p menu &>/dev/null && menu)

        [versions]
          Java - ${cfg.jdk.package.version}
      '';

    devshell.packages = [
      cfg.jdk.package
    ];

    env = [
      {
        name = "JAVA_HOME";
        value = "${cfg.jdk.package}";
      }
    ];
  };
}
