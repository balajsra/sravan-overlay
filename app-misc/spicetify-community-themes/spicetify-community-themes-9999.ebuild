# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A community-driven collection of themes for customizing Spotify through Spicetify"
HOMEPAGE="https://github.com/spicetify/spicetify-themes"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="man"

S="${WORKDIR}/${P}"
INSTALLDIR="/opt/spicetify-cli"

DEPEND="
	|| ( app-misc/spicetify-cli app-misc/spicetify-cli-bin )
"

src_install(){
	insinto "${INSTALLDIR}/Themes"
	doins -r {_Extra,Blossom,BurntSienna,Default,Dreary,Dribbblish,Flow,Matte,Nightlight,Onepunch,SharkBlue,Sleek,StarryNight,text,Turntable,Ziro}
}
