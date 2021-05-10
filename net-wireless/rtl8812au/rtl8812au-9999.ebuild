# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod git-r3

DESCRIPTION="Realtek 8812AU USB WiFi module for Linux kernel"
EGIT_REPO_URI="https://github.com/gnab/rtl8812au.git"
HOMEPAGE="https://github.com/gnab/rtl8812au"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

MODULE_NAMES="8812au(net/wireless)"
BUILD_TARGETS="all"
BUILD_TARGET_ARCH="${ARCH}"
BUILD_PARAMS="KERN_DIR=${KV_DIR} KSRC=${KV_DIR} KERN_VER=${KV_FULL} O=${KV_OUT_DIR} V=1 KBUILD_VERBOSE=1"

#pkg_setup() {
#	linux-mod_pkg_setup
#	
#}

#src_compile(){
#	linux-mod_src_compile
#}

#src_install() {
#	linux-mod_src_install
#}

#pkg_postinst() {
#	linux-mod_pkg_postinst
#}