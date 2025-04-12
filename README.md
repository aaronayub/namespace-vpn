# Namespace-VPN
Namespace-VPN is a set of scripts to partition traffic into network namespaces, such that each namespace is functionally separate from one another.

Namespace-VPN handles the creation of a network namespace "nsvpn",and provides namespaced DNS resolution. It also comes with a tool named "nsrun", which allows users to run programs under this isolated namespace.

Both OpenVPN and Wireguard protocols are supported.

## Installation
To install Namespace-VPN, run the following:
```bash
make && sudo make install
```
This will build and install Namespace-VPN and nsrun. You can run Namespace-VPN with either OpenVPN or Wireguard by following the instructions below.

## Running Namespace-VPN with OpenVPN
Run the start script followed by any arguments to OpenVPN, such as config files, authentication, or timeout settings. For example, you can start namespace-vpn by running the following:
```bash
sudo nsvpn {OPENVPN_ARGUMENTS}
```

## Running Namespace-VPN with Wireguard
Namespace-VPN requires a wireguard configuration file to work. These files must be modified by commenting out any Address and DNS fields with a single # character. If not already present, at least one #Address and #DNS field must be added. Afterwards, namespace-vpn can be started with the following command:
```bash
sudo nsvpn-wg {PATH_TO_CONFIG_FILE}
```

## Running programs within Namespace-VPN
With Namespace-VPN running, programs can be run under the isolated "nsvpn" namespace. To do so, run the following:
```bash
nsvpn {COMMAND} {...ARGUMENTS}
```

## Requirements
- Linux
- openvpn (for OpenVPN implementation)
- bash (for OpenVPN implementation)
- wireguard-tools (for Wireguard implementation)
- gcc (for nsrun)

## Uninstallation
To uninstall Namespace-VPN, run the following:
```bash
sudo make uninstall
```

## License
This program is made available under the terms of the GPL 3.0 only.

Copyright (C) 2023-2025 Aaron Ayub

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
