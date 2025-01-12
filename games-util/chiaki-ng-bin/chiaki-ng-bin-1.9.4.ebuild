# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Next-Generation of Chiaki (the open-source remote play client for PlayStation)"
HOMEPAGE="https://streetpea.github.io/chiaki-ng"
SRC_URI="
	https://github.com/streetpea/chiaki-ng/releases/download/v${PV}/chiaki-ng.AppImage_x86_64
	https://github.com/streetpea/chiaki-ng/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

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

S="${WORKDIR}/chiaki-ng-${PV}"

QA_PREBUILT="*"

src_install() {
	cd ${WORKDIR}
	cp ${DISTDIR}/chiaki-ng.AppImage_x86_64 chiaki || die
	dobin chiaki

	cd ${S}/gui
	insinto /usr/share/icons/hicolor/scalable/apps
	doins res/chiaking.svg

	insinto /usr/share/applications
	doins chiaking.desktop
}
