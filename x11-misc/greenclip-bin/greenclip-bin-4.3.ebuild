# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="Simple clipboard manager to be integrated with rofi - Static binary available"
HOMEPAGE="https://github.com/erebe/greenclip"
SRC_URI="https://github.com/erebe/greenclip/releases/download/v${PV}/greenclip-v${PV} -> ${P}"

S="${WORKDIR}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="systemd"
RDEPEND="
	x11-misc/rofi
"

QA_PREBUILT="*"

src_compile() {
	einfo "Skipping compile step"
}

src_install() {
	if use systemd ; then
		systemd_douserunit "${FILESDIR}"/greenclip.service

		elog "Run \`systemctl --user enable --now greenclip.service\` to enable greenclip systemd user service."
	fi

	cp "${DISTDIR}/${P}" greenclip || die
	dobin greenclip
}
