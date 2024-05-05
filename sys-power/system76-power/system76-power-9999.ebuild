# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

inherit cargo git-r3

DESCRIPTION="System76 Power Management"
HOMEPAGE="https://github.com/pop-os/system76-power"
SRC_URI="$(cargo_crate_uris ${CRATES})"
EGIT_REPO_URI="https://github.com/pop-os/system76-power.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/${P}"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack(){
	x86_64-pc-linux-gnu-gcc -v
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install(){
	default
}
