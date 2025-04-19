# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

DESCRIPTION="Graphical application to configure Logitech Wheels"
HOMEPAGE="https://github.com/berarma/oversteer"
SRC_URI="https://github.com/berarma/oversteer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-build/meson"

RDEPEND="dev-python/pygobject
		 dev-python/pyudev
		 dev-python/evdev
		 dev-python/pyxdg
		 dev-python/scipy
		 dev-python/pycairo
		 dev-python/matplotlib
		 sys-devel/gettext
		 dev-libs/appstream-glib
		 dev-util/desktop-file-utils
		 x11-libs/gtk+
"

src_prepare() {
	eapply_user
	sed -i 's/Utility;//' data/org.berarma.Oversteer.desktop.in
}

src_compile() {
	meson build --prefix="/usr"
	ninja -C build
}

src_install() {
	DESTDIR="${D}" ninja -C build install
}
