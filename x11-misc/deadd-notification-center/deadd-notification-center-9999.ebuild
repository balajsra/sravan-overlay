# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A notification daemon and center"
HOMEPAGE="https://github.com/phuhl/linux_notification_center"
SRC_URI="https://github.com/phuhl/linux_notification_center/archive/refs/heads/master.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/linux_notification_center-master"

DEPEND="
	dev-haskell/stack-bin
	x11-libs/cairo
	x11-libs/pango
	dev-libs/gobject-introspection
	gui-libs/gtk
"
RDEPEND=${DEPEND}

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install || die "make install failed"
}
