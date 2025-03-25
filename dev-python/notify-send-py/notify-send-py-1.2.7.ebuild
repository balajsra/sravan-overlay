# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

DESCRIPTION="Script and module for sending desktop notifications"
HOMEPAGE="https://github.com/phuhl/notify-send.py"
SRC_URI="https://files.pythonhosted.org/packages/f7/44/edf5578a7e3d79e30505286dab30f29815b26ca33a5a5c8936468e6b406e/notify-send.py-${PV}.tar.gz"

S="${WORKDIR}"/notify-send.py-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/notify2
	dev-python/dbus-python
	dev-python/pygobject
"

python_install() {
	distutils-r1_python_install
	dobin "${FILESDIR}"/notify-send.py
}
