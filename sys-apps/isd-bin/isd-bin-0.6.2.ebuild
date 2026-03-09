# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="isd (interactive systemd) - a better way to work with systemd units"
HOMEPAGE="https://kainctl.github.io/isd"
SRC_URI="
	https://github.com/kainctl/isd/releases/download/v${PV}/isd.x86_64-linux.AppImage -> ${P}.AppImage
	https://github.com/kainctl/isd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

S="${WORKDIR}/isd-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-fs/fuse:0
"

QA_PREBUILT="*"

src_install() {
	# Binary
	cd "${WORKDIR}"
	newbin "${DISTDIR}/${P}.AppImage" isd

	# Icon
	cd "${S}/share/icons/hicolor/512x512/apps"
	doicon --size 512 isd.png

	# Desktop Entry
	cd "${S}/share/applications"
	domenu isd.desktop
}
