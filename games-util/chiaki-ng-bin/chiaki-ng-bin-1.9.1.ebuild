# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Next-Generation of Chiaki (the open-source remote play client for PlayStation)"
HOMEPAGE="https://github.com/streetpea/chiaki-ng"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/chiaki-ng.AppImage.zip"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-fs/fuse:0
	media-libs/libva
	dev-util/vulkan-headers
	dev-libs/hidapi
"

S=${WORKDIR}

QA_PREBUILT="*"

src_install() {
	cp chiaki-ng.AppImage chiaki-ng || die
	dobin chiaki-ng

	insinto /usr/share/icons/hicolor/scalable/apps
	doins ${FILESDIR}/chiaking.svg

	insinto /usr/share/applications
	doins ${FILESDIR}/chiaking.desktop
}
