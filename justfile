set shell := ["bash", "-c"]

# List just commands by default
default:
    @just --list

[doc('Generates a docker container that replicates "fresh" Gentoo installations
See https://wiki.gentoo.org/wiki/Ebuildtester

NOTE: `--overlay-dir` gets mounted to `/var/lib/overlays/<overlay-name>` inside the container
')]
test-ebuild:
    ebuildtester \
        --portage-dir /var/db/repos/gentoo/ \
        --overlay-dir $(pwd) \
        --rm \
        --update \
        --pull \
        --install-basic-packages \
        --threads $(nproc) \
        --unstable \
        --with-vnc \
        --manual
