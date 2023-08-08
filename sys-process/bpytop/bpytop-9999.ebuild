# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10..12} pypy3)
DISTUTILS_USE_PEP517=pyproject.toml
inherit distutils-r1 git-r3

DESCRIPTION="Linux/OSX/FreeBSD resource monitor"
HOMEPAGE="https://github.com/aristocratos/bpytop"
EGIT_REPO_URI="https://github.com/aristocratos/bpytop.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~riscv ~x86"
IUSE="test"

RDEPEND="
	>=dev-python/psutil-5.9.4[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_install() {
	insinto "/usr/share/${PN}/themes"
	doins bpytop-themes/*.theme
	distutils-r1_src_install
}
