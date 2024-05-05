# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A dwm module for polybar"
HOMEPAGE="https://github.com/mihirlad55/polybar-dwm-module"

EGIT_REPO_URI="https://github.com/mihirlad55/polybar-dwm-module.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}"

DEPEND="
	x11-libs/cairo
	x11-libs/xcb-util-image
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
	x11-libs/xcb-util-cursor
	media-libs/alsa-lib
	media-libs/libpulse
	media-libs/libmpdclient
	dev-libs/libnl
	dev-libs/jsoncpp
"
RDEPEND="
	${DEPEND}
"

inherit git-r3
inherit cmake
