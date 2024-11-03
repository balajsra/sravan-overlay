# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Send IPC messages to dwl"
HOMEPAGE="https://codeberg.org/notchoc/dwlmsg"

EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="main"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}"

inherit git-r3

BDEPEND="
	dev-libs/wayland
"
RDEPEND="
	gui-wm/dwl
"

src_compile() {
	emake all
}

src_install() {
	dobin dwlmsg
}
