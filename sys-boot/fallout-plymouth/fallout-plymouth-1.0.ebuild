# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fallout Plymouth theme"
HOMEPAGE="https://store.kde.org/p/1259515"

S="${WORKDIR}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-arch/tar"

S=${WORKDIR}

src_unpack() {
	cd ${WORKDIR}
	cp ${FILESDIR}/fallout.tar .
	tar -xf fallout.tar
}

src_install() {
	cd ${WORKDIR}/fallout

	insinto "/usr/share/plymouth/themes/fallout"
	doins background.png
	doins -r dialog
	doins fallout.plymouth
	doins fallout.script
	doins spinner.png

	insinto "/usr/share/licenses/${PN}"
	doins LICENSE

	dodoc README.md

	elog "Set plymouth theme with \`sudo plymouth-set-default-theme fallout\`."
	elog "Then, update init ramfs. E.g., \`sudo genkernel initramfs\`."
}
