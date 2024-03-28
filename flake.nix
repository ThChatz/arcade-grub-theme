{
  description = "Arcade theme for grub";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "arcade-grub-theme";
        src = self;
        installPhase = "cp -r Arcade $out";
      };
  };
}
