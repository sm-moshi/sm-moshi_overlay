# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} pypy3 )
DISTUTILS_USE_SETUPTOOLS=pyproject.toml
inherit distutils-r1 git-r3

DESCRIPTION="Linux/OSX/FreeBSD resource monitor"
HOMEPAGE="https://github.com/aristocratos/bpytop"
EGIT_REPO_URI="https://github.com/aristocratos/bpytop.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-python/psutil-5.7.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_install() {
	insinto "/usr/share/${PN}/themes"
	doins bpytop-themes/*.theme
	distutils-r1_src_install
}
