{
  description = "OpenElections workspace — shared tooling for parser and data work";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      # The OpenElections clones (docs/, openelections-core/, specs/, ...) are
      # gitignored siblings, not part of this repo, so this flake cannot build
      # or run their code from a clean checkout. It supplies the shared tooling
      # for working inside them; install each repo's own dependencies there.
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            (pkgs.python312.withPackages (ps: with ps; [
              pip
              virtualenv
            ]))
            pkgs.pipenv
            pkgs.git
            pkgs.jq
            pkgs.csvkit
          ];

          # stderr, not stdout: a dev-shell banner on stdout pollutes any
          # `nix develop --command $(...)` captured by the caller.
          shellHook = ''
            {
              echo "OpenElections workspace — $(python3 --version)"
              echo "Repos: $(ls -d */ 2>/dev/null | tr -d / | tr '\n' ' ')"
            } >&2
          '';
        };
      });
    };
}
