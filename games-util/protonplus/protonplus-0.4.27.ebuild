# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vala

DESCRIPTION="A modern compatibility tools manager for Linux"
HOMEPAGE="https://github.com/Vysp3r/protonplus"
SRC_URI="
	https://github.com/Vysp3r/ProtonPlus/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

S="${WORKDIR}/ProtonPlus-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-build/ninja
	>=dev-build/meson-0.62.0
	>=gui-libs/gtk-4
	>=gui-libs/libadwaita-1.5
	dev-libs/json-glib
	net-libs/libsoup
	app-arch/libarchive
	dev-util/desktop-file-utils
	dev-libs/libgee
	dev-libs/vala-common
"

BUILD_DIR="build-native"

src_compile() {
	vala_setup

	cd "${S}"
	meson "${BUILD_DIR}" --wipe --prefix="${D}/usr"

	cd "${S}/${BUILD_DIR}"
	ninja
}

src_install() {
	cd "${S}/${BUILD_DIR}"
	ninja install
}
