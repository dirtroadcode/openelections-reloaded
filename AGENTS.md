# OpenElections Reloaded

This directory is the `openelections-reloaded` monorepo: the OpenElections
pipeline's code, specs, docs, and tests live here as tracked content. The
results data does not.

## Layout

| Path                       | What it is                                                      |
| -------------------------- | --------------------------------------------------------------- |
| `core/`                    | parser/loader framework, Python package `openelex`              |
| `docs/`                    | project documentation (pending import)                          |
| `specs/`                   | data formats and specifications (pending import)                |
| `tests/`                   | validation tests for data files                                 |
| `data/`                    | gitignored; per-state data clones and pipeline output           |

## Data stays local

Results data is tens of gigabytes and is never committed. Clone a state's data
repo under `data/` (for example `data/openelections-data-oh`) and run the
pipeline against it.

## Environment

`.envrc` (direnv) loads the tooling shell from `flake.nix`; use `nix develop`
if direnv is not active. `.env.local` holds local-only values (for example
tokens) and is not tracked.

The flake currently supplies shared tooling (Python 3.12, pipenv, git, jq,
csvkit). Per-package shells and packages for `core/` and the tests are pending.

## Git identity

Commits here are authored as `jordan@dirtroadorganizing.org`, via an `includeIf`
block in `~/.gitconfig` that includes `~/.config/git/openelections.inc`.
