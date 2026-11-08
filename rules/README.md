# Rules

Checks and rule sets as files, one directory per rule set: `rules/<set>/<slug>.yaml`.
`rules/correctness/` holds the checks that say whether an artifact is what it claims to be;
named rule sets (FIPS 140-3, NIST SP 800-52, CA/Browser Forum baseline, Mozilla) arrive in M3.

A check runs a real OpenSSL command inside the pinned container and compares the result; it
reads the artifacts it is handed, never typed text. Schema (draft, fixed in M0.3):

```yaml
id: correctness/chain
versions: ["3.5", "4.1"]
cites:
  - page: openssl-verify        # man1 page name
    section: OPTIONS
    option: -untrusted
inputs: [root.pem, int.pem, leaf.pem]
checks:
  - run: openssl verify -CAfile root.pem -untrusted int.pem leaf.pem
    expect: "leaf.pem: OK"
  - run: openssl verify -CAfile root.pem leaf.pem
    expect_fail: true
```

`expect` is a substring of stdout; `expect_fail` asserts a non-zero exit. Richer artifact
assertions (subject, key type, extensions) arrive with M2.
