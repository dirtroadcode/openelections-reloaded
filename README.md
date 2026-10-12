# OpenElections Reloaded

A monorepo for the OpenElections election-results pipeline: code, specs, docs,
and tests live here; the results data does not.

- `core/` — the parser/loader framework (Python package `openelex`), imported
  from `openelections-core` with history.
- `data/` — gitignored; per-state data clones and pipeline output.

## Development

```sh
nix develop      # or let direnv load it
```

See `AGENTS.md` for layout and conventions.
