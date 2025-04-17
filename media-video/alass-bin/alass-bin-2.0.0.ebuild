# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Automatic Language-Agnostic Subtitle Synchronization"
HOMEPAGE="https://github.com/kaegi/alass"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/alass-linux64 -> ${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

RDEPEND="
	media-video/ffmpeg
"

QA_PREBUILT="*"

src_install() {
	cd ${WORKDIR}
	cp ${DISTDIR}/${P} alass || die
	dobin alass
}
