# Namespace-VPN
Namespace-VPN is a set of scripts to partition traffic into network namespaces, such that each namespace is functionally separate from one another.

Namespace-VPN handles the creation of a network namespace "nsvpn", maintenance of firewall rules with nftables, and namespaced DNS resolution.

## Running namespace-vpn
In order to create one namespaced VPN tunnel, run the start script, followed by any arguments to OpenVPN, such as config files, authentication, or timeout settings. For example, you can start namespace-vpn by running the following within the working directory of this project:

```bash
sudo ./start {OPENVPN_ARGUMENTS}
```

## Running programs within namespace-vpn
With the namespace created and the tunnel established, any programs can now be run in the "nsvpn" network namespace.

This can be done easily with the nsrun program provided with Namespace-VPN. To install nsrun, run the following in the namespace-vpn directory.
```bash
make && sudo make install
```

Then you can run any commands you want to run under the nsvpn namespace by running it under nsvpn. For example:
```bash
nsvpn {COMMAND} {...ARGUMENTS}
```

An alternative way to run commands is with the "ip" command's netns exec object. For example, commands can be run in the nsvpn namepsace with the following command:

```bash
sudo ip netns exec nsvpn sudo -u $USER {COMMAND}
```

## Requirements
- Linux
- OpenVPN
- Bash
- nftables
- gcc

## License
This program is made available under the terms of the GPL 3.0 only.

Copyright (C) 2023  Aaron Ayub

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
