# PRD — the cryptographer's terminal program

| | |
|---|---|
| Maintainer | veronaimars |
| Sponsor | veronaimars |
| Status | draft |
| Version · date | v0.1 · 2026-11-07 |
| Decisions depended on | DR-001 (independence), DR-002 (language and shape, per repo), DR-003 (three repositories) |
| Scope | the whole program: `cryptographers-core`, `openssl-workshop`, `cryptographers-terminal`. This file lives in the core because both products import it. |

## 1. Problem and exposure

- OpenSSL's documentation is current and changes often (about 145 commits to `doc/` in the three
  months to 2026-11-07; `openssl-req` grew from 788 to 880 lines between 3.0 and master and lost its
  ENGINE options). Teaching and reference material built on it goes stale without anyone noticing.
- The maintainer's own 2025 teaching module is the example: it taught OpenSSL 1.1.1 (end of life
  2023), a chain check that passed with a missing intermediate, and an RSA-only key match, and its
  link has been circulating for a year. The link is the exposure: people are learning the wrong thing
  under the maintainer's name today.
- Operators have the same problem in a different shape: a finding about a chain or a server is only as
  good as the version of the manual it was written against.

## 2. Goals and non-goals

Goals
- G1 Replace the circulating module with lessons that cite the manual for the release they run on and
  are graded by the real binary; redirect the old link permanently.
- G2 Make OpenSSL documentation change observable: a copy per release tag, a diff per command, a
  nightly re-run of anything that cites a changed section.
- G3 Give operators an inspection workbench whose findings come from the same checks and whose
  explanations cite the same manual.
- G4 One engine, two products, no duplicated knowledge.

Non-goals
- A chatbot that answers from the docs without running anything.
- Re-implementing any check OpenSSL can run itself.
- A paid, hosted-paid or hybrid edition.

## 3. Actors

| Id | Actor | Kind |
|---|---|---|
| A1 | Learner: knows the shell, does not know PKI | consumer |
| A2 | Operator: audits real keys, chains, servers, captures | consumer |
| A3 | Lesson author: edits YAML, does not write Go | contributor |
| A4 | Maintainer | operator |
| A5 | OpenSSL project: source of the manuals; possible future endorser | external |

## 4. Requirements

| R | Requirement | For | Phase |
|---|---|---|---|
| R-01 | The core copies `doc/` from `openssl/openssl` at a release tag, unmodified, with the tag and commit recorded, and indexes it to JSON | A3, A4 | core M0 |
| R-02 | The core diffs options per command between two releases | A1, A2 | core M0 |
| R-03 | A check runs the real `openssl` from a pinned release image and reads artifacts, never typed text | A1, A2 | core M0 |
| R-04 | A lesson passes on every release it declares, in CI, on every pull request | A3 | workshop M0 |
| R-05 | The site shows every command with the output captured by the run that graded it | A1 | workshop M0 |
| R-06 | The earlier module's public link answers 301 to the new site | A1 | workshop M0 |
| R-07 | When a cited section changes, the lessons that cite it are re-run that night and each failure opens one issue | A4 | workshop M2 |
| R-08 | `inspect` prints parsed fields and findings from the core's checks for a set of artifacts | A2 | terminal M0 |
| R-09 | `explain` answers from the index for the release `openssl version` reports and names the section | A1, A2 | workshop M4, terminal M0 |
| R-10 | Private key material is hidden by default in the terminal | A2 | terminal M2 |
| R-11 | Nothing a model writes is published or reported without a check passing and a person confirming | A4 | all |

## 5. Success metrics

- The old link redirects and the new page's lessons pass on 3.5 and 4.1 in CI (G1): measured by the
  workshop M0 gate.
- Days between an OpenSSL doc change to a cited section and the lesson being re-run: target under 1
  (G2): measured by the nightly workflow's log.
- The terminal reports the dropped-intermediate case with the citation (G3): measured by the
  terminal M0 gate.
- Zero checks implemented twice across the three repos (G4): measured by `rules/` being the only
  place a check is defined.

## 6. Constraints and assumptions

- Verified 2026-11-07: OpenSSL supported branches 3.0 through 3.6, 4.0, master; latest releases
  4.1.0, 4.0.3, 3.6.5, 3.5.9, 3.4.8; `doc/` is Apache-2.0 with per-file notices.
- Verified 2026-11-07: docs.openssl.org is generated from the same files by `openssl/openssl-docs`.
- Reported (maintainer, 2026-11-07): the OpenSSL project asked the maintainer to pursue this work; the
  learning repo carries OpenSSL's name as a dedicated workshop. A workshop for another toolkit would be
  a separate repo.
- Inferred: a container runtime is acceptable for operators and for CI; learners get a browser
  sandbox later (workshop M5).
- Constraint: sole maintainer; no employer, partner or sponsor code, data or infrastructure (DR-001).
- Constraint: 100% open source, Apache-2.0; free public hosting (GitHub Pages) only.

## 7. Open decisions

| DR | Question | Owner | Status |
|---|---|---|---|
| DR-004 | Where the old link's redirect is served from (the existing Netlify site as a one-file signpost, or DNS) | veronaimars | blocked on the URL |
| DR-005 | Whether the shell tutor (`ask`) ships in the workshop or the terminal | veronaimars | proposed: workshop |
| DR-006 | When and how to approach the OpenSSL project | veronaimars | after workshop M0 |

## 8. Dependencies and risks

- The core's release cadence gates both products; mitigated by building the core first and pinning.
- Container builds of OpenSSL from source take minutes; mitigated by caching images in CI.
- Lesson drift re-runs depend on the nightly index diff being correct; mitigated by the M1 gate.
- A model drafting lessons can be wrong in ways the checks do not catch; mitigated by R-11.

## 9. Out of scope (v0.1)

- The TUI workbench, protocol explorer, key inventory and notebook (terminal v0.2 and later).
- Rule sets beyond correctness (core M3).
- Hosted pieces: model calls, sandboxes, practice servers.

## 10. Approval

| Role | Handle | Date |
|---|---|---|
| Sponsor | veronaimars | |

## Annex A — Basis of stated facts

| Claim | Label | Source |
|---|---|---|
| Supported branches and latest releases | verified | `git ls-remote --tags` on openssl/openssl, 2026-11-07 |
| ~145 `doc/` commits in three months | verified | `git log --since=2026-08-07 -- doc/` on openssl/openssl master, 2026-11-07 |
| `openssl-req.pod.in` 788 → 880 lines, ENGINE options removed | verified | `wc -l` and diff at tags openssl-3.0 and master, 2026-11-07 |
| Old module teaches 1.1.1, bad chain check, RSA-only key match | verified | commands run against the archived module and OpenSSL 3.6.4, 2026-11-07 |
| docs.openssl.org built from the same files | verified | openssl/openssl-docs README, 2026-11-07 |

## Change log

| Version | Date | Change |
|---|---|---|
| v0.1 | 2026-11-07 | first draft: problem, actors, requirements mapped to repo phases |
