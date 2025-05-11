# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Next-Generation of Chiaki (the open-source remote play client for PlayStation)"
HOMEPAGE="https://streetpea.github.io/chiaki-ng"
SRC_URI="
	https://github.com/streetpea/chiaki-ng/releases/download/v${PV}/chiaki-ng.AppImage_x86_64 -> ${P}.AppImage
	https://github.com/streetpea/chiaki-ng/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

S="${WORKDIR}/chiaki-ng-${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-fs/fuse:0
	media-libs/libva
	dev-util/vulkan-headers
	dev-libs/hidapi
	media-video/pipewire
"

QA_PREBUILT="*"

src_install() {
	# Binary
	cd "${WORKDIR}"
	newbin "${DISTDIR}/${P}.AppImage" chiaki

	# Icon
	cd "${S}/gui/res"
	doicon --size scalable chiaking.svg

	# Desktop Entry
	cd "${S}/gui"
	domenu chiaking.desktop
}
