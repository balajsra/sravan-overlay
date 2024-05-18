# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

DESCRIPTION="Graphical application to configure Logitech Wheels"
HOMEPAGE="https://github.com/berarma/oversteer"
EGIT_REPO_URI="https://github.com/berarma/oversteer.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

BDEPEND="dev-build/meson"

RDEPEND="dev-python/pygobject
		 dev-python/pyudev
		 dev-python/libevdev
		 dev-python/pyxdg
		 sys-devel/gettext
		 dev-libs/appstream-glib
		 dev-util/desktop-file-utils
		 x11-libs/gtk+"

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
