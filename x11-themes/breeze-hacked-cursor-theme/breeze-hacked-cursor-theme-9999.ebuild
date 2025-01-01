# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Source overlay: https://github.com/BlueManCZ/edgets

EAPI=7
inherit git-r3 xdg

DESCRIPTION="Breeze cursor theme with hacked style"
HOMEPAGE="https://github.com/codejamninja/breeze-hacked-cursor-theme"
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="main"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

LICENSE="GPL-2"
SLOT="0"
IUSE="^^(
	default-cyan
	dracula-cyan
	dracula-green
	dracula-orange
	dracula-pink
	dracula-purple
	dracula-red
	dracula-yellow
)"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}"

BDEPEND="
	media-gfx/inkscape
	x11-apps/xcursorgen
"

src_prepare() {
	default

	# Recolor Options
	# --accent-color: Recolor the cyan accents
	# --base-color: Recolor the dark background
	# --border-color: Recolor the grey border
	# --logo-color: Recolor X in the X logo cursor and the W in the Wayland logo cursor

	if use default-cyan; then
		./recolor-cursor.sh \
			--accent-color "#79f5f3" \
			--base-color "#192629" \
			--border-color "#666666" \
			--logo-color "#ffffff"
	elif use dracula-cyan; then
		./recolor-cursor.sh \
			--accent-color "#8be9fd" \
			--base-color "#282a36" \
			--border-color "#44475a" \
			--logo-color "#f8f8f2"
	elif use dracula-green; then
		./recolor-cursor.sh \
			--accent-color "#50fa7b" \
			--base-color "#282a36" \
			--border-color "#44475a" \
			--logo-color "#f8f8f2"
	elif use dracula-orange; then
		./recolor-cursor.sh \
			--accent-color "#ffb86c" \
			--base-color "#282a36" \
			--border-color "#44475a" \
			--logo-color "#f8f8f2"
	elif use dracula-pink; then
		./recolor-cursor.sh \
			--accent-color "#ff79c6" \
			--base-color "#282a36" \
			--border-color "#44475a" \
			--logo-color "#f8f8f2"
	elif use dracula-purple; then
		./recolor-cursor.sh \
			--accent-color "#bd93f9" \
			--base-color "#282a36" \
			--border-color "#44475a" \
			--logo-color "#f8f8f2"
	elif use dracula-red; then
		./recolor-cursor.sh \
			--accent-color "#ff5555	" \
			--base-color "#282a36" \
			--border-color "#44475a" \
			--logo-color "#f8f8f2"
	elif use dracula-yellow; then
		./recolor-cursor.sh \
			--accent-color "#f1fa8c	" \
			--base-color "#282a36" \
			--border-color "#44475a" \
			--logo-color "#f8f8f2"
	fi
}

src_compile() {
	./build.sh
}

src_install() {
	insinto "/usr/share/icons/${PN}"
	doins -r "Breeze_Hacked/"*
}
