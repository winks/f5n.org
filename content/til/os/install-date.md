+++
draft = false
title = "Install Date"
date = 2026-02-15T22:59:53Z
tags = ["os"]
+++

Apparently there is no uniform way to find out when an OS was installed, so
here are several ways I found, which might or might not work:

### Linux

```
# This is btrfs on Arch
# stat /
...
 Birth: 2026-01-07 12:22:11.134890097 +0100
 ```

I checked 1-2 machines and even after log rotation the oldest files in
`/var/log` matched the date from `stat`. I could not find any apt-logs
from installation but in the case of Debian it was a VPS, so no idea
what they did there. On a relatively fresh install of Arch there was only
one file `/var/log/old` that was backdated to many months before the install,
even before the date I had written down for the installer ISO.

Finding symlinks created in /etc sounded more reliable, unless they were also
recreated, but the oldest might be correct.


### Debian

```
# this is ext4 on Debian 12
# stat /
...
 Birth: 2026-01-07 12:22:11.134890097 +0100

 Birth: 2023-06-14 13:02:31.000000000 +0200
```

If the system never got a point release, then `ls -al /etc/debian_version`
might work, but I would not bet on it.


### FreeBSD

```
# stat /
87 2 drwxr-xr-x 20 root wheel 5056 512 "Jan 29 11:20:50 2026" ...

# ls -lt /var/log | tail -n 3
-rw-------  1 root  wheel        60 Jan 29 11:40 xferlog
-rw-------  1 root  wheel        60 Jan 29 11:40 security
-rw-r--r--  1 root  wheel        60 Jan 29 11:40 devd.log
# cat /var/log/devd.log
Jan 29 11:40:06 rpi-b newsyslog[891]: logfile first created
```


### Windows

In a very unexpected turn of events, this seems easy on Windows (11):

```
# systeminfo
...
Original Install Date:         14/03/2025, 21:10:35
System Boot Time:              15/02/2026, 13:15:05
```
