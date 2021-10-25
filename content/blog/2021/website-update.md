+++
draft = false
title = "Website updates"
date = 2021-10-25T16:20:00Z
+++

For no particular reason I finally started fixing a few things that had
annoyed me on this website on the weekend, but postponed putting it all
live because I ran out of time.

Back in 2013 when I moved to Foundation as a CSS framework I was lazy and
just used their minified version. The problem is that it's 161.17kb unzipped
and I guess I was using like 10% or less of the features, but loading the
index page of this website was ~180kb and 160 of those was just the CSS
framework.

So I just took the minified blob (because there's no way I can reasonably get
the exact unminified version I copied, years ago) and then I grepped through my
templates and looked which classes I am actually using. Then I went to town
and just copied everything that seemed important out. Seems like I can live
with 10-12 of those 160 kb. The only bug I'm currently seeing are some
line-height shenanigans when the window is narrow.

I guess the endgame would be to look for a CSS framework that only does a grid
in the way foundation does it, that was the only feature why I was pulling it
in in the first place. On the upside, not many visitors means not a lot of
bandwidth wasted. Maybe Pagespeed will now complain less though.

Anyway, it was a good opportunity to fix some CSS things as well, like the
display of code snippets and handling of long blog post titles. And all the
weird margins and empty spaces, although my patience is limited with those.

Also the Favicon situation seems to be even worse than 10 years ago, so there
were a few tweaks.

Then I also took the liberty of updating a few pages:

  * [The Stack](/stack) finally talks about it having ended in 2018, because
    I don't think I'll revive it anytime soon
  * [About](/about) got an update after 3 years and a partial rewrite

So what's left is to put up a TODO, with no time frame to actually do them:

  * completely replace foundation with some minimal grid CSS
  * remove all "reset" css functionality and fix my CSS to still look ok
  * maybe add a syntax highlighter for the code snippets
  * see if my static site generator still works and replace hugo
  * change the font, or at least the fallback font

After completely forgetting that this website (and mostly the blog) had its
tenth birthday this summer (which isn't a great milestone anyway, because I
used its predecessor blog from October 2004 until after this one launched and
that wasn't even my first one) maybe it's time to modernize a few things.
