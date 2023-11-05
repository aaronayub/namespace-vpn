# Copyright (c) 2023 Aaron Ayub
# SPDX-License-Identifier: GPL-3.0-only

# Makefile for the nsrun program

CC:= gcc

make:
	mkdir -p build
	${CC} nsrun.c -o build/nsrun

clean:
	rm -r build

install:
	install -m 755 build/nsrun /usr/local/bin/nsrun
	install -m 755 -D nsv /usr/local/sbin/nsv
	setcap cap_sys_admin+ep /usr/local/bin/nsrun
	cp -rf namespace-vpn /usr/local/lib

uninstall:
	rm -r /usr/local/lib/namespace-vpn
	rm /usr/local/sbin/nsv /usr/local/bin/nsrun
