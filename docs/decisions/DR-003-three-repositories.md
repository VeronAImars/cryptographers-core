# DR-003 — Three repositories, one program

**Date:** 2026-11-07. **Status:** decided. **Maintainer:** veronaimars.

## Question

How is the program split across repositories?

## Context

- Two audiences read one name as two different things: people learning want lessons that grade
  them; people operating want findings about artifacts they bring.
- Both need the same corpus, option diff, checks and sandbox; neither needs the other.
- A workshop dedicated to OpenSSL, built on its documentation at the project's encouragement,
  carries its name.

## Decision

- `cryptographers-core` (this one): the engine. Corpus, diff, images, checks, rule sets, the Go API. No UI.
- `openssl-workshop`: lessons, the generator, the static site, the drift re-run.
- `cryptographers-terminal`: the inspection workbench for operators. It grades nothing.
- The products import the core as a Go module and pin a release. The core never imports a product.
- The program PRD lives in `cryptographers-core/docs/PRD.md`; each repository holds its own decisions.
  There is no separate program repository.

## Consequences

- Build order is core, workshop, terminal: the first two retire the earlier public teaching link, the
  third needs both.
- A change both products need lands in the core first and is released before either consumes it.
