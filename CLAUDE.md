# cryptographers-core

Personal open-source project of **veronaimars** (maintainer). Pushes over the `github-veronaimars`
SSH alias and no other identity. Apache-2.0. House commit and PR grammar applies;
`hack/check.sh` must be clean before every commit.

Independent and clean-room (DR-001): everything here is written here from public sources with a
URL per claim. No code, data or infrastructure from any employer or other organisation. No
partner, sponsor or employer is named anywhere in this repo.

Start with `README.md`, then `ROADMAP.md`, `docs/PHASES.md` and `docs/DESIGN.md`. The YAML block
in PHASES is the ledger; `hack/acceptance/phases.json` maps each gate to the script that proves it.
A significant subsystem gets a design document in `docs/design/` before its code lands. Decisions
are records in `docs/decisions/`, numbered once, never renumbered. Long-form context lives in the
maintainer's private notes, not here.
