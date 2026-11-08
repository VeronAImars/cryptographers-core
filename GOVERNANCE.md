# Governance

> **Status: bootstrapping.** the cryptographer's core has a single founding maintainer. This document describes
> the model the project grows into; the thresholds below become operative as the maintainer
> count grows. [MAINTAINERS.md](MAINTAINERS.md) reflects the current reality.

## Roles

- **Contributor**: anyone who submits a contribution (code, docs, issues, reviews). The only
  requirement is the [DCO](DCO) sign-off.
- **Reviewer**: a contributor with a track record who reviews pull requests in an area. Reviews
  are advisory until a maintainer approves.
- **Maintainer**: holds merge rights and release responsibility, listed in
  [MAINTAINERS.md](MAINTAINERS.md). Added by the existing maintainers for sustained, high-quality
  contribution.

## Decision making

- **Routine changes** merge by lazy consensus: one maintainer approval and no unresolved objection.
- **Substantial or architectural changes** get a design document in `docs/design/` reviewed by
  pull request before the implementation lands; decisions that bind the project get a record in
  `docs/decisions/`.
- **Disagreements** are resolved by discussion; failing that, a simple majority of maintainers.

## Changes to governance and the maintainer set

Adding or removing a maintainer, or changing this document, requires two-thirds of the current
maintainers. With one maintainer that threshold is met trivially; it becomes meaningful as the
set grows.

## Code of Conduct

All participation is governed by the [Code of Conduct](CODE_OF_CONDUCT.md).
