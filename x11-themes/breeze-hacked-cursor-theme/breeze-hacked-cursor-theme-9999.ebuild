# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Source overlay: https://github.com/BlueManCZ/edgets

EAPI=7
inherit git-r3 xdg

DESCRIPTION="Breeze cursor theme with hacked style"
HOMEPAGE="https://github.com/codejamninja/breeze-hacked-cursor-theme"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"

DEPEND="media-gfx/inkscape
	x11-apps/xcursorgen"

RDEPEND="${DEPEND}"

src_compile() {
	./build.sh
}

src_install() {
	insinto "/usr/share/icons/${PN}"
	doins -r "Breeze_Hacked/"*
}
