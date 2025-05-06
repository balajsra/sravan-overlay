# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="A modern self-hosted music player"
HOMEPAGE="https://github.com/jeffvli/feishin"
SRC_URI="
	https://github.com/jeffvli/feishin/releases/download/v${PV}/Feishin-${PV}-linux-x86_64.AppImage -> ${P}.AppImage
	https://github.com/jeffvli/feishin/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

S="${WORKDIR}/feishin-${PV}"

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
	cp "${DISTDIR}/${P}.AppImage" feishin || die
	dobin feishin

	# Icon
	cd "${S}/assets/icons"
	newicon --size 32 32x32.png feishin.png
	newicon --size 64 64x64.png feishin.png
	newicon --size 128 128x128.png feishin.png
	newicon --size 256 256x256.png feishin.png
	newicon --size 512 512x512.png feishin.png
	newicon --size 1024 1024x1024.png feishin.png

	# Desktop Entry
	make_desktop_entry "feishin" "Feishin" "feishin" "Audio;AudioVideo"
}
