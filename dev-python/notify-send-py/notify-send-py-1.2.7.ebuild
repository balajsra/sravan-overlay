# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="Script and module for sending desktop notifications"
HOMEPAGE="https://github.com/phuhl/notify-send.py"
SRC_URI="https://files.pythonhosted.org/packages/f7/44/edf5578a7e3d79e30505286dab30f29815b26ca33a5a5c8936468e6b406e/notify-send.py-${PV}.tar.gz"

S="${WORKDIR}"/notify-send.py-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	sys-apps/sed
	dev-python/setuptools[${PYTHON_USEDEP}]
"

src_prepare() {
	eapply_user
	sed -i -e 's/from .notify3 import notify3/import notify3.notify3/g' ${S}/notify_send_py/notify_send_py.py || die "Failed to fix module import in script"
	mv ${S}/notify_send_py/notify_send_py.py ${S}/notify_send_py/notify-send.py
}

src_install() {
	distutils-r1_src_install
}
