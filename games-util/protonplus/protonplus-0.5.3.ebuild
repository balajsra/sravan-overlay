# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vala

DESCRIPTION="A modern compatibility tools manager for Linux"
HOMEPAGE="https://github.com/Vysp3r/protonplus"

# Convert W.X.Y.Z to W.X.Y-Z in SRC_URI
if [[ ${PV} =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	MODIFIED_PACKAGE_VERSION=${PV%.*}-${PV##*.}
	SRC_URI="
		https://github.com/Vysp3r/ProtonPlus/archive/refs/tags/v${MODIFIED_PACKAGE_VERSION}.tar.gz -> ${P}.tar.gz
	"
	S="${WORKDIR}/ProtonPlus-${MODIFIED_PACKAGE_VERSION}"
else
	SRC_URI="
		https://github.com/Vysp3r/ProtonPlus/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	"
	S="${WORKDIR}/ProtonPlus-${PV}"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-build/ninja
	>=dev-build/meson-0.62.0
	>=gui-libs/gtk-4
	>=gui-libs/libadwaita-1.5
	dev-libs/json-glib
	dev-libs/glib
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

	cd "${D}"
	shopt -s globstar
	rm **/*.cache **/*.compiled
}

pkg_postinst() {
	elog "Recompiling glib schemas after package install"
	glib-compile-schemas /usr/share/glib-2.0/schemas/
}

pkg_postrm() {
	elog "Recompiling glib schemas after package removal"
	glib-compile-schemas /usr/share/glib-2.0/schemas/
}
