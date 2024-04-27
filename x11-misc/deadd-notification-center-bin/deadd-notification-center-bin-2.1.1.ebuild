# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A notification daemon and center"
HOMEPAGE="https://github.com/phuhl/linux_notification_center"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

S=${WORKDIR}

DEPEND="
	net-misc/wget
"

pkg_setup() {
	cd ${S}
	wget https://github.com/phuhl/linux_notification_center/releases/download/${PV}/deadd-notification-center
}

src_install() {
	dobin deadd-notification-center
}
