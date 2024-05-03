# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Display manager with console UI"
HOMEPAGE="https://github.com/fairyglade/ly"

EGIT_REPO_URI="https://github.com/fairyglade/ly.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/${PN}"

IUSE="systemd"
DEPEND="
	sys-libs/pam
	x11-libs/libxcb
	x11-apps/xauth
"
RDEPEND="
	${DEPEND}
"

inherit git-r3

src_install() {
	if use systemd ; then
		emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" installsystemd || die "make install systemd failed"
		elog "Run \`systemctl enable ly.service\`" to enable ly
	else
		emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" installopenrc || die "make install openrc failed"
		elog "Run \`rc-update add ly\`" to enable ly
	fi
}
