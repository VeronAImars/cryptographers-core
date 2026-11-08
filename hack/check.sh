#!/bin/sh
# Fails if any tracked file carries a private path, a vault name, a personal email or a money figure,
# or any term in the untracked hack/private-terms list. Run before every commit: hack/check.sh
cd "$(dirname "$0")/.." || exit 1
terms='/Users/|~/Development|~/Documents|DAIVault|proton\.me|@gmail|salary|invoice|\$[1-9][0-9,.]*'
if git grep -n -i -E "$terms" -- . ':!hack/check.sh' ':!LICENSE' ; then
  echo "check: forbidden term found" >&2; exit 1
fi
if [ -f hack/private-terms ]; then
  if git grep -n -i -E -f hack/private-terms -- . ':!hack/' ':!LICENSE' ; then
    echo "check: private term found" >&2; exit 1
  fi
fi
echo "check: clean"
