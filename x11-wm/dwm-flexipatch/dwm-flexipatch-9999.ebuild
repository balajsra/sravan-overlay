# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dynamic Window Manager for X with preprocessor directive patching"
HOMEPAGE="https://gitea.sravanbalaji.com/sravan/dwm-flexipatch"
SRC_URI="https://gitea.sravanbalaji.com/sravan/${PN}/archive/master.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/${PN}"

DEPEND="
	x11-libs/libX11
	x11-libs/libXinerama
	x11-libs/libxcb
	x11-libs/xcb-util
	dev-libs/yajl
	dev-libs/jsoncpp
"
# TODO: Add deadd-notification-center
RDEPEND="
	${DEPEND}
	x11-misc/polybar-dwm-module
	x11-misc/rofi
	x11-terms/kitty
	sys-process/btop
	sys-apps/qdirstat
	sys-apps/gnome-disk-utility
	media-sound/playerctl
	media-sound/pavucontrol
	app-misc/zscroll
"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install || die "make install failed"

	insinto /usr/share/xsessions
	doins dwm.desktop

	dodoc README.org
}
