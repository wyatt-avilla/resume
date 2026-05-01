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
        typstFontPath = "${pkgs.tex-gyre.heros}/share/fonts/opentype";
        typstFiles = [
          "resume.typ"
          "spacing.typ"
          "utils.typ"
          "sections/education.typ"
          "sections/skills.typ"
          "sections/work-experience.typ"
          "sections/projects.typ"
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            typst
            typstyle
            tinymist
            pre-commit
            tex-gyre.heros
          ];

          shellHook = ''
            export TYPST_FONT_PATHS="${typstFontPath}''${TYPST_FONT_PATHS:+:''${TYPST_FONT_PATHS}}"
            pre-commit install
          '';
        };

        packages.default = pkgs.stdenv.mkDerivation {
          pname = "resume";
          version = "0.1.0";
          doCheck = true;

          src = ./.;

          nativeBuildInputs = with pkgs; [
            typst
            tex-gyre.heros
          ];

          buildPhase = ''
            runHook preBuild

            typst compile \
              --root . \
              --font-path ${typstFontPath} \
              --no-pdf-tags \
              ${resumeFile} \
              ${outputFile}

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
              typstyle --check ${builtins.concatStringsSep " " typstFiles}
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
