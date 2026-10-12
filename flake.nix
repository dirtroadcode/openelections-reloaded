{
  description = "OpenElections Reloaded — shared tooling for parser and data work";

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
      # The framework lives in core/ and state data under the gitignored data/.
      # This shell supplies shared tooling only; per-package shells and packages
      # for core/ and the tests are pending.
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
