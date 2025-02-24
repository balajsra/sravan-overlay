# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="isd (interactive systemd) - a better way to work with systemd units"
HOMEPAGE="https://isd-project.github.io/isd"
SRC_URI="
	https://github.com/isd-project/isd/releases/download/v${PV}/isd.x86_64-linux.AppImage -> ${P}.AppImage
	https://github.com/isd-project/isd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-fs/fuse:0
"

S="${WORKDIR}/isd-${PV}"

QA_PREBUILT="*"

src_install() {
	cd ${WORKDIR}
	cp ${DISTDIR}/${P}.AppImage isd || die
	dobin isd

	cd ${S}/share/icons/hicolor/512x512/apps
	insinto /usr/share/icons/hicolor/512x512/apps
	doins isd.png

	cd ${S}/share/applications
	insinto /usr/share/applications
	doins isd.desktop
}
