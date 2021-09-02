# Copyright 2021 sm-moshi
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit linux-mod git-r3

DESCRIPTION="Realtek 8812AU USB WiFi module for Linux kernel"
HOMEPAGE="https://github.com/gnab/rtl8812au"
EGIT_REPO_URI="https://github.com/gnab/rtl8812au.git"

LICENSE="*"
SLOT="0"
KEYWORDS=""

MODULE_NAMES="8812au(net/wireless)"
BUILD_TARGETS="modules"
BUILD_TARGET_ARCH="${ARCH}"

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KERN_DIR=${KV_DIR} KSRC=${KV_DIR} KERN_VER=${KV_FULL} O=${KV_OUT_DIR} V=1 KBUILD_VERBOSE=1"
}

src_compile(){
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
}
