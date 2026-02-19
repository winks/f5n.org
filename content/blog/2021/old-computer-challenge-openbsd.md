+++
draft = false
title = "The Old Computer Challenge and OpenBSD 6.9"
date = 2021-07-10T00:00:00Z
+++

When I read [The Old Computer Challenge](https://dataswamp.org/~solene/2021-07-07-old-computer-challenge.html) I knew this wasn't really for me.

I'm not doing a lot of personal programming at the moment, and the things I do actually work a lot better (or at all) on a machine that's not 15-20 years old.

Yes, I admit it, it's mostly playing games that were released when 512 MB RAM weren't the norm any more, or using YouTube (which eats a lot of CPU, I tried it).

But I found the idea interesting nevertheless, and I do have an old laptop here, my first one, actually.

It's a hp compaq nx7010 that I bought in 2004 for university,
it has a nice widescreen 15,4" screen with 1680x1050 resolution (ATI Radeon Mobility 9200/ATI Radeon Mobility M9), a 1.5 GHz single-core Centrino CPU, and was upgraded to 1.5GB of RAM. And it was really expensive,
but I used it for at least 6 years as my main laptop, and I think I really only stashed it away in 2013 when I got my work x230 that I could also use for private stuff.

I had installed OpenBSD 6.2 at some point in 2017, when it was the latest version and since then I hadn't done a lot. I booted it once in a while, I think I even
committed an OpenBSD-only bugfix for i3-statusbar or something, and that was that.

But I wanted to update the OS for a while already and now this was the perfect opportunity. So in my lunch break I downloaded the latest 6.9 install image and ran with it.

Unfortunately some things weren't working out of the box, so I had to stop and wait until work was over, but I think it's good enough for now.

So here's a little guide to running OpenBSD on a very old laptop.

I've actually typed up most of this post on the laptop, in vim, although the file is sitting on another computer - but I'm using xterm on ratpoisonon OpenBSD.
Yes, I do prefer i3, but I won't bother to even change the keybindings, ratpoison seems reallyok out of the box, just ctrl-t is a bit weird.
And netsurf seems fine to check how this post looks as a finished html page, haven't tried some real web surfing.



## The install instructions

Download the install image file, install69.img from https://www.openbsd.org/faq/faq4.html and write to a USB stick:


```
# dd if=install*.img of=/dev/rsd6c bs=1M
```

The OpenBSD installation itself is pretty uneventful, just go with the defaults, wired networking via DHCP worked fine. WiFi didn't work out of the box,
but I may as well just have fat-fingered something. The interface was up but it didn't connect. Or maybe the wifi is too new for this card...

I ran with the defaults for partitioning and everything.

But then it got interesting:

Notice that as soon as the kernel has booted you only have a blank screen, search the web. find a fix.

Temporarily disable `radeondrm`:


```
boot> boot -c
UKC> disable radeondrm
UKC> quit
```

or do it permanently (on revisiting it seems I copy/pasted this wrong):


```
# config -ef /bsd
UKC> disable radeondrm
UKC> quit
```

Edit 2026-02: All that seems to still work, I did this:

```
echo 'disable radeondrm' >> /etc/bsd.re-config
config -e -c /etc/bsd.re-config -f /bsd
reboot
```


## Some configuration

OpenBSD recommends `doas` over `sudo`, so when in Rome, **do as** the Romans do:

```
# enable doas for group wheel
echo "permit :wheel" > /etc/doas.conf
# check config
doas -C /etc/doas.conf
```

Now it's time to see how outdated the install medium was and do an upgrade:

```
syspatch -c
syspatch
```

Then notice that something with KARL didn't work:

```
# it tells me to run this
/usr/libexec/reorder_kernel
```

It didn't help, but  in the log file there are some steps I should do, those do work.

But still, X won't start.

I learn that `startx` is deprecated, and I should do:

```
rcctl enable xenodm
rcctl start xenodm
```

Sadly it didn't change anything, but the fix is actually easy if you RTFM correctly:

```
echo machdep.allowaperture=2 >> /etc/sysctl.conf
reboot
```
(thank you, helpful people of [r/openbsd](https://old.reddit.com/r/openbsd/comments/ogtl0s/problems_with_startx_69_radeondrm/))

So now I can finally log in to a graphical interface and am greeted by the horrible, horrible `fvwm2`.

After 5 minutes of trying and not liking `cwm` and deciding that `i3` is too resource heave for this, I want to try `ratpoison`.

```
pkg_add ratpoison
```

Then simply edit the `$HOME/.xsession` and restart X:

```
xsetroot -solid rebeccapurple &
xterm -bg black -fg white +sb &
ratpoison

```

Finally install a few applications I will or might need:

```
pkg_add git zsh tmux vim irssi mutt netsurf htop
```
