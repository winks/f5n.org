+++
draft = false
title = "Home Server"
date = 2020-01-21T20:45:29Z
+++

After the [hardware upgrade](/blog/2019/hardware-upgrade/) in November and a
somehow rekindled interest in playing around with hardware and self-hosting
after a few months of mostly playing games... I found myself with a spare
i5-3570K with 16GB RAM. I'm pretty happy with my FreeNAS box, but it's not the
fastest (AMD Turion(tm) II Neo N54L) and it doesn't run docker and I don't
even want to try to run a beefy VM on it. The NAS should be stable and left
alone. (I run 2 jails, but they're just serving files, in a sense.)

Also I tried to have my Raspberry Pi 3 as a "development box" here, but it
just felt too slow. Maybe it was the USB stick over USB 2, I don't know. And
WSL also doesn't excite me, really. It just feels wrong, somehow.

So incidentally a years old 650W PSU died on me a few weeks back and I had
already transplanted my i5's PSU into that other computer, so I needed a new
one anyway if I wanted to use that computer. Sadly it was in a midi tower that
was just  a little too big to fit under my desk (there's already my main
machine, my NAS, a container with wheels and my subwoofer that doubles as a
foot rest most of the days).

So I looked for a small case and a "smaller" PSU and then I ordered

  * [AeroCool QS-180](https://aerocool.io/product/qs-180/) mini tower
  * [be quiet! System Power B9 300W](https://www.bequiet.com/en/powersupply/1285)

Now it fits under my desk. I didn't want to go full-out proxmox because I only
want to run a few docker containers and one "pet" VM where I have a normal
Linux box available without having to boot a laptop and that can use 4 cores
a lot of RAM. So my host was supposed to be kinda bare-bones, so I decided to
Alpine, which I hadn't used in a while, and mostly in VMs and containers.

The [wiki](https://wiki.alpinelinux.org) was helpful, as usual, but I'm still
copying my steps here in case they change it.


  * install alpine via `alpine-setup` (3.11 in my case)
  * uncomment the `/community` repo in `/etc/apk/repositories`
  * install packages:

```
apk update

# for docker & libvirt, not 100% sure if you need virt-manager
apk add docker bridge libvirt-daemon qemu-img qemu-system-x86_64 dbus polkit

# for my own convenience
apk add sudo curl file htop

# for docker-compose (there should be a better way, but it didn't work)
apk add py-pip python-dev libffi-dev openssl-dev gcc libc-dev make

```

  * add user to correct groups:
    * `addgroup USER docker`
    * `addgroup USER libvirt`
  * start daemons on boot:
    * `rc-update add docker`
    * `rc-update add libvirtd`
    * `rc-update add dbus`
    * `rc-status`
  * enable remote access for `virt-manager`:

```
# cat /etc/polkit-1/localauthority/50-local.d/50-libvirt-ssh-remote-access-policy.pkla
[Remote libvirt SSH access]
 Identity=unix-group:libvirt
 Action=org.libvirt.unix.manage
 ResultAny=yes
 ResultInactive=yes
 ResultActive=yes

```

  * check networking (`brctl` might be smarter than manual fiddling):

```
# cat /etc/network/interfaces
auto lo
iface lo inet loopback

auto br0
iface br0 inet static
        hostname whatever
        bridge-ports eth0
        bridge-stp 0
        bridge-fd 0
        address 192.168.1.2
        netmask 255.255.255.0
        gateway 192.168.1.1

```

  * finalize:
    * `reboot` and check if everything works
    * `brctl show`

```
[...]
br0             8000.c86000ecf792       no              eth0
                                                        vnet0
docker0         8000.024214a852b8       no
virbr0          8000.52540047d4cc       yes             virbr0-nic

```

    * connect via ssh + virt-manager from anywhere

Addendum:

The only open ports should be:

```
# netstat -tulpen
Proto Local Address  PID/Program name

tcp   127.0.0.1:5900 6419/qemu-system-x8
tcp   0.0.0.0:22     4380/sshd
tcp   :::22          4380/sshd
udp   127.0.0.1:323  3027/chronyd
udp   ::1:323        3027/chronyd

```

Low RAM usage in idle, no CPU power wasted in idle, looks good. So far Alpine
looks like a good choice. I only need a script or two to quickly spin up some
throwaway VMs, but maybe virt-manager is also good enough for that.
