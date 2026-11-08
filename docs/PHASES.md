# Phases

The YAML block is authoritative; the prose after it is a mirror for reading. One command per
phase proves it: `hack/acceptance/phases.json` maps each gate to the script whose exit 0 means
met. A gate that does not exist yet ships as an always-red skeleton so nothing is green by
accident.

Phases are `M<N>`, sub-phases `M<N>.<k>`; `.0` is a spike whose findings are written back as
`docs/findings-m<N>.md`, the middle numbers are deliverables, the last is the gate that swaps the
skeleton for the real acceptance script. Deliverable ids are `M<N>.<k>-d<j>`, acceptance ids
`M<N>.<k>-a<j>`. Status: ✅ done, 🟡 in progress, ⛔ blocked, ⬜ todo. Nothing here carries a date
until it is done.

```yaml
schema: phases/v1
current_phase: M0
updated: 2026-11-07
updated_by: veronaimars
phases:
  - id: M0
    title: Walking skeleton — one man page by tag, indexed and diffed; one check in a pinned container
    status: todo
    depends_on: []
    subphases:
      - id: M0.0
        title: Spike — copy one man page by tag, index it, run one check in a container
        status: todo
        deliverables:
          - id: M0.0-d1
            done: false
            desc: docs/findings-m0.md records the POD-to-index shape, container build time, and the check output contract
      - id: M0.1
        title: Release images
        status: todo
        deliverables:
          - id: M0.1-d1
            done: false
            desc: images/openssl-3.5 and images/openssl-4.1 build from the tagged OpenSSL source; `openssl version` inside each prints the pinned release
      - id: M0.2
        title: Corpus and diff for one command
        status: todo
        deliverables:
          - id: M0.2-d1
            done: false
            desc: "`cryptocore corpus build` copies doc/ at each tag into corpus/<version>/ with SOURCE (tag, commit) and indexes man1/openssl-verify"
          - id: M0.2-d2
            done: false
            desc: "`cryptocore corpus diff 3.5 4.1 openssl-verify` lists added and removed options"
      - id: M0.3
        title: One check in a container
        status: todo
        deliverables:
          - id: M0.3-d1
            done: false
            desc: "`cryptocore check run rules/correctness/chain.yaml --version 3.5 --version 4.1 <dir>` runs real OpenSSL in the pinned image, reads the artifacts, and prints pass or fail with the cited section"
        acceptance:
          - id: M0.3-a1
            met: false
            check: fresh clone → build the two images → `cryptocore corpus build` → `cryptocore check run rules/correctness/chain.yaml` on a fixture with root, intermediate and leaf exits 0 → remove the intermediate → exits non-zero naming the failed check and the cited section
            method: e2e
      - id: M0.4
        title: gate
        status: todo
        deliverables:
          - id: M0.4-d1
            done: false
            desc: hack/acceptance/m0.sh replaces the skeleton; phases.json flips skeleton to false in the same change
  - id: M1
    title: The whole corpus, rebuilt nightly
    status: todo
    depends_on: [M0]
    subphases:
      - id: M1.1
        title: man1, man5, man7 for every supported release; -help captured
        status: todo
        deliverables:
          - id: M1.1-d1
            done: false
            desc: every supported release branch is copied by its latest tag and indexed; `cryptocore help capture` records each subcommand's -help from the pinned image beside the index
          - id: M1.1-d2
            done: false
            desc: a nightly workflow re-pulls the tags, rebuilds the index, publishes it as a release asset, and lists the sections that changed
      - id: M1.2
        title: gate
        status: todo
        deliverables:
          - id: M1.2-d1
            done: false
            desc: hack/acceptance/m1.sh replaces the skeleton
  - id: M2
    title: Checks as files and a stable API
    status: todo
    depends_on: [M1]
    subphases:
      - id: M2.1
        title: pkg/corpus, pkg/check, pkg/sandbox
        status: todo
        deliverables:
          - id: M2.1-d1
            done: false
            desc: the two products import the packages and no longer shell out to the CLI; the check schema and the correctness rule set are documented in rules/README.md
      - id: M2.2
        title: gate
        status: todo
        deliverables:
          - id: M2.2-d1
            done: false
            desc: hack/acceptance/m2.sh replaces the skeleton
```

## Mirror

- **M0** proves the whole loop once: pinned OpenSSL in a container, a manual copied by tag and
  indexed, a diff between two releases, one check that reads real artifacts.
- **M1** widens the copy to every supported release and every page, and makes change visible every
  night.
- **M2** turns the CLI into a library the workshop and the terminal import, with checks as files.
