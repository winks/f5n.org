+++
draft = false
title = "The Old Computer Challenge, Part 2"
date = 2021-07-16T18:00:00Z
+++


While I didn't take part in the [Old Computer Challenge][OCC] I wrote about
[last week][OCCf5n], I did play around with the laptop a bit since then.

First of all, here's a screenshot:

![ratpoison on nx7010](/media/blog/nx7010_rp.png)

I didn't take the time to properly configure my terminals to start with a
black background at the start, but later I did.

Only after this screenshot I noticed that something seems off and `xrandr`
told me that I'm running with 1280x1024, and not the display's native
1680x1050 resolution, which you don't really notice if you only have shells
open. Not sure I can fix that with the graphics driver issues...

Also for some this reason wifi via the `iwi` driver didn't seem to work at
first, networking via cable was instantly fine, as expected. But of course
I have a cat5 cable near my sofa in the office...

On a second try it did actually work with my mobile phone's hotspot and then
also with my normal AP, but seemingly not via `/etc/hostname.iwi0` and 
`sh /etc/netstart`, but only when doing:

```
ifconfig iwi0 down
ifconfig iwi0 nwid my_ssid wpakey my_key
ifconfig iwi0 up
ifconfig iwi0 scan
```

In the end I'm back to cable because something was still slighly wrong, even
though I got `route show` to look more correct, but I wasn't in the mood to
fix this now. I think wifi can be filed under: it works.

Not sure I was ever going to be happy with the `ratpoison` keybindings.
But Ctrl-t on this keyboard
could get painful after a while (pinky + index), whereas my usual
win-1 to win-0(thumb + ring/middle/index) feels a lot better. Also the spacebar
on this laptop isn't great, I keep on missing spaces when I type. 

Also no idea why I had thought that `i3` was using a lot more RAM, maybe that
was my weird bug on Ubuntu last year, when I switched it was under 5MB used.

So here's a new screenshot:

![i3 on nx7010](/media/blog/nx7010_i3.png)


The browser situation is still a little unclear, I tried `netsurf` and `dillo`,
but I am not happy. Guess I need to install `firefox` after all and see how it
goes.
[time passes] The results are in and they are not great. Loaded up a
YouTube video and got 2 ads, had some stutter, then during the 2nd ad the tab
crashed. Reloaded, music played fine then. CPU was working and Firefox with
one tab open already drew a lot of RAM. Closing the tab and opening my website
did not improve RAM usage in a meaningful way. Then I tried `seamonkey`, this
seemed to be a little better.

I tried `youtube-dl` and `mpv` and that used less CPU, so I think that's a
workable solution, at least for certain things. The official youtube-dl didn't
work out of the box (even after installing `python3`), but the one from the
ports did. Again, thank you, OpenBSD.

Every page I visited in Seamonkey seemed fine, only Element (the Matrix web
client) wouldn't accept this browser.

Didn't try to read mail, but I've used `mutt` in the past, so I would probably
try that (for a week).
[time passes] Ok, I tried it. IMAP works fine, but this
version of mutt seems to be compiled without SASL, so I can't send mail via
this mail server I tried. also it's not compiled with DEBUG so I gave up
troubleshooting very quickly.

irssi works fine, weechat would be fine, although I prefer Quassel.

I think one of the main problems is actually trying to use OpenBSD (where not
all software I use is available), at the same time trying a different window
manager, and then the slow hardware - but I think the latter is the
least of my problems, if I can keep my 1.5GB of RAM, that is.

Using a Linux distro I know very well (Debian for example) would've made some
things a little easier, I guess.
But that doesn't mean I had any major difficulty with OpenBSD, despite only
ever using it on servers or on this old notebook, and I didn't use it enough
to run into any real road blocks in daily usage.

But during the week I took some notes of stuff I was using to at least guess
how this would work out:

  * Matrix - could use on phone, not sure it's fun to type a lot there
  * WhatsApp Web - pure convenience, could use on phone, not typing a lot
  * IRC - no problem
  * Slack - I guess this is a problem and I'm not willing to use it on the phone
  * Discord - Same as Slack, really, but I could easily not use it for a week
  * all other websites - should be no problem if I have Firefox
  * music - only via YouTube this week, but I surely could access some local MP3s as I usually do
  * keepass/keepassxc - available via pkg_add, I just didn't search properly

So yes, it mostly boils down to the fact that a major World of Warcraft patch
went live a while ago and that I am spending a good chunk of my spare time
with that at the moment. So I need a computer to run WoW and Discord on.
And some additional resources in the form of (modern) websites and YouTube
videos, but the latter two could be solved.

The only coding I did outside work this week was in rust, and the files sat on
my linux server, where I also compiled them.
I used Visual Studio Code with the excellent remote support to work from
Windows via ssh, but I could've done it with vim, as I did in the past.

Many of the typical use cases that other people mentioned are completely
foreign to me.

Despite writing [lists about windows software in the past](f5nwin),
there's nothing really innate to working on Windows, actually a lot of the
stuff is trivial on Linux or BSD and only needs a special Windows solution.

I do have a couple of spreadsheets in Google Docs, usually when there are too
many columns to use tabs in a text file (I use a lot of text file), but I
hardly ever fire up LibreOffice on my personal machines, maybe a few times per
year, and that has never been different.


OK, that's enough of a wall of text. It was a fun experiment, but I'm not sure
I would've wanted to do this for a full week. Most things except the modern web
seemed to work just fine. I would have needed to use webmail or compile my own
version of mutt. I would have had to use irssi over Quassel, and a few other
small things, but overall it's probably doable (with enough RAM) and probably
even easier with Linux.

But this challenge has shown me that you *should* be able to live with
something like a dual-core 2GHz CPU with 2 or 4 GB RAM, which probably means
a CPU from around 2009, think Allendale or Wolfdale, that's still 12 years old.

But my 1.7 GHz Pentium M (I think it's a Dothan) is a bit slow for YouTube
and modern web apps.

[OCC]: https://dataswamp.org/~solene/2021-07-07-old-computer-challenge.html
[OCCf5n]: /blog/2021/old-computer-challenge-openbsd/
[f5nwin]: /blog/2019/tools-windows-2019/
