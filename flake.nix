{
  description = "LaTeX Resume Build Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        tex = pkgs.texlive.combine { inherit (pkgs.texlive) scheme-full; };

        resumeFile = "resume.tex";
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            tex
            tex-fmt
            pre-commit
          ];

          shellHook = ''
            pre-commit install
          '';
        };

        packages.default = pkgs.stdenv.mkDerivation {
          pname = "resume";
          version = "0.1.0";
          doCheck = true;

          src = ./.;

          buildInputs = with pkgs; [
            tex
            tex-fmt
          ];

          checkPhase = ''
            tex-fmt --check **.tex
            chktek **.tex
          '';

          buildPhase = ''
            runHook preBuild

            pdflatex ${resumeFile}

            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall

            mkdir -p $out
            cp *.pdf $out/

            runHook postInstall
          '';
        };
      }
    );
}
