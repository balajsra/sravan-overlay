# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3 systemd

DESCRIPTION="Synchronize snapper snapshots to a borg repository"
HOMEPAGE="https://github.com/enzingerm/snapborg"

EGIT_REPO_URI="https://github.com/enzingerm/snapborg.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

S="${WORKDIR}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="systemd"
RDEPEND="
	app-backup/borgbackup
	app-backup/snapper
	dev-python/pyyaml
"
DEPEND="${RDEPEND}"

python_install() {
	distutils-r1_python_install

	if use systemd ; then
		systemd_dounit "${S}/usr/lib/systemd/system/snapborg-backup-all-daily.timer"
		systemd_dounit "${S}/usr/lib/systemd/system/snapborg-backup-all-hourly.timer"
		systemd_dounit "${S}/usr/lib/systemd/system/snapborg-backup-all.service"
		systemd_dounit "${S}/usr/lib/systemd/system/snapborg-backup-daily@.timer"
		systemd_dounit "${S}/usr/lib/systemd/system/snapborg-backup-hourly@.timer"
		systemd_dounit "${S}/usr/lib/systemd/system/snapborg-backup@.service"

		elog "Run \`systemctl enable --now snapborg-backup-all-<frequency>.timer\` to enable regular backups (hourly or daily) for all configs."
		elog "Run \`systemctl enable --now snapborg-backup-<frequency>@<config-name>.timer\` enable regular backups (hourly or daily) for a specific config."
	fi

	insinto /etc
	doins "${S}/etc/snapborg.yaml"
	elog "Configure snapborg by editing \`/etc/snapborg.yaml\`."
}
