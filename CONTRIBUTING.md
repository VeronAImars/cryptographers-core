# Contributing

Thank you for looking. This page is the whole workflow; nothing is hidden in a wiki.
By participating you agree to the [Code of Conduct](CODE_OF_CONDUCT.md).

## This repository

- Checks and rule sets are files under `rules/`. A check runs the real `openssl` inside the pinned
  release image and reads artifacts, never typed text. Every check cites a manual page and section.
- `corpus/` is never edited by hand; `cryptocore corpus build` regenerates it from the tagged source.
- `pkg/` is what the two products import. A change to its surface needs a design note in
  `docs/design/` first, and lands in a release before either product consumes it.

## Where to start

- **Discussions** for questions, ideas and show-and-tell.
- **Issues** for work with a proving command. Blank issues are off; pick a template.
- Issues labelled `good first issue` are complete, bounded and need no prior context.
  `help wanted` marks work the maintainer would like a hand with.
- Open an issue or a design document (`docs/design/`) before a large change; small fixes can go
  straight to a pull request.

## The gate

One command is the commit gate for this repository and CI runs the same thing:

```
hack/check.sh
```

It fails on any real name, private path, employer or partner name, or money figure, so handles
only. For Go repositories the CI workflow also runs `gofmt -l`, `go vet` and `go build`, and
checks that every unmet phase gate in `hack/acceptance/` still exits non-zero.

## Developer Certificate of Origin

Every commit carries a `Signed-off-by` line with a name and a reachable address (`git commit -s`).
The sign-off certifies you wrote the change or have the right to submit it under the licence
([DCO](DCO)). A pull request with an unsigned commit is not merged; CI checks it.

## Commits and pull requests

[Conventional Commits](https://www.conventionalcommits.org/): `type(scope): summary`, imperative,
lowercase, no trailing period, at most 72 characters. Types: `feat`, `fix`, `docs`, `test`,
`refactor`, `perf`, `build`, `ci`, `chore`, `revert`. The scope is the directory you changed, as
`ls` prints it. One commit does one thing; a subject that needs "and" is two commits.

Pull requests are squash-merged, so the PR title follows the same grammar and becomes the commit
on `main`. The PR template's sections (Summary, Gate, Merge preconditions, Review, Ledger,
Checklist) all stay; write "None." rather than deleting one. "Not run (why)" is an honest verdict;
"should pass" is not.

Every claim in a document or a review is verified (the command named), reported (the source
named) or inferred (from what). Every statement about OpenSSL cites the manual page and section
for the release it is about.

## What happens after you open something

A maintainer reads every issue and pull request. If you offer to take an issue and a maintainer
accepts, it is yours for about a week; if no pull request references it by then it returns to the
open queue and you are told so on the issue. Reviews name the fix and the test that fails before
it; they do not ask you to guess.

## Security

Do not open a public issue for a vulnerability. Use the private advisory form in the Security
tab; see [SECURITY.md](SECURITY.md).
