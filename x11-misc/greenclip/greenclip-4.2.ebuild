# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="Simple clipboard manager to be integrated with rofi - Static binary available"
HOMEPAGE="https://github.com/erebe/greenclip"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

IUSE="systemd"
DEPEND="
	net-misc/wget
"
RDEPEND="
	x11-misc/rofi
"

S=${WORKDIR}

pkg_setup() {
	cd ${WORKDIR}
	wget -O greenclip https://github.com/erebe/greenclip/releases/download/v${PV}/greenclip-v${PV}
}

src_compile() {
	einfo "Skipping compile step"
}

src_install() {
	if use systemd ; then
		systemd_douserunit "${FILESDIR}"/greenclip.service

		elog "Run \`systemctl --user enable --now greenclip.service\` to enable greenclip systemd user service."
	fi

	dobin greenclip
}
