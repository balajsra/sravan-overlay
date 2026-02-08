# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Codespaces but open-source, client-only and unopinionated"
HOMEPAGE="https://devpod.sh/"
SRC_URI="https://github.com/loft-sh/devpod/releases/download/v${PV}/devpod-linux-amd64 -> ${P}"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"
QA_PRESTRIPPED="/usr/bin/devpod"

# DevPod CLI is a statically linked Go binary,
# but it needs docker or podman at runtime.
RDEPEND="|| ( app-containers/docker app-containers/podman )"

src_install() {
	newbin "${DISTDIR}/${P}" devpod
}
