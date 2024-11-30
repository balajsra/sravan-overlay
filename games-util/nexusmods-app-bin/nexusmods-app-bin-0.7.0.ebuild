# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The future of modding with Nexus Mods"
HOMEPAGE="https://nexus-mods.github.io/NexusMods.App"
SRC_URI="
	https://github.com/Nexus-Mods/NexusMods.App/releases/download/v${PV}/NexusMods.App.x86_64.AppImage -> NexusMods.App
	https://github.com/Nexus-Mods/NexusMods.App/archive/refs/tags/v${PV}.tar.gz -> NexusMods.App.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

DEPEND="
	!games-util/nexusmodsapp
"

BDEPEND="
	sys-apps/sed
"

RDEPEND="
	sys-fs/fuse:0
	x11-misc/xdg-utils
	dev-util/desktop-file-utils
"

S="${WORKDIR}/NexusMods.App-${PV}"

QA_PREBUILT="*"

src_install() {
	cd ${WORKDIR}
	cp "${DISTDIR}/NexusMods.App" NexusMods.App || die
	dobin NexusMods.App

	cd ${S}/src/NexusMods.App
	insinto /usr/share/applications
	sed -i -e 's/${INSTALL_EXEC}/\/usr\/bin\/NexusMods.App/' com.nexusmods.app.desktop
	doins com.nexusmods.app.desktop

	insinto /usr/share/metainfo
	doins com.nexusmods.app.metainfo.xml

	insinto /usr/share/icons/hicolor/scalable/apps
	cp icon.svg com.nexusmods.app.svg || die
	doins com.nexusmods.app.svg
}
