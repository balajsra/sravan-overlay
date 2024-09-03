# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo git-r3

DESCRIPTION="A deterministic dynamic output configuration tool that automatically detects and configures connected outputs based on a set of profiles"
HOMEPAGE="https://gitlab.com/w0lff/shikane"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="man"

S="${WORKDIR}/${P}"

BDEPEND="
	man? (
		 app-text/pandoc-bin
		 app-arch/gzip
	 )
"

src_unpack(){
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile(){
	cargo_src_compile

	if use man; then
		./scripts/build-docs.sh man
		gzip -d ./build/man/*.gz
	fi
}

src_install(){
	cargo_src_install

	if use man; then
		doman ./build/man/shikane.1
		doman ./build/man/shikane.5
		doman ./build/man/shikanectl.1
	fi
}
