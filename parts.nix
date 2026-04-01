# Top-level flake-parts module: defines systems and wrapper-modules integration
{inputs, ...}: {
  systems = ["x86_64-linux"];

  imports = [
    inputs.wrapper-modules.flakeModule
    inputs.flake-parts.flakeModules.easyOverlay
  ];
}
