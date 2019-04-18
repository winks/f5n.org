+++
draft = false
title = "Desktop Environments"
date = 2019-04-18T13:55:23Z
+++

I stumbled over this post about the new
[Xubuntu 19.04](https://bluesabre.org/2019/04/18/xubuntu-19-04-the-exhaustive-update/)
and what's going to be included I remembered writing about [i3 and kde](/blog/2018/i3-kde5-plasma/).

Maybe time to reevaluate this choice after 6 months? Do I really need KDE/Plasma? I certainly need
a tiling WM, be it i3 or xmonad (or back to awesome). Am I taking advantage of what a full-fledged
Desktop Environment brings me versus using just a "lightwight" window manager?

I think my original problem with just xmonad was the lack of status bars and a tray area, out of
the box. Sure, there are tools to fix this and it usually worked. But I also had a somewhat arcane
setup with `dhcpcd` and `wpa_supplicant` instead of network-manager. It worked fine, but I didn't
want to try to reproduce it on the (new) work laptop. Let's just say I've regretted it already a
few times when nm behaved badly or just takes many seconds to connect to a wifi whereas my old
setup is mostly really fast. I also thought I could easily add OpenVPN to this `nm-applet` or
whatever it is called these days but I ended up forgetting about it and using CLI openvpn all
the time anyway, also I'm only using `wireguard` on a regular basis these days anyway...

Another problem was the bad/non-existant discoverability of configuration for input and output
devices. I'm really happy with the KDE "System Settings" application.

A funny thing is that I use graphical file managers so seldomly that I usually forget which one
I actually have installed on the machine I'm using currently, be it `dolphin`, `thunar`, or
whatever. I usually start them 3-4 times per year. Again there would be the KDE Start Menu, but
I also forgot I had that, expecially when sitting at my desk with 2 external monitors and the
laptop (with the KDE bar in the bottom) tucked away to my far right side... Doh.

I still launch everything with `win-p` via `dmenu` although I also have KDE's `alt-space`
launcher. Speaking of this, `spectacle` is quite nice for screenshots, but I could use that one
without a full KDE desktop, of course. I guess the same is true for Okular (PDF viewer). I
don't really know if I use any "KDE applications" that aren't just by chance associated with
KDE or written in Qt. Nothing deeply integrated in the system, at least.

KDEConnect seemed pretty cool but it's useless to me as my private mobile phone is in the guest
wifi at work whereas my work laptop is in the internal one.

I'm also quite set in the ways of where my applications end up (which workspace/virtual desktop)
and I think I don't use so many, anyway.

  * 2: QtCreator (C++) + Visual Studio Code (TypeScript, Python, misc)
  * 3: Chrome (primary browser)
  * 4: Slack, Quassel, Toggl (TimeTracking)
  * 5: TextAdept (text editor, my scratch buffer) + misc tools
  * 9: Firefox (secondary browser) + misc tools like Krita for graphics
  * 0: system settings and other stuff like VirtualBox if needed
  * 1: terminals with currently active project
  * 6,7,8: terminals (non-main project and if I need more)

Where did my 16GB of RAM vanish, again? Not many applications open. I think only the
password manager is missing from the above list. I'd use Thunderbird more often but due to
always lacking RAM I decided to not use it for the moment.

So yeah, apparently when doing development work I don't need a whole lot of GUI tools, so I might
as well not use a full Desktop Environment. I guess I'll stick to KDE+i3 as long as this
installation of 18.04 doesn't die. When I choose to upgrade I might try something else, and
although a lot of that blog post in the opening paragraph sounded interesting, I guess I simply
won't use it, just as I don't take advantage (or simply don't need) the plethora of tools that
come with a DE.

I remember I always check out everything that any linux distro installs by default (been doing
that for 20 years now) but I think not much "sticks" - most of these tools are novelty or solving
special problems I am lucky I don't have. For all the common and regular-but-rarely I have a set
of tools and I don't change them all the time, just because there's something newer or better,
only when problems arise.

When I reboot for the next time I still think I should measure base RAM usage of this KDE stuff,
it didn't look too bad, but if I could reclaim a GB I might ditch it for pure i3 again...
