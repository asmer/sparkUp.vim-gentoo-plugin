# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/dbext/dbext-12.00.ebuild,v 1.4 2010/11/14 17:09:00 armin76 Exp $

EAPI=3

inherit vim-plugin git

DESCRIPTION="vim plugin: SparkUp - Zen Coding for ViM"
HOMEPAGE="https://github.com/rstacruz/sparkup"
SRC_URI=""
EGIT_REPO_URI="git://github.com/rstacruz/sparkup.git"
LICENSE="GPL-3"
KEYWORDS="alpha amd64 ia64 ~mips ~ppc sparc x86"
VIM_PLUGIN_HELPFILES="ack"

RDEPEND=""
DEPEND="dev-lang/python"

#S="${PORTAGE_BUILDDIR}"

src_prepare() {
	git_src_prepare
	rm -rf "${S}/.git/"
	rm -rf "${S}/.gitignore"
	rm -rf "${S}/.README.md.un~"
	rm -rf "${S}/TextMate"
	rm -rf "${S}/distribution"
	#mkdir "${S}/ftplugin"
	#mv "${S}/vim/ftplugin/html" "${S}/ftplugin/"
	#chmod 755 "${S}/ftplugin/html/sparkup.py"
	#dobin ${S}/vimfiles/ftplugin/html/sparkup.py
}


src_install() {
	#dobin vim/ftplugin/html/sparkup.py
	dodir /usr/share/vim/vimfiles/ftplugin/html
	insinto /usr/share/vim/vimfiles/ftplugin/html
	doins vim/ftplugin/html/*
	fperms a+x /usr/share/vim/vimfiles/ftplugin/html/sparkup.py
	#doexe "ftplugin/html/sparkup.py"
	#mkdir -p "${D}/usr/share/vim/vimfiles/ftplugin/html"
	#cp  -rf "${S}/vim/ftplugin/*" "${D}/usr/share/vim/vimfiles/ftplugin/"
	#doexe vimfiles/ftplugin/html/sparkup.py
	#return
}


S="${WORKDIR}"
