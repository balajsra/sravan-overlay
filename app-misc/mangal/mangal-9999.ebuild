# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Adapted from https://github.com/leycec/raiagent/blob/master/app-misc/mangal/mangal-9999.ebuild

EAPI=8

inherit go-module

DESCRIPTION="The most advanced (yet simple) CLI manga downloader"
HOMEPAGE="https://github.com/metafates/mangal"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="
	bash
	fish
	zsh
"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/metafates/mangal.git"
	EGIT_BRANCH="main"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/metafates/mangal/archive/refs/tags/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

src_compile() {
	ego build -mod=vendor .
	# emake BUILD_FLAGS="-mod=vendor" build
}

src_install() {
	if use zsh; then
		insinto "/usr/share/zsh/vendor-completions"
		cp zsh/mangal.zsh zsh/_mangal
		doins zsh/_mangal
	fi

	if use fish; then
		insinto "/usr/share/fish/completions"
		doins fish/mangal.fish
	fi

	if use bash; then
		insinto "/usr/share/bash-completion/completions"
		cp bash/mangal.bash bash/mangal
		doins bash/mangal
	fi

	dobin ${PN}
	einstalldocs
}
