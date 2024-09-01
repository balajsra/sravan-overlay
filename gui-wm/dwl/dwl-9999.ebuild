# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Based on https://data.gpo.zugaina.org/gentoo/gui-wm/dwl/dwl-9999.ebuild

EAPI=8

DESCRIPTION="dwm for Wayland"
HOMEPAGE="https://gitea.sravanbalaji.com/sravan/dwl"

EGIT_REPO_URI="https://gitea.sravanbalaji.com/sravan/dwl.git"
EGIT_BRANCH="main"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

LICENSE="CC0-1.0 GPL-3+ MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="X"

S="${WORKDIR}/${PN}"

inherit git-r3 toolchain-funcs

COMMON_DEPEND="
	gui-libs/wlroots:=[libinput,session,X?]
	dev-libs/libinput:=
	dev-libs/wayland
	x11-libs/libxkbcommon
	X? (
		x11-libs/libxcb:=
		x11-libs/xcb-util-wm
	)
"
RDEPEND="
	${COMMON_DEPEND}
	X? (
		x11-base/xwayland
	)
	gui-apps/kanshi
	gui-apps/wdisplays
	gui-apps/wofi
	gui-apps/wl-clipboard
	x11-misc/dunst:=[wayland]
	x11-terms/kitty:=[wayland]
	x11-terms/kitty-shell-integration
	x11-terms/kitty-terminfo
	media-gfx/flameshot:=[wayland]
	gui-apps/swayidle
	gui-apps/swaylock-effects
	gui-apps/swaybg
"
# uses <linux/input-event-codes.h>
DEPEND="
	${COMMON_DEPEND}
	sys-kernel/linux-headers
"
BDEPEND="
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	virtual/pkgconfig
"

src_compile() {
	emake PKG_CONFIG="$(tc-getPKG_CONFIG)" CC="$(tc-getCC)" \
		XWAYLAND="$(usev X -DXWAYLAND)" XLIBS="$(usev X "xcb xcb-icccm")" dwl
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc CHANGELOG.md README.md
}
