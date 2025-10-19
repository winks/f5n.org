+++
draft = false
title = "A New Dev Environment"
date = 2025-10-19T16:37:09Z
+++

A while ago I noticed that I had not been happy with my "development environment" at home.
This mostly means that when I am on my main machine it's usually booted into Windows
because of some games and I hate developing stuff on Windows and I don't like WSL either.

So I was looking to buy some Thin Client (Fujitsu Esprimo or similar) and put
Linux on it and then have something to remote into. But I couldn't decide what
exactly to get, then I accidentally bought a wrong thing on eBay (mostly
because the picture was a little dark and it was nearly the correct model
number), but fortunately could cancel (or I'd have a proper desktop PC,
nearly as big as a midi tower).

In the end I had been annoying the crowd on our Matrix channel enough with my
indecisiveness that someone remembered they had an old unused NUC I could just
come and grab, so I did exactly that.

So here's [brick](https://wiki.art-core.org/pub:brick):

  * Intel NUC DC3217IYE
  * i3-3217U (Q4 2012)
  * 16 GB RAM I stole out of my x230 for now
  * 30 GB Kingston mSATA SSD (probably need to order a newer, bigger one)

And it's been chugging along nicely for a couple of days now.

I put Arch on it and after some fiddling I ended up with xrdp + xfce4.

This means I can have a full screen session on one of the 27" monitors,
and still minimize it, and leave stuff running. And connect from several
other machines (tried Windows 11 and OS X, have yet to try Linux) - and all
of that without noticeable lag.

These are things I tried first:


  * RustDesk - laggy as hell, locally on wifi and plugged in
  * `wayvnc` didn't work at all, verbose also said nothing, or it crashed
  * TigerVNC and X11 - fiddling with :0 and :1, not great
  * i3 - no matter what I tried I couldn't get Alt or Super as mod key working


With this "meh, I don't want to work on a laptop" out of the way I've been busy with a couple projects now.

  * Rust
    * [cerith](https://codeberg.org/wink/cerith) (irc bot) - updated, tested, moved to Codeberg
    * [nextgen](https://codeberg.org/wink/nextgen) (static site generator used for this) - updated, tested, moved to Codeberg
  * Clojure
    * [multiplex](https://codeberg.org/wink/multiplex) (tumblelog I use for music) - updated, tested, moved to Codeberg
    * [battlenet](https://github.com/winks/battlenet) (lib for reading Blizzard APIs) - updated, tested, some feature in progress
  * Go
    * [feedfoo](https://codeberg.org/wink/feedfoo) (blog post to fediverse announcer) - updated, tested, moved to Codeberg
    * [cssmin-go](https://codeberg.org/wink/cssmin-go) (css minimizer) - tested, moved to Codeberg
    * Jerssey - [Backend](/blog/2025/a-podcast-tracker/) (podcast tracker) - nearly finished the go rewrite, planning to publish
  * C++
    * Jerssey - [Client](/blog/2025/a-podcast-tracker/) (podcast tracker) - still builds with Qt6 (on Linux) but need to try to build on Windows

Nothing terribly big, but I'm happy it got done. Copied (not moved yet) a good
chunk of "usable" projects over from Github to Codeberg, some dependency
updates, some small bug fixes, nearly finished one rewrite.

Also the cleanup of old Github projects continues, still a lot to do.
