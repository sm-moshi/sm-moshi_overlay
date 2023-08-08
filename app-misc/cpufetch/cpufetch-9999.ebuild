# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs git-r3

DESCRIPTION="Simplistic yet fancy CPU architecture fetching tool"
HOMEPAGE="https://github.com/Dr-Noob/cpufetch"
EGIT_REPO_URI="https://github.com/Dr-Noob/${PN}.git"
S="${WORKDIR}/${PN}-${PV}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

src_prepare() {
	default
	export CC=$(tc-getCC)
}

src_install() {
	dobin "${PN}"
	doman "${PN}.1"
	newdoc README.md README
	dodoc -r doc/.
}
