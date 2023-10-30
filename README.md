# Namespace-VPN
Namespace-VPN is a set of scripts to partition traffic into network namespaces, such that each namespace is functionally separate from one another.

Namespace-VPN handles the creation of a network namespace "nsvpn", maintenance of firewall rules with nftables, and namespaced DNS resolution.

## Usage
In order to create one namespaced VPN tunnel, run the start script, followed by any arguments to OpenVPN, such as config files, authentication, or timeout settings. For example, you can start namespace-vpn by running the following within the working directory of this project:

```bash
sudo ./start {OPENVPN_ARGUMENTS}
```

With the namespace created and the tunnel established, any programs can now be run in the "nsvpn" network namespace. One way to run commands is with the "ip" command's netns exec object. For example, commands can be run in the nsvpn namepsace with the following command:

```bash
sudo ip netns exec nsvpn sudo -u $USER {COMMAND}
```

## Requirements
- Linux
- OpenVPN
- Bash
- nftables

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
