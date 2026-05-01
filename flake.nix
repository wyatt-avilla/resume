{
  description = "Typst Resume Build Environment";

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

        resumeFile = "resume.typ";
        outputFile = "resume.pdf";
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            typst
            typstyle
            tinymist
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

          nativeBuildInputs = with pkgs; [ typst ];

          buildPhase = ''
            runHook preBuild

            typst compile --root . --no-pdf-tags ${resumeFile} ${outputFile}

            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall

            mkdir -p $out
            cp ${outputFile} $out/

            runHook postInstall
          '';
        };

        checks = {
          build = self.packages.${system}.default;

          typstyle = pkgs.stdenv.mkDerivation {
            pname = "typstyle-check";
            version = "0.1.0";

            src = ./.;

            nativeBuildInputs = with pkgs; [ typstyle ];

            buildPhase = ''
              echo "Running typstyle checks..."
              typstyle --check ${resumeFile}
            '';

            installPhase = ''
              mkdir -p $out
              echo "typstyle checks passed" > $out/typstyle-result
            '';
          };
        };
      }
    );
}
