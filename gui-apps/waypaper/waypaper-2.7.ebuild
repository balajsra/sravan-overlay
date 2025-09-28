# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="GUI wallpaper manager for Wayland and Xorg Linux systems"
HOMEPAGE="https://anufrievroman.gitbook.io/waypaper"
SRC_URI="https://github.com/anufrievroman/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	sys-apps/sed
"

# [wallutils](https://github.com/xyproto/wallutils) is another option,
# but no ebuild exists yet
RDEPEND="
	|| (
	   gui-apps/swww
	   gui-apps/swaybg
	   media-gfx/feh
	   gui-apps/hyprpaper
	   gui-apps/mpvpaper
	)
	dev-python/pygobject
	dev-python/platformdirs
	dev-python/pillow
	dev-python/imageio
	dev-python/imageio-ffmpeg
	dev-python/screeninfo
"
