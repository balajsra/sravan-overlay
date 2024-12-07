#!/usr/bin/env sh

# Generates a docker container that replicates "fresh" Gentoo installations
# See https://wiki.gentoo.org/wiki/Ebuildtester
#
# This script sets some baseline arguments, but additional arguments can be
# passed into the script as if you were using the `ebuildtester` directly
#
# NOTE: `--overlay-dir` gets mounted to `/var/lib/overlays/<overlay-name>`
#       inside the container

ebuildtester \
    --portage-dir /var/db/repos/gentoo/ \
    --overlay-dir $(git rev-parse --show-toplevel) \
    --rm \
    --update \
    --pull \
    --install-basic-packages \
    --threads $(nproc) \
    --unstable \
    --with-vnc \
    --manual ${@}
