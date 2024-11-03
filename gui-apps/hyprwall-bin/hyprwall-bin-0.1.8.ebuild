# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="GUI for setting wallpapers with hyprpaper, swww, swabg, wallutils, and feh"
HOMEPAGE="https://github.com/hyprutils/hyprwall"
SRC_URI="${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="man"
BDEPEND="
	net-misc/wget
"
RDEPEND="
	gui-apps/swww
"

S="${WORKDIR}/hyprwall-${PV}"

pkg_setup() {
	cd ${WORKDIR}
	wget -O hyprwall ${HOMEPAGE}/releases/download/v${PV}/hyprwall
}

src_install() {
	dobin ${WORKDIR}/hyprwall

	insinto /usr/share/icons
	doins ${S}/hyprwall.svg

	insinto /usr/share/applications
	doins ${S}/hyprwall.desktop

	if use man; then
		doman ${S}/man/hyprwall.1
	fi
}
