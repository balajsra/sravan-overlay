# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Electron wrapper around the Pocket Casts web app with support for MPRIS (media controls)"
HOMEPAGE="https://github.com/fuadsaud/pocket-casts-linux"
SRC_URI="
	https://github.com/fuadsaud/pocket-casts-linux/releases/download/v${PV}/pocket-casts-linux-${PV}-x86_64.AppImage -> ${P}.AppImage
	https://github.com/fuadsaud/pocket-casts-linux/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

S="${WORKDIR}/pocket-casts-linux-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-fs/fuse:0
"

QA_PREBUILT="*"

src_install() {
	# Binary
	cp "${DISTDIR}/${P}.AppImage" pocket-casts || die
	dobin pocket-casts

	# Icon
	cd "${S}/resources/icon"
	newicon --size scalable src.svg pocket-casts.svg

	# Desktop Entry
	make_desktop_entry "pocket-casts" "Pocket Casts" "pocket-casts" "Audio;AudioVideo"
}
