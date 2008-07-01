# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-i810/xf86-video-i810-2.0.0.ebuild,v 1.1 2007/04/21 05:56:37 joshuabaergen Exp $

# Must be before x-modular eclass is inherited
# Enable snapshot to get the man page in the right place
# This should be fixed with a XDP patch later
SNAPSHOT="yes"
XDPVER=-1

EGIT_BRANCH="xf86-video-intel-2.4-branch"

inherit x-modular git

EGIT_REPO_URI="git://anongit.freedesktop.org/git/xorg/driver/${PN/i810/intel}"

DESCRIPTION="X.Org driver for Intel cards"

KEYWORDS="~amd64 ~arm ~ia64 ~sh ~x86 ~x86-fbsd"
SRC_URI=""
IUSE="dri"

RDEPEND=">=x11-base/xorg-server-1.2
	x11-libs/libXvMC"
DEPEND="${RDEPEND}
	x11-proto/fontsproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/xextproto
	x11-proto/xproto
	dri? ( x11-proto/xf86driproto
			>=x11-libs/libdrm-2.2
			x11-libs/libX11 )"

PATCHES=("${FILESDIR}/0001-intel-fix-drm-check.patch")
CONFIGURE_OPTIONS="$(use_enable dri)"

pkg_setup() {
	if use dri && ! built_with_use x11-base/xorg-server dri; then
		die "Build x11-base/xorg-server with USE=dri."
	fi
}

src_unpack() {
	x-modular_specs_check
	x-modular_server_supports_drivers_check
	x-modular_dri_check
	git_src_unpack
	cd ${S}
	x-modular_patch_source
	x-modular_reconf_source
}
