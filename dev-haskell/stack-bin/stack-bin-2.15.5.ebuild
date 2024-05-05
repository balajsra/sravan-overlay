# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Haskell Tool Stack"
HOMEPAGE="https://docs.haskellstack.org/en/stable"
SRC_URI="https://github.com/commercialhaskell/stack/releases/download/v${PV}/stack-${PV}-linux-x86_64.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/stack-${PV}-linux-x86_64"

DEPEND=""
RDEPEND=${DEPEND}

src_install() {
	dobin stack
}
