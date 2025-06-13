+++
draft = true
title = "virt-manager on Linux and Windows"
date = 2024-10-27T19:48:23Z
+++

I'm not a fan of WSL, mostly because it behaves subtly different but also because
all the terminals I tried on Windows just feel wrong. I do like Putty.

Anyway, for different reasons I really like having a dedicated Linux box with a
graphical desktop running and available from several machines, even if it's really
a VM. Especially if I can have it have some "state", like leaving certain browser
or editor window open.

So I have this Arch VM with KDE Plasma (unlike my normal choice of tiling window
managers) running on my [home server](/blog/2020/home-server/) and it's perfectly
easy to connect from Linux with `virt-manager`, no surprise.

But it also works with Windows.

I found [this tutorial][tutorial] and it mostly worked, but not completely.

So to recap and elaborate:

  * On Windows, grab [MobaXterm][mobaxterm] (Free for home use)
  * In PowerShell, `wsl --install -d Debian` (that is WSL 1)
  * On the Debian WSL abomination, as root:
    * `apt-get update ; apt-get install virt-manager`
    * create an ssh key
    * make sure your libvirt host is in `/etc/hosts` and/or edit `.ssh/config` to include it
  * Using MobaXterm, open a connection to Debian on WSL, then `sudo virt-manager`
  * File, Add Connection, Connect to remote host over SSH, `root` and `your-libvirt-host`, Connect
  * now wonder why it will always forget the settings, so pick a short hostname

But it works, I have access to my VM via `virt-manager` and it's lag-free via LAN like I've never
managed to get VNC or anything else lag-free.

One thing I left out is that it would originally not work and pop up something about host keys.

I'm not completely sure how I fixed it, but I think some of these things were involved:

  * `apt-get install ssh-askpass`
  * `ssh-add /root/bin/id_rsa`
  * `ssh root@your-libvirt-host` just to have the host key verified

But I will try to reproduce that on a 2nd Windows machine.

The only downside I found is that copy/paste is not working, a small price to pay.

This was originally written in the summer of 2023, and I still use this from
Windows, and from a linux laptop, but when I tried it from my work Mac I had
the same problem with the host key.


Also, in the end I am very happy with the SSH Remote Plugin for VS Code, so
this is mostly used when I need a linux GUI, when I just need to quickly edit
a file or commit something in a repo I have checked out on the server anyway,
then either ssh and vim works, or if I am "developing software" and rather have
all the files open, VS Code is really good for that.

[tutorial]: https://linux.how2shout.com/how-to-install-and-use-virt-manager-on-windows-10/
[mobaxterm]: https://mobaxterm.mobatek.net/download.html
