# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An open-source cross-platform alternative to AirDrop"
HOMEPAGE="https://localsend.org"
SRC_URI="
	https://github.com/localsend/localsend/releases/download/v${PV}/LocalSend-${PV}-linux-x86-64.AppImage -> ${P}.AppImage
	https://github.com/localsend/localsend/releases/download/v${PV}/LocalSend-${PV}-linux-x86-64.deb -> ${P}.deb
"

LICENSE="Apache-2.0"
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
	cp ${DISTDIR}/${P}.AppImage localsend_app || die
	dobin localsend_app

	cd ${S}
	tar -xf data.tar.xz

	cd ${S}/usr/share/applications
	insinto /usr/share/applications
	doins localsend_app.desktop

	cd ${S}/usr/share/icons/hicolor/128x128/apps
	insinto /usr/share/icons/hicolor/128x128/apps
	doins localsend_app.png

	cd ${S}/usr/share/icons/hicolor/256x256/apps
	insinto /usr/share/icons/hicolor/256x256/apps
	doins localsend_app.png
}
