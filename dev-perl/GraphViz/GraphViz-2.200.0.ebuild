# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DIST_A_EXT=tgz
DIST_AUTHOR=RSAVAGE
DIST_VERSION=2.20
inherit perl-module

DESCRIPTION="GraphViz - Interface to the GraphViz graphing tool"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	media-gfx/graphviz
	virtual/perl-Carp
	>=virtual/perl-Getopt-Long-2.340.0
	virtual/perl-IO
	>=dev-perl/IPC-Run-0.600.0
	>=dev-perl/libwww-perl-6
	>=dev-perl/Parse-RecDescent-1.965.1
	>=virtual/perl-Time-HiRes-1.510.0
	>=dev-perl/XML-Twig-3.380.0
	>=dev-perl/XML-XPath-1.130.0
"
DEPEND="${RDEPEND}
	>=dev-perl/Module-Build-0.421.100
	>=dev-perl/File-Which-1.90.0
	test? (
		>=virtual/perl-Test-Simple-1.1.14
	)
"

src_install() {
	perl-module_src_install

	insinto /usr/share/doc/${PF}/examples
	doins "${S}"/examples/*
}

src_test() {
	perl_rm_files t/pod.t
	perl-module_src_test
}
