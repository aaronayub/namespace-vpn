# Copyright (c) 2023 Aaron Ayub
# SPDX-License-Identifier: GPL-3.0-only

# Makefile for the nsrun program

CC:= gcc

make:
	mkdir -p build
	${CC} nsrun.c -o build/nsrun

install:
	install -m 755 build/nsrun /usr/local/bin/nsrun
	setcap cap_sys_admin+ep /usr/local/bin/nsrun
