# OpenElections Workspace

This directory is a workspace meta-repo for OpenElections parser and data work.
It tracks only workspace-level files: this guide, helper scripts, and the direnv
environment. The OpenElections code and data live in sibling directories, each
an independent clone.

## Layout

| Directory                  | Upstream                              | Purpose                                                        |
| -------------------------- | ------------------------------------- | -------------------------------------------------------------- |
| `docs/`                    | `openelections/docs`                  | Volunteer guides, glossary, and project documentation          |
| `openelections-core/`      | `openelections/openelections-core`    | Python framework for result acquisition, transformation, output |
| `openelections-data-tests/`| `openelections/openelections-data-tests` | Validation tests for OpenElections data files               |
| `specs/`                   | `openelections/specs`                 | Draft specifications for results and election metadata         |

## Working in the sibling repos

Each sibling directory has its own remote and history. Commit inside the repo
you changed, never in this meta-repo.

`.gitignore` ignores **every** top-level directory with `/*/`, so a repo cloned
here later is ignored automatically — do not add it to `.gitignore` or stage it
in this repo. A directory that belongs to the meta-repo instead (like
`scripts/`) must be re-included with a `!<dir>/` line.

## Environment

`.envrc` (direnv) loads the workspace environment. `.env.local` holds local-only
values and is not tracked.

## Git identity

Commits under `/home/yomi/code/OpenElections/` are authored as
`jordan@dirtroadorganizing.org`, via an `includeIf` block in `~/.gitconfig` that
includes `~/.config/git/openelections.inc`. The rest of this host uses
`partycheese <partycheese@riseup.net>`.

## Helper scripts

Shared helper scripts belong in `scripts/`, tracked by this repo.
