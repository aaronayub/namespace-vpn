# Copyright (c) 2023-2024 Aaron Ayub
# SPDX-License-Identifier: GPL-3.0-only

# Makefile for the namespace-vpn

CC:= gcc

make:
	mkdir -p build
	${CC} nsrun.c -o build/nsrun

clean:
	rm -r build

install:
	install -m 755 build/nsrun /usr/local/bin/nsrun
	install -m 755 -D bin/nsvpn /usr/local/sbin/nsvpn
	install -m 755 -D bin/nsvpn-wg /usr/local/sbin/nsvpn-wg
	setcap cap_sys_admin+ep /usr/local/bin/nsrun
	cp -rf namespace-vpn /usr/local/lib

uninstall:
	rm -r /usr/local/lib/namespace-vpn
	rm /usr/local/sbin/nsvpn /usr/local/sbin/nsvpn-wg /usr/local/bin/nsrun
