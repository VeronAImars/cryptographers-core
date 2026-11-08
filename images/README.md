# Images

One directory per supported OpenSSL release, each with a `Containerfile` that builds `openssl`
from the tagged source. `openssl version` inside the image must print the pinned release.
Populated in M0.1 (3.5 and 4.1 first). Both products run their checks inside these images.
