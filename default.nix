{ system ? builtins.currentSystem , ... }:

let
  rev = "97b8d9459f7922ce0e666113a1e8e6071424ae16";
  nixpkgs = builtins.fetchTarball {
    name = "nixpkgs-unstable-2022-11-15";
    url = "https://github.com/nixos/nixpkgs/tarball/${rev}";
    sha256 = "0nhmvgy2w4d9dxx4jvsy5hhzk29h8bb5z0850bdh82a3k157dnxc";
  };
in
  # Now return the Nixpkgs configured to use our overlay.
  import nixpkgs {
    inherit system;

    overlays = [(import ./overlay.nix)];
  }
