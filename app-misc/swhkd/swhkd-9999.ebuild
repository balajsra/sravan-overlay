# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info cargo git-r3 systemd

DESCRIPTION="Simple Wayland HotKey Daemon"
HOMEPAGE="https://github.com/waycrate/swhkd"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="man systemd openrc"

S="${WORKDIR}/${P}"

CONFIG_CHECK="
	INPUT_EVDEV
	INPUT_UINPUT
"

BDEPEND="
	man? (
		 app-text/scdoc
	 )
	 virtual/libudev
	 app-arch/gzip
"

src_unpack(){
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile(){
	emake build
}

src_install(){
	# Man Files
	gzip -d ${S}/docs/*.gz
	doman ${S}/docs/*.1
	doman ${S}/docs/*.5

	# Binaries
	dobin ${S}/target/release/swhkd
	dobin ${S}/target/release/swhks

	if use systemd ; then
		dobin ${FILESDIR}/systemd/hotkeys.sh
		systemd_douserunit ${FILESDIR}/systemd/hotkeys.service

		elog "Add \`%wheel ALL=(ALL:ALL) NOPASSWD: /usr/bin/swhkd\` to \`/etc/sudoers\` to allow \`wheel\` group users to run \`sudo /usr/bin/swhkd\` without asking for a password."
		elog "Run \`systemctl --user enable --now hotkeys.service\` to enable swhkd daemon and server."
	fi

	if use openrc ; then
		doinitd ${FILESDIR}/openrc/swhkd

		elog "Run \`sudo rc-update add swhkd\` to enable swhkd service."
		elog "Add \`swhks\` to startup processes."
	fi
}
