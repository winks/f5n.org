+++
draft = false
title = "Dell Latitude 5310"
date = 2021-02-26T15:30:00Z
+++

I started a new job in February and with it came a new work computer, it's a Dell Latitude 5310
with an i5-10310U, 16GB of RAM, and a 256 GB SSD. I also got a USB-C docking station.
It's the first non-ThinkPad I've been using for any serious amount of time since 2010,
I think (W500, x230, T460p, T470p).

On my first day they handed me an XUbuntu 20.04 usb stick and that's probably what I would've
chosen anyway, given the fact that Ubuntu was recommended. Installation worked flawlessly and all
the hardware seems to work fine.

I didn't use it without an external keyboard, mouse, and monitors a lot, so can't really
comment on the mobile aspect, but the one time I used it off the grid I missed the trackpoint
dearly, but I've never really been a fan of touchpads since my first laptop in 2004 (good old
HP nx7010) and when I used it at uni I always brought a mouse if I had enough room.


Overall I'd say as a non-mobile work computer it seems fine.

  * Have not yet exhausted the 16GB of RAM, unlike at my last job
  * CPU wasn't a limiting factor yet, but I'm doing Java and not compiling C++ all day
  * the screen looks good
  * the camera quality is decent, I'd say much better than the T470p's
  * I'm actually surprised how thin and light it is


There are some problems though:

  * some coil whine - worst when scrolling in IntelliJ, and only there
  * need to manually set audio in/out after every plugging in, sometimes after resume
  * on some days I need to replug both monitors after resume
  * if it is on 100% CPU, you can hear the fans
  * the ethernet port is one of those weird ones you have to pry open like a drawer

So coil whine and a wonky docking station (K20A001), the rest is not really worth mentioning.

Like on my last work computer I went with [Regolith](https://regolith-linux.org/) via PPA, so
I have a fully functioning i3 window manager and still some nice desktop environment features.
Wrote [about it](/blog/2019/switching-to-regolith/) in summer 2019 and now all the problems I
had were all solved, I don't think I noticed a single one in nearly one month of usage now.

This is the first time I did not try to get rid of network manager but am actually using the VPN
integration as well.

Also for technical reasons I need to participate in 1-2 actuall phone conference calls per week
instead of just Slack/Zoom/whatever and so I'm using a SIP client for the first time. I went with
the Linphone version that is packaged in Ubuntu (3.x), it's very bare-bones and the setup wizard
has a bug but you can work around that and inputt your details manually. I connected it to my
fritz-box and chose the 2nd phone number we don't actively use. I've been getting a few calls from
unknown callers now (the number was actively muted before I started using this sip client), so I
think I need to tweak a few things there, but overall it's so much better on the computer.

I started with [this guide in German](https://blog.hommel-net.de/archives/556-Telefonieren-unter-Linux-mit-Linphone-und-der-Fritzbox.html)
but then had to tweak some things.

<p>
<pre>
; Linphone
sip identity: sip:user@192.168.0.1
sip proxy address: sip:192.168.0.1
transport udp
"resulting sip address": "User" [sip:user@192.168.0.155]
SIP/UDP port 5061
SIP/TCP port 5061
Audio RTP/UDP: 7078
Video RTP/UDP: 9078
[x] Direct connection to the internet


; FRITZ!Box
Port forward 5061/udp to the computer with the sip client
</pre>
</p>

I probably should've gone with installing version 4 from somewhere else than apt but it works now.

Also this time I wanted to separate all (well, most) private stuff from the work computer.
I actually already have an Xubuntu Desktop VM running on my home server, and I can connect to it
via libvirt over ssh and it's lagfree enough that I can have a browser for Amazon or an IRC client
running there. Still can checkout and push to personal git repos from the work computer
(dotfiles, etc) but the browsers are not littered with personal logins (again, with a few
exceptions, of course), which is really nice so far.

So I wouldn't go as far as recommending the Latitude 5310, but overall I'm happy with it, I guess.
Sadly I have no recent experience with thinkpads in docking stations (I think I had one in 2010?),
so maybe these monitor problems are more universal. Looking around for a very brief time it seems
to cost around 1200 EUR. If I'm not mistaken the specs roughly match the ThinkPad X1 Carbon, which
is roughly 1800 in a similar configuration (CPU, RAM, 512 GB SSD, so maybe -100 EUR). On the other
hand the current X13 is roughly the same price, and the T14 with a bigger screen is ~1700, whereas
there seems to be no more T14p model, only a T14s, and I heard those had some performance/cooling
problems in the past. I probably would've chosen a ThinkPad E15 Gen 2 with Ryzen 7 4700U with a
512GB SSD and a 15.6" display in the ~1k EUR range, it should be bit faster, a bit cheaper and
after having a Ryzen workstation I'd be confident enough to put my own money on it.

Still a bit surprised I got handed a small 13" laptop when 90% of the time it will be sitting on my
desk and plugged in to external peripherals, so I would've preferred a 15", but I guess being able
to choose your hardware becomes less likely the bigger your company is. Or at all. At least this
time it doesn't seem to be completely unfit to do the job, because that last T470p with an i5 with
only 4 threads and 16GB reached its limit already in the first week when I tried to compile LLVM...

