# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Electron wrapper around the Pocket Casts web app with support for MPRIS (media controls)"
HOMEPAGE="https://github.com/fuadsaud/pocket-casts-linux"
SRC_URI="
	${HOMEPAGE}/releases/download/v${PV}/pocket-casts-linux-${PV}-x86_64.AppImage -> ${P}.AppImage
	${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-fs/fuse:0
"

S="${WORKDIR}/pocket-casts-linux-${PV}"

QA_PREBUILT="*"

src_install() {
	cp "${DISTDIR}/${P}.AppImage" pocket-casts || die
	dobin pocket-casts

	insinto /usr/share/applications
	doins ${FILESDIR}/pocket-casts.desktop

	cd ${S}/resources/icon
	insinto /usr/share/icons/hicolor/scalable/apps
	cp src.svg pocket-casts.svg || die
	doins pocket-casts.svg
}
