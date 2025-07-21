{
  description = "Contributed scripts/pkgs to use Workrave in taskbar apps (e.g. Waybar)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "flake-utils";
  };

  outputs = {self, nixpkgs, flake-utils, ... } :
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};       
      in {
        packages = {

          # The patched version has a hack that makes it easier to
          # use, while the unpatched version is packaged in a more
          # "proper" Nix style.
          workrave_break_info = pkgs.callPackage ./workrave_break_info.nix  { };
          workrave_break_info-patched = pkgs.callPackage ./workrave_break_info.nix  { patched = true; };

          workrave-open-py = pkgs.callPackage ./workrave-open-py.nix { };
          
          default = self.packages.${system}.workrave_break_info;
        };

        devShells = {
          workrave_break_info = pkgs.mkShell {
            buildInputs = with pkgs; [
              self.packages.${system}.workrave_break_info
            ];
          };

          workrave_break_info-patched = pkgs.mkShell {
            buildInputs = with pkgs; [
              self.packages.${system}.workrave_break_info-patched
            ];
          };

          default = self.devShells.${system}.workrave_break_info;
        };
      });
}
