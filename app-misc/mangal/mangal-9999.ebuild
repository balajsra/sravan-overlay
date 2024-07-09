# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Adapted from https://github.com/leycec/raiagent/blob/master/app-misc/mangal/mangal-9999.ebuild

EAPI=8
inherit git-r3 go-module

DESCRIPTION="The most advanced (yet simple) CLI manga downloader"
HOMEPAGE="https://github.com/metafates/mangal"

EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="main"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

S="${WORKDIR}/${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="bash fish zsh"
RDEPEND="
	bash? ( app-shells/bash )
	fish? ( app-shells/fish )
	zsh? ( app-shells/zsh )
"

src_unpack() {
	git-r3_src_unpack
	go-module_src_unpack
}

src_compile() {
	ego build
}

src_install() {
	if use zsh; then
		insinto "/usr/share/zsh/vendor-completions"
		cp completions/mangal.zsh completions/_mangal
		doins completions/_mangal
	fi

	if use fish; then
		insinto "/usr/share/fish/completions"
		doins completions/mangal.fish
	fi

	if use bash; then
		insinto "/usr/share/bash-completion/completions"
		cp completions/mangal.bash completions/mangal
		doins completions/mangal
	fi

	dobin ${PN}
	einstalldocs
}
