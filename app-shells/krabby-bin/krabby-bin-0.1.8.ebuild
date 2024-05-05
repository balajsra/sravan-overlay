# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Print pokemon sprites in your terminal"
HOMEPAGE="https://github.com/yannjor/krabby"
SRC_URI="https://github.com/yannjor/krabby/releases/download/v${PV}/krabby-${PV}-x86_64.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S=${WORKDIR}

src_install() {
	dobin krabby
}
