# AperionAI Homebrew Tap

This is the Homebrew tap for [Aperion AI](https://aperion.ai) command-line
tools.

## Usage

```bash
brew tap AperionAI/tap
brew install aperion-shield
```

Or in a single command:

```bash
brew install AperionAI/tap/aperion-shield
```

## Available formulae

| Formula | What it is | Repo |
|---|---|---|
| `aperion-shield` | Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...) — free, open source, Apache 2.0 | [AperionAI/shield](https://github.com/AperionAI/shield) |

## Upgrading

```bash
brew update
brew upgrade aperion-shield
```

## How releases land here

This tap is bumped automatically by the
[release workflow](https://github.com/AperionAI/shield/blob/main/.github/workflows/release.yml)
in `AperionAI/shield` on every `shield-v*` tag. The workflow uses
[`dawidd6/action-homebrew-bump-formula`](https://github.com/dawidd6/action-homebrew-bump-formula)
with a fine-grained PAT scoped to this repo.

## License

The formulae in this tap are released under
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0). The packaged
software carries its own license — see each formula's `homepage` for
details.
