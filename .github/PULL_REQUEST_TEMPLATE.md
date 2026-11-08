## Summary

<!-- 1-3 sentences: what changed and why. Link the issue if there is one. -->

## Gate

- **Named gate**: `<the exact command that proves this change>`
- **Verdict**: pass | not run (<why>)
- **Evidence**: failing before, passing after (or, for a new test, what it asserts)
- **`hack/check.sh`**: clean | not run (<why>)

## Merge preconditions

None.

## Review

- **Notes**: <review context, known trade-offs, rejected alternatives>

## Ledger

<!-- docs/PHASES.md, ROADMAP.md or CHANGELOG.md lines riding this PR, or "None." -->
None.

## Checklist

- [ ] Every commit is signed off: `git commit -s` (see [CONTRIBUTING](../CONTRIBUTING.md) and [DCO](../DCO))
- [ ] `hack/check.sh` is clean and CI is green
- [ ] Every claim cites a manual page and section, or a URL
- [ ] Docs updated if behaviour changed
