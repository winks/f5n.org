+++
draft = false
title = "Connecting Quassel to ZNC"
date = 2024-10-30T17:51:45Z
tags = ["quassel"]
+++

Less of a TIL than a "I have to look this up every couple of years".

When you connect a Quassel Core to ZNC:

  * File -> Networks -> Configure Networks...
  * Manually specify...
    * Network name: whatever
    * Server address: localhost or your ZNC server
    * Port: 2000 or what you have
    * Server password: `username/network:password`

Weechat for example has a dedicated password field, but here you
simply have to make do with this.
