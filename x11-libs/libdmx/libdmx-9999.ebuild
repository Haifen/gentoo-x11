# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org dmx library"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=x11-libs/libX11-1.3
	>=x11-libs/libXext-1.1"
DEPEND="${RDEPEND}
	>=x11-proto/dmxproto-2.3"
