+++
draft = false
title = "Theme V3"
date = 2022-05-06T15:45:00Z
+++

Over the last few evenings I spent a little bit of time on the CSS for this
website, I can't say I was particularly enjoying it though.


Back in [October](/blog/2021/website-update/) I was ripping out most of that
old version of Foundation (which was huge), but it was still a bit of a mess
and 8.5 kb of copied minified CSS were left.

So I started from zero and only ported what I needed from my SASS file, then
imported those 5 classes I use from Foundation, and I even rewrote
most of those. Now I have my own (bad) version of a CSS grid, using 
`display: flex` in a parent div. It seems to work well enough though.

Hat tip to [enough.css](https://github.com/jeffkreeftmeijer/enough.css) which
looks good (and I stole a few bits), but I think it doesn't make sense to
use it verbatim if you already have something you like and just redo
the styling from scratch. I might actually use it for other projects.

Anyway, everything seems to work and it also looks fine in a very narrow
browser window (just with about half the `max-width` code now), there's only
one "bug" I still need to track down, there's always horizontal scrollbar in
mobile mode, probably a stray margin or padding - but that's not urgent now.

The landing page is now 5.3 kb of HTML + 4.2 kb of CSS + a 9.6 kb Favicon.
Oh well.