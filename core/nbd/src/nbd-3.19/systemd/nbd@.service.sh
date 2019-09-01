#!/bin/sh

prefix=/usr
exec_prefix=${prefix}
sysconfdir=/etc

cat <<EOF
[Unit]
Description=NBD client connection for %i
Documentation=man:nbd-client
PartOf=nbd.service
Before=dev-%i.device
After=network-online.target
Conflicts=shutdown.target
DefaultDependencies=no
[Service]
Type=forking
ExecStart=/usr/bin/nbd-client %i
[Install]
RequiredBy=dev-%i.device
RequiredBy=dev-%ip1.device
RequiredBy=dev-%ip2.device
RequiredBy=dev-%ip3.device
RequiredBy=dev-%ip4.device
RequiredBy=dev-%ip5.device
RequiredBy=dev-%ip6.device
RequiredBy=dev-%ip7.device
RequiredBy=dev-%ip8.device
RequiredBy=dev-%ip9.device
RequiredBy=dev-%ip10.device
RequiredBy=dev-%ip11.device
RequiredBy=dev-%ip12.device
RequiredBy=dev-%ip13.device
RequiredBy=dev-%ip14.device
RequiredBy=dev-%ip15.device
EOF
