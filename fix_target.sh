#!/bin/bash
# Added autoconfiguration of the eth0 interface
cat >> $1/etc/network/interfaces <<FIX_IFACES
auto eth0
iface eth0 inet dhcp
FIX_IFACES
