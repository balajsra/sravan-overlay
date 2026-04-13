# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="A Simple Jellyfin frontend built on top of Flutter"
HOMEPAGE="https://github.com/DonutWare/Fladder"
SRC_URI="
	https://github.com/DonutWare/Fladder/releases/download/v${PV}/Fladder-Linux-${PV}.AppImage -> ${P}.AppImage
	https://github.com/DonutWare/Fladder/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

S="${WORKDIR}/Fladder-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-fs/fuse:0
	media-video/mpv[libmpv]
"

QA_PREBUILT="*"

src_install() {
	# Binary
	cd "${WORKDIR}"
	newbin "${DISTDIR}/${P}.AppImage" fladder

	# Icon
	cd "${S}/icons/"
	newicon --size scalable fladder_icon.svg fladder.svg

	# Desktop Entry
	make_desktop_entry "fladder" "Fladder" "fladder" "Video;AudioVideo"
}
