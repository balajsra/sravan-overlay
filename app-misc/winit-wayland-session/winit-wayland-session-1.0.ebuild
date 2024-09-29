# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Allows ~/.winitrc to be run as a session from your display manager"

S=${FILESDIR}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin "${FILESDIR}"/winitrcsession-helper
	insinto /usr/share/wayland-sessions/
	doins "${FILESDIR}"/winitrc.desktop
}
