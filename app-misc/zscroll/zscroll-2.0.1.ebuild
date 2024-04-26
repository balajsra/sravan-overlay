# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{1..12} )
inherit distutils-r1
distutils_enable_tests pytest

DESCRIPTION="A text scroller for panels or terminals"
HOMEPAGE="https://github.com/noctuid/zscroll"
SRC_URI="https://github.com/noctuid/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
