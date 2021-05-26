# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools flag-o-matic git-r3

DESCRIPTION="A cross-platform tool to restore Apple devices from IPSW files."
HOMEPAGE="http://libimobiledevice.org"
SRC_URI=""
EGIT_REPO_URI="https://github.com/libimobiledevice/idevicerestore.git"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~AMD64"

RDEPEND="app-pda/libirecovery:0=
		>=app-pda/libimobiledevice-1.1.6:0=
		app-pda/libplist:0=
		>=dev-libs/libzip-0.8.0
		>=net-misc/curl-7.0.0
		dev-libs/openssl:0="
DEPEND="${RDEPEND}
		virtual/pkgconfig"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# the software's configure.ac doesn't handle things quite correctly,
	# pass -pthread and -lpthread to solve the issue
	append-flags "-pthread"
	append-ldflags "-lpthread"
	econf
}

src_install() {
	default
	doman docs/idevicerestore.1
	find "${D}" -name '*.la' -delete || die
}

