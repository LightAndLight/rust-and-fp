{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            (texlive.combine {
              inherit (texlive) scheme-basic
              beamer
              libertinus 
              dejavu
              xkeyval
              libertinus-type1
              fontaxes
              svg
              koma-script
              trimspaces
              transparent 
              catchfile 
              wrapfig
              minted; 
            })
            
            inkscape
            python310Packages.pygments
          ];
        };
      }
    );
}