# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="The future of modding with Nexus Mods"
HOMEPAGE="https://nexus-mods.github.io/NexusMods.App"
SRC_URI="
	https://github.com/Nexus-Mods/NexusMods.App/releases/download/v${PV}/NexusMods.App.x86_64.AppImage -> ${P}.AppImage
	https://github.com/Nexus-Mods/NexusMods.App/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

S="${WORKDIR}/NexusMods.App-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

BDEPEND="
	sys-apps/sed
"

RDEPEND="
	sys-fs/fuse:0
	x11-misc/xdg-utils
	dev-util/desktop-file-utils
"

QA_PREBUILT="*"

src_install() {
	cd "${WORKDIR}"
	cp "${DISTDIR}/${P}.AppImage" NexusMods.App || die
	dobin NexusMods.App

	cd "${S}/src/NexusMods.App"
	sed -i -e 's/${INSTALL_EXEC}/\/usr\/bin\/NexusMods.App/' com.nexusmods.app.desktop
	domenu com.nexusmods.app.desktop

	insinto /usr/share/metainfo
	doins com.nexusmods.app.metainfo.xml

	insinto /usr/share/icons/hicolor/scalable/apps
	cp icon.svg com.nexusmods.app.svg || die
	doins com.nexusmods.app.svg
}
