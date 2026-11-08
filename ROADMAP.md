# Roadmap

Grouped by minor version. What a version contains is the promise; when it ships is not. Delivery
state lives in `docs/PHASES.md` and is proven by `hack/acceptance/phases.json`; this file never
claims more than the ledger does.

One Go module and one binary, `cryptocore`. The corpus is OpenSSL's own `doc/` tree copied at each
release tag and indexed to JSON. Checks are files that run the real `openssl` inside a pinned
release image. Products import the packages; nothing here draws a screen.

## v0.1 — the three answers for one command

- M0 walking skeleton: two release images, the corpus and diff for one command, one check run in a
  container, all from a fresh clone
- M1 the whole corpus: man1, man5 and man7 for every supported release, each binary's `-help`
  captured, the index rebuilt nightly and published as a release asset
- M2 checks as files and a stable API: `pkg/corpus`, `pkg/check`, `pkg/sandbox` the products
  import; the correctness rule set

## v0.2 — rule sets and the library manual

- M3 named rule sets beyond correctness: FIPS 140-3, NIST SP 800-52, CA/Browser Forum baseline,
  Mozilla; each finding cites the rule and the manual section
- M4 man3 indexed (the library manual), for the terminal's explain on library-level artifacts

## Not yet assigned

- CHANGES.md indexing per release, mapped to the options it touched
- a link map onto docs.openssl.org, which is built from the same files
- OpenSSL compiled to WebAssembly as a sandbox the browser products can use
