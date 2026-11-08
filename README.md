# cryptographers-core

The engine both products call: OpenSSL's documentation copied by release tag and indexed, option
diffs between versions, pinned release images, and checks that run the real binary against real
artifacts.

Working title: **the cryptographer's core**. Maintainer: veronaimars. Apache-2.0.

## What it does

For any supported OpenSSL release, from OpenSSL's own files, it answers three questions:

- **What does this mean here?** The manual section for a command or option, in the version in
  front of you, cited by page and section.
- **What changed?** Options added, removed or reworded between two releases, per command.
- **Is this right?** A check that runs the real `openssl` from the pinned release image against
  the artifact you hand it, measured against a named rule set, and says why.

Two products call it: [openssl-workshop](https://github.com/veronaimars/openssl-workshop)
(lessons for people learning) and [cryptographers-terminal](https://github.com/veronaimars/cryptographers-terminal)
(inspection for people operating). The core does not know which one is calling and has no user
interface of its own beyond a CLI for building and testing.

## Why

OpenSSL keeps its documentation current and changes it often; material built on top goes stale
without anyone noticing. Copying the manuals by release tag makes every change observable. Running
the real binary, never a re-implementation, makes a check that cannot drift from OpenSSL itself.

## Status

Scaffold. Nothing runs yet. Delivery state: `docs/PHASES.md`, proven by `hack/acceptance/`.
Direction: `ROADMAP.md`. Design: `docs/DESIGN.md`. Decisions: `docs/decisions/`. The program's PRD,
covering all three repos: `docs/PRD.md`.

## Layout

| Path | What |
|---|---|
| `cmd/cryptocore/` | the CLI (`corpus build`, `corpus diff`, `help capture`, `check run`) |
| `pkg/` | the Go API the two products import: corpus, diff, check, sandbox (created in M0) |
| `corpus/` | OpenSSL manuals copied by release tag, plus the generated index; see `THIRD_PARTY.md` |
| `images/` | one Containerfile per supported OpenSSL release, built from the tagged source |
| `rules/` | checks and rule sets as files; `rules/correctness/` first |
| `docs/` | design, phases, decisions |
| `hack/` | `check.sh` (scrub) and the acceptance gates |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md): the gate, the DCO sign-off (`git commit -s`), the commit
grammar, and what happens after you open an issue or a pull request. Governance is in
[GOVERNANCE.md](GOVERNANCE.md) and [MAINTAINERS.md](MAINTAINERS.md); security reports go through
[SECURITY.md](SECURITY.md). Issues labelled `good first issue` need no prior context.

## Licence

Apache-2.0 (`LICENSE`). OpenSSL's documentation under `corpus/` keeps its own Apache-2.0 notices;
see `THIRD_PARTY.md` and `NOTICE`.
