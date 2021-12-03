# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="This is the Cockpit user interface for virtual machines"
HOMEPAGE="http://cockpit-project.org/"

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cockpit-project/cockpit-machines.git"
	KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/cockpit-project/${PN}/releases/download/${PV}/${P}.tar.gz"
fi

LICENSE="LGPL-2.1"
SLOT="0"
IUSE=""

BDEPEND="
"
DEPEND="
"

RDEPEND="${DEPEND}
	>=sys-apps/cockpit-${PV}
	app-emulation/libvirt-dbus
	app-emulation/libvirt[firewalld,policykit]
	app-emulation/virt-manager[policykit]
"

S="${WORKDIR}/${PN}"
