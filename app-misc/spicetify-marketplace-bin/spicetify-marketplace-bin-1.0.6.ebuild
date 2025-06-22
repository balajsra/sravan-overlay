# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Download extensions and themes directly from Spicetify"
HOMEPAGE="https://github.com/spicetify/marketplace"
SRC_URI="
	https://github.com/spicetify/marketplace/releases/download/v${PV}/marketplace.zip -> ${P}.zip
"

S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

INSTALLDIR="/opt/spicetify-cli"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	app-misc/spicetify-cli-bin
"

src_install() {
	insinto "${INSTALLDIR}/CustomApps"
	mv marketplace-dist marketplace
	doins -r marketplace
}
