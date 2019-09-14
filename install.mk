#
# SPDX-FileCopyrightText: 2019 Dmytro Kolomoiets <amerlyq@gmail.com> and contributors
#
# SPDX-License-Identifier: Apache-2.0
#
#%USAGE: $ make --file=./$0 pkgname=kirie check-reuse
#%DEBUG: $ make prefix=/tmp/_install install
#%DEPS(optional): |aur/reuse|
#%
.POSIX:
.DEFAULT_GOAL = help
MAKEFLAGS += -rR --silent
this := $(lastword $(MAKEFILE_LIST))
here := $(patsubst %/,%,$(dir $(realpath $(this))))
d_pj := $(patsubst %/,%,$(dir $(here)))
.PHONY: $(shell sed -rn 's/^([A-Za-z0-9-]+):(\s.*|$$)/\1/p' '$(this)')

# ALSO: move site scripts into kirie/_www and unrelated repo-specific site data into ./_www

$(if $(pkgname),,$(error NEED:VAR: pkgname))

prefix := /usr/local
bindir := $(DESTDIR)$(prefix)/bin
libexecdir := $(DESTDIR)$(prefix)/libexec
datadir := $(DESTDIR)$(prefix)/share
dexe := $(libexecdir)/$(pkgname)


# BUG: "install" omits suggested symlinks/aliases -- they must be installed separately
install:
	install -d '$(bindir)' '$(libexecdir)' '$(datadir)'
	'$(here)/suggest' ./ ./ -xtype f -exec install -vT -Dm755 -- '{}' '$(dexe)/{}' \;
	'$(here)/suggest' ./ ./ -xtype d -type l -exec cp -vfdT -- '{}' '$(dexe)/{}' \;
	ln -svrfPT '$(dexe)/kirie/kirie' '$(bindir)/$(pkgname)'
	install -d '$(datadir)/zsh/site-functions'
	install -vDm644 '$(here)/zsh-completion' '$(datadir)/zsh/site-functions/_$(pkgname)'
	install -vDm644 LICENSE -t '$(datadir)/licenses/$(pkgname)'
	install -vDm644 README.md -t '$(datadir)/doc/$(pkgname)'


dev-install:
	install -d '$(libexecdir)'
	ln -svfT '$(d_pj)' '$(dexe)'
	ln -svfT '$(dexe)/kirie/kirie' '$(bindir)/$(pkgname)'
	install -d '$(datadir)/zsh/site-functions'
	ln -svfT '$(here)/zsh-completion' '$(datadir)/zsh/site-functions/_$(pkgname)'


dev-uninstall:
	rm -v \
	  '$(bindir)/$(pkgname)' \
	  '$(dexe)' \
	  '$(datadir)/zsh/site-functions/_$(pkgname)' \


check-reuse:
	reuse lint
