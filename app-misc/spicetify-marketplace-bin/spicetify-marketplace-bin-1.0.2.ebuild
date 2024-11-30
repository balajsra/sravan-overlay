# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Download extensions and themes directly from Spicetify"
HOMEPAGE="https://github.com/spicetify/marketplace"
SRC_URI="
	${HOMEPAGE}/releases/download/v${PV}/marketplace.zip
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"
INSTALLDIR="/opt/spicetify-cli"

DEPEND="
	|| ( app-misc/spicetify-cli app-misc/spicetify-cli-bin )
"

src_install() {
	insinto "${INSTALLDIR}/CustomApps"
	mv marketplace-dist marketplace
	doins -r marketplace
}
