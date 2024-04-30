# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A notification daemon and center"
HOMEPAGE="https://github.com/phuhl/linux_notification_center"
SRC_URI="https://github.com/phuhl/linux_notification_center/archive/refs/tags/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

S=${WORKDIR}/linux_notification_center-${PV}

IUSE="systemd dbus"
DEPEND="
	dev-libs/gobject-introspection
	gui-libs/gtk
	net-misc/wget
"
RDEPEND="
	dev-python/notify-send-py
"

pkg_setup() {
	cd ${WORKDIR}
	wget https://github.com/phuhl/linux_notification_center/releases/download/${PV}/deadd-notification-center
}

src_prepare() {
	eapply_user
	mkdir -p ${S}/.out
	mv ${WORKDIR}/deadd-notification-center ${S}/.out/deadd-notification-center
}

src_compile() {
	einfo "Skipping compile step"
}

src_install() {
	if use systemd && use dbus ; then
		make service || die "make service failed"
	fi

	make DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install || die "make install failed"
}
