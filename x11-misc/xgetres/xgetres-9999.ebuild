# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple utility which prints the value of an X resource"
HOMEPAGE="https://github.com/tamirzb/xgetres"

EGIT_REPO_URI="https://github.com/tamirzb/xgetres.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}"

DEPEND="
	x11-libs/libX11
"
RDEPEND="
	${DEPEND}
"

inherit git-r3

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" || die "make failed"
	dobin xgetres
	doman xgetres.1
}
