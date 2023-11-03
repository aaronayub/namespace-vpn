// Copyright (c) 2023 Aaron Ayub
// SPDX-License-Identifier: GPL-3.0-only

/* This program executes the specified command and its arguments within the namespace named "nsvpn". It uses bind mounts to use separate nsswitch.conf and resolv.conf files to provide namespaced DNS resolution. */

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#include <unistd.h>
#include <sched.h>
#include <fcntl.h>
#include <sys/mount.h>

int main(int argc, char **argv) {
	// The program requires a command to run.
	if (argc < 2) return 1;

	// Switch to the network namespace named nsvpn
	int fd = open("/run/netns/nsvpn",O_RDONLY);
	if (setns(fd,CLONE_NEWNET) != 0) return 2;

	// Unshare mount namespace and bind mount conf files for DNS resolution
	if (unshare(CLONE_NEWNS) != 0) return 3;
	if (mount("","/","",MS_REC|MS_PRIVATE,NULL) !=0) return 4;
	if (mount("/etc/netns/nsvpn/resolv.conf","/etc/resolv.conf","",MS_BIND|MS_RDONLY,NULL) !=0) return 4;
	if (mount("/etc/netns/nsvpn/nsswitch.conf","/etc/nsswitch.conf","",MS_BIND|MS_RDONLY,NULL) !=0) return 4;

	// Execute the program with its arguments
	execvp(argv[1], &argv[1]);
}
