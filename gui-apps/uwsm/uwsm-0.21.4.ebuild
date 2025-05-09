# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Based on https://data.gpo.zugaina.org/djs_overlay/gui-apps/uwsm/

EAPI=8

inherit meson

DESCRIPTION="Universal Wayland Session Manager"
HOMEPAGE="https://github.com/Vladimir-csp/uwsm"
SRC_URI="https://github.com/Vladimir-csp/uwsm/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-build/meson
	dev-build/ninja
	sys-devel/gcc
"
RDEPEND="${DEPEND}"

MESONARGS=(
	-Duuctl=enabled
	-Dfumon=enabled
	-Duwsm-app=enabled
	-Ddocdir=/usr/share/doc/${PF}
)

src_configure() {
	meson_src_configure ${MESONARGS[@]}
}

src_install() {
	meson_src_install
}
