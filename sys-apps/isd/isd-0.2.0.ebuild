# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="isd (interactive systemd) - a better way to work with systemd units"
HOMEPAGE="https://isd-project.github.io/isd"
SRC_URI="https://github.com/isd-project/${PN}/releases/download/v${PV}/${PN}.AppImage -> ${P}.AppImage"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-fs/fuse:0
"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	cd ${WORKDIR}
	cp ${DISTDIR}/${P}.AppImage ${PN} || die
	dobin ${PN}
}
