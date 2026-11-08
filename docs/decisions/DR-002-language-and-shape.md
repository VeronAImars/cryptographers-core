# DR-002 — One Go module; checks as files; real OpenSSL in pinned containers

**Date:** 2026-11-07. **Status:** decided. **Maintainer:** veronaimars.

## Question

What is the core written in, what do products consume, and what runs the cryptography?

## Context

- Two products with different surfaces (a static site and sandbox; a terminal workbench) need the
  same answers from the same sources.
- A check that simulates OpenSSL would drift exactly the way earlier teaching material did.
- Rule sets must be editable by people who do not write Go.

## Decision

- The core is one Go module, `github.com/veronaimars/cryptographers-core`, with one static binary,
  `cryptocore`, no cgo. Products import the packages under `pkg/`; the CLI exists to build the
  corpus and run checks by hand and in CI.
- The corpus is an unmodified sparse copy of `openssl/openssl` `doc/` at each release tag, indexed
  to JSON. The copy is never edited; the index and the checks sit beside it and cite into it.
- Checks and rule sets are YAML files validated by a schema in the binary. Every check cites a
  manual page and section and grades an artifact, never typed text.
- The cryptography is the real `openssl` binary, built from the tagged source inside one container
  image per supported release. The core never re-implements a check OpenSSL can run.
- Milestones are files (`docs/PHASES.md`, `hack/acceptance/`), never GitHub milestones.

## Consequences

- Running a check needs a container runtime (Docker or Podman). A WebAssembly build of OpenSSL
  for browser use is a later, unassigned item.
- Any model sits in the products, reads the index, and explains. It is never in the check path.
