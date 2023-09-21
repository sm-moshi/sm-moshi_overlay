# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_MAX_SLOT="18"
MY_PN="SPIRV-LLVM-Translator"
MY_P="${MY_PN}-${PV}"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git"
	RESTRICT="mirror fetch"
else
	SRC_URI="https://github.com/eth-p/bat-extras/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
	RESTRICT="mirror test"
fi

inherit git-r3 cmake flag-o-matic llvm multiprocessing

DESCRIPTION="Bi-directional translator between SPIR-V and LLVM IR"
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
EGIT_REPO_URI="https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git"

S="${WORKDIR}/${MY_P}"

LICENSE="UoI-NCSA"
SLOT="${LLVM_MAX_SLOT}"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-util/spirv-tools
	sys-devel/llvm:${SLOT}=
"
DEPEND="${RDEPEND}
	dev-util/spirv-headers
"
BDEPEND="
	virtual/pkgconfig
	test? (
		dev-python/lit
		sys-devel/clang:${SLOT}
	)
"

src_prepare() {
	append-flags -fPIC
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCCACHE_ALLOWED="OFF"
		-DCMAKE_INSTALL_PREFIX="$(get_llvm_prefix ${LLVM_MAX_SLOT})"
		-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="${ESYSROOT}/usr/include/spirv"
		-DLLVM_SPIRV_INCLUDE_TESTS=$(usex test "ON" "OFF")
		-Wno-dev
	)

	cmake_src_configure
}

src_test() {
	lit -vv "-j${LIT_JOBS:-$(makeopts_jobs)}" "${BUILD_DIR}/test" || die
}
