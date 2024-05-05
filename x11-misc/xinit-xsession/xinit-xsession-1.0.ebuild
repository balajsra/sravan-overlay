# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Allows ~/.xinitrc to be run as a session from your display manager"
HOMEPAGE="https://aur.archlinux.org/packages/xinit-xsession"

S=${FILESDIR}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin "${FILESDIR}"/xinitrcsession-helper
	insinto /usr/share/xsessions/
	doins "${FILESDIR}"/xinitrc.desktop
}
