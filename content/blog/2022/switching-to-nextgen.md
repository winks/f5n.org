+++
draft = false
title = "Switching to nextgen"
date = 2022-05-24T11:05:54Z
+++

Last week I finally bit the bullet and, after changing the font,
made the few remaining switches. This website is now generated via [nextgen][ng].

There are still a few things to clean up, but overall I'm happy - there was still
one missing feature I had to add - copying the static assets from the theme folder
to the `public` folder. Oh, and themes are now called blueprints,
[because it makes more sense][bp]. Unfortunately I'm way past my original 333 lines
of code, but it was just a fun coincidence anyway.

The actual 'switch' [commit][co1] is kinda tiny, but being very compatible with `hugo`
was one of the stated goals. Of course the [commits][co2] for the templates weren't
quite so small.

The Atom RSS feeds should be similar enough (especially the IDs) as to not confuse
any RSS consumers, but apologies if you're being spammed with 10 years of posts
now.

So there are still a few little things to implement in `nextgen` but if it can
generate this site it's good enough.


[ng]: https://github.com/winks/nextgen
[bp]: https://soupault.app/blog/soupault-4.0.0-release/#introducing-soupault----blueprints---
[co1]: https://github.com/winks/f5n.org/commit/1603bc8bca34df03287a22487c152257b1ea4a28
[co2]: https://github.com/winks/nextgen-blueprints/commit/df0242387162a1faf33c22a8910628e16d84dbed
