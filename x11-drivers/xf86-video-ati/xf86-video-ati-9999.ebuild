# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

XORG_DRI=always
inherit xorg-2

DESCRIPTION="ATI video driver"

KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE="glamor"

RDEPEND=">=x11-libs/libdrm-2.4.36[video_cards_radeon]
	glamor? ( x11-libs/glamor )"
DEPEND="${RDEPEND}"

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		--enable-dri
		--enable-kms
		--enable-exa
		$(use_enable glamor)
	)
	xorg-2_src_configure
}
