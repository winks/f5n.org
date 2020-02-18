+++
draft = false
title = "Update Woes"
date = 2020-02-18T20:09:04Z
+++

My phone is a Nexus 5X, I bought it on July 21st, 2016 - that's 3 and a half
years ago. According to [GSMArena][gsma5x] it came out in October 2015, so it
wasn't exactly brand new - but it was affordable and it was the best phone I
ever had. I had (and have) no plans of replacing it, but Google stopped
shipping security updates in December 2018, and I somehow missed this and was
a little shocked when I noticed a few weeks ago - and I'm on a kind of ancient
version of Android 8.1.

So I had the plan to install [LineageOS][LOS] because I had heard good things
about it, [the device seems to be supported][LOS5XDL].

So last Saturday I pulled the plug. The last time I had put a ROM on a mobile
phone was probably in 2016, maybe 2017.

The installation [instructions][LOS5XINS] were straightforward.

  * boot into bootloader
  * unlock bootloader
  * flash recovery
  * boot into recovery
  * wipe phone
  * sideload the OS
  * add Google stuff
  * reboot

All this worked flawlessly and close to midnight on Saturday I had a
phone with a new OS, still 8.1. - but built in 2020 and not in 2018.

I was a little surprised I could just restore from (Google Cloud-) backup, but
it went fine and so I went to sleep at some point.

I got up on Sunday, the phone was charging overnight and unplugged it around
noon and let it sit on my desk. In the evening I had a look at it and it had
gone dark. Weird. So I started it and that's where the fun part of the story
begins. It was stuck in a boot loop. Great. Couldn't even get into recovery,
no matter what I tried.

So I didn't try too hard to solve it any further and did what everyone would
do on such an occasion. Find out where the project IRC channel is and ask
there. Didn't get answer in the morning but it was kinda quiet. So I asked
again in the evening and got some hints, but nothing that made me go "yay,
solved" instantly. Meanwhile after the phone being unplugged for hours I
actually managed to get it to boot once, but it went out after like 10 minutes
again, just when I had stopped looking at it.

The final thing I tried was flashing TWRP-3.3.0 instead of TWRP-3.3.1, but I
don't really see how the recovery would influence anything, but as I couldn't
boot into the recovery I had flashed I wanted to try this first.

Intermission: The Nexus 5X is a little infamous for being stuck with a boot
loop, many people have experienced that - I personally know two people. One had
it soon enough to just get LG to replace the phone. So one of the interesting
links was [this one about boot loops][N5XBL]. I did find it kind of unlikely
though that after 3.5 years of daily use it would just get this issue 16h after
I had flashed another OS. Weird coincidence.

Some reasearch also resulted in some people saying that they did the ghetto
reflow version that's been around since at least the XBox 360 days - take out
the board and put it in the oven for 5-10 minutes at 200°. I had wanted to try
that with my 360 when it was locking up while playing Rock Band a lot, but I
never did it. So with no high hopes to ever fix the phone I did just that.

Disassembled it, took the board out (was surprisingly easy) and baked it for
6 minutes at 200°. Let it cool for 10 minutes and what can I say? Plugged it in,
phone booted up just fine (albeit with an empty battery) and it's been running
for roughly 24h now. The camera works and I'm a bit wary of surprises but it
seems good.

I have a second Nexus 5X here that's as old and it doesn't recognize any SIM
cards anymore. Now that I know it can be easily disassembled I'm inclined to
do that in the near future and investigate if I can somehow see a mechanical
problems and maybe properly touch of on the solder of the SIM slot parts. Or
just get to baking again. Wouldn't hurt to have a working backup solution -
I don't see a compelling reason to buy another 250 EUR phone when this one
works just fine - if only it weren't for lack of updates...

Thanks to #lineageos on Freenode for help and emotional support :)


[gsma5x]: https://www.gsmarena.com/lg_nexus_5x-7556.php
[LOS]: https://www.lineageos.org/
[LOS5XDL]: https://download.lineageos.org/bullhead
[LOS5XINS]: https://wiki.lineageos.org/devices/bullhead/install
[N5XBL]: https://forum.xda-developers.com/nexus-5x/general/tool-bootloop-death-blod-workaround-t3819497
