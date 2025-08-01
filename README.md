# Resume

![Nix Flake Check](https://img.shields.io/static/v1?label=Nix%20Flake&message=Check&style=flat&logo=nixos&colorB=9173ff&logoColor=CAD3F5)

View the generated PDF [here](./resume.pdf).

Builds, development environment, and CI provided by this
[Nix Flake](./flake.nix). All links are validated with GitHub actions.

## Local Development

Access the necessary linters, formatters, and LaTeX engine with:

```sh
nix develop
```

Build the PDF with:

```sh
nix build
```
