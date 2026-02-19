+++
draft = false
title = "WiFi on OpenBSD"
date = 2026-02-17T20:42:18Z
tags = ["openbsd"]
+++

In theory it's really easy, in practice the manpage didn't help me.

Assuming my interface is available because it's supported by default:

```
# cat /etc/hostname.rtwn0
join 'net name1' wpakey 'secret'
join 'net name2' wpakey 'secret'
inet autoconf

# ifconfig rtwn0 media
# ifconfig rtwn0 scan

# sh /etc/netstart
```

Notes:

  * `join` works with several, the old `nwid` only works once
  * `man hostname.if`

Reference: https://www.openbsd-desktop.rocks/posts/wi-fi-connection/
