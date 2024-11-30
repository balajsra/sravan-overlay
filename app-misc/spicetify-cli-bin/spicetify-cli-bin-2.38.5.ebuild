# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Commandline tool to customize Spotify client."
HOMEPAGE="https://spicetify.app/"
SRC_URI="
	https://github.com/spicetify/cli/releases/download/v${PV}/spicetify-${PV}-linux-amd64.tar.gz -> ${P}.tar.gz
"

LICENSE="Apache-2.0 BSD LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"
INSTALLDIR="/opt/spicetify-cli"
IUSE="marketplace"

DEPEND="
	!app-misc/spicetify-cli
"
PDEPEND="
	marketplace? ( app-misc/spicetify-marketplace-bin )
"
RDEPEND="
	>=media-sound/spotify-1.2.14
	<=media-sound/spotify-1.2.48
"

src_install() {
	insinto "${INSTALLDIR}"
	doins -r {css-map.json,CustomApps,Extensions,globals.d.ts,jsHelper,Themes,spicetify}
	newbin - spicetify <<-EOF
	#!/usr/bin/env sh
	exec /opt/spicetify-cli/spicetify \$@
	EOF
	fperms +x "${INSTALLDIR}/spicetify"
}

pkg_postinst() {
	elog "Spicetify requires a Spotify install that it can modify."
	elog "To give read and write permissions to everyone on the system to run the following commands as root."
	elog "# chmod a+wr -R /opt/spotify"
}
