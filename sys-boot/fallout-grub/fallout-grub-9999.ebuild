# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

DESCRIPTION="Fallout GRUB theme"
HOMEPAGE="https://github.com/shvchk/fallout-grub-theme"

EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

S="${WORKDIR}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	insinto "/usr/share/grub/themes/fallout"
	doins background.png
	doins fixedsys-regular-32.pf2
	doins item_c.png
	doins selected_item_c.png
	doins terminal_box_c.png
	doins theme.txt
	doins -r icons

	insinto "/usr/share/licenses/${PN}"
	doins LICENSE

	dodoc README.md

	elog "In /etc/default/grub, set \`GRUB_THEME=\"/usr/share/grub/themes/fallout/theme.txt\"\`."
	elog "For encrypted root partitions, you will want to copy theme into boot directory. E.g., \`sudo mkdir -p /boot/grub/themes && sudo cp -R /usr/share/grub/themes/fallout /boot/grub/themes/\`."
	elog "Then set \`GRUB_THEME=\"/boot/grub/themes/fallout/theme.txt\"\`"
	elog "Finally, update GRUB with \`sudo grub-mkconfig -o /boot/grub/grub.cfg\`."
}
