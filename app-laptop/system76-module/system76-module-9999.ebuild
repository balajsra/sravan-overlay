# Copyright 2020-2023 Bryan Gardiner <bog@khumba.net>
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info linux-mod-r1 git-r3

DESCRIPTION="System76 Driver"
HOMEPAGE="https://github.com/pop-os/system76-dkms"

EGIT_REPO_URI="https://github.com/pop-os/system76-dkms.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_SUBMODULES=( '*' )

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

CONFIG_CHECK="
	ACPI_WMI
"

src_compile() {
	local modlist=( "system76=misc" )
	local modargs=( "KERNEL_DIR=${KERNEL_DIR}" )

	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install

	insinto /lib/udev/hwdb.d
	doins lib/udev/hwdb.d/*
}
