# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo

DESCRIPTION="Automatic Language-Agnostic Subtitle Synchronization"
HOMEPAGE="https://github.com/kaegi/alass"
SRC_URI="${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${P}"

RDEPEND="
	media-video/ffmpeg
"
