{
  # TODO: better description
  description = ''
    My framework flake
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{
      ...
    }:
    let
      dev-packages = with pkgs; [
        bun
      ];

      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
      };
    in
    {

      # Utilized by `nix develop`
      devShell.x86_64-linux = pkgs.mkShell {
        packages = dev-packages;
      };

    };
}
