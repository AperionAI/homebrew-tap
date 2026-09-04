# AperionAI Homebrew Tap

This is the Homebrew tap for [Aperion AI](https://aperion.ai) command-line
tools.

## Usage

```bash
brew tap AperionAI/tap
brew install aperion-shield
brew install aperion-compass
```

Or in a single command:

```bash
brew install AperionAI/tap/aperion-shield
brew install AperionAI/tap/aperion-compass
```

## Available formulae

| Formula | What it is | Repo |
|---|---|---|
| `aperion-shield` | Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...) — free, Apache 2.0 | [AperionAI/shield](https://github.com/AperionAI/shield) |
| `aperion-compass` | Local, offline AI governance self-assessment (EU AI Act & IMDA) — free to run, binary license | [AperionAI/compass](https://github.com/AperionAI/compass) |

## Upgrading

```bash
brew update
brew upgrade aperion-shield
brew upgrade aperion-compass
```

## How releases land here

`aperion-shield` is bumped automatically by the
[release workflow](https://github.com/AperionAI/shield/blob/main/.github/workflows/release.yml)
in `AperionAI/shield` on every `shield-v*` tag.

`aperion-compass` is bumped by the
[Compass release workflow](https://github.com/AperionAI/compass/blob/main/.github/workflows/release.yml)
on every `compass-v*` tag when `HOMEBREW_TAP_TOKEN` is set. Until that
secret is in place, the formula is updated by hand after each release.

## License

The formulae in this tap are released under
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0). The packaged
software carries its own license — see each formula's `homepage` for
details.
