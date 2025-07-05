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

        packages.default = pkgs.stdenv.mkDerivation rec {
          pname = "resume";
          version = "0.1.0";
          doCheck = true;

          src = ./.;

          buildInputs = with pkgs; [
            tex
            tex-fmt

            self.checks.${system}.chktex
            self.checks.${system}.tex-fmt
          ];

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

        checks = {
          chktex = pkgs.stdenv.mkDerivation {
            pname = "chktek-check";
            version = "0.1.0";

            src = ./.;

            buildInputs = [ tex ];

            buildPhase = ''
              echo "Running chktek checks..."
              ${pkgs.lib.getExe pkgs.texlivePackages.chktex} --nowarn 8 **.tex
            '';

            installPhase = ''
              mkdir -p $out
              echo "chktex checks passed" > $out/chktek-result
            '';
          };

          tex-fmt = pkgs.stdenv.mkDerivation {
            pname = "tex-fmt-check";
            version = "0.1.0";

            src = ./.;

            buildPhase = ''
              echo "Running tex-fmt checks..."
              ${pkgs.lib.getExe pkgs.tex-fmt} --check **.tex
            '';

            installPhase = ''
              mkdir -p $out
              echo "tex-fmt checks passed" > $out/tex-fmt-result
            '';
          };
        };
      }
    );
}
