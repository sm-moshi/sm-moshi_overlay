# Copyright 2021 sm-moshi
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit python-r1 distutils-r1 git-r3

PYTHON_COMPAT=(python3_9)
DISTUTILS_USE_SETUPTOOLS=pyproject.toml

DESCRIPTION="Linux/OSX/FreeBSD resource monitor"
HOMEPAGE="https://github.com/aristocratos/bpytop"
EGIT_REPO_URI="https://github.com/aristocratos/bpytop.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND="
	>=dev-python/psutil-5.7.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_install() {
	insinto "/usr/share/${PN}/themes"
	doins bpytop-themes/*.theme
	distutils-r1_src_install
}
