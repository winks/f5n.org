+++
draft = false
title = "About"
date = 2011-06-18T23:23:23Z
+++



This is the website of Florian Anderiasch, a Software Developer from Munich, Germany. Hi!


### About the author

I'm going to spare you the details, but most of my time is spent building web
applications or other software, poking servers, fixing open source software,
playing games, or ranting. I rant a lot.

The first webpage I put up (on geocities probably) in the summer of '98 started
a career of creating web apps, enjoying server-side scripting languages and
loathing javascript.
I studied Computer Science at
[Ludwig-Maximilians-Universit&auml;t M&uuml;nchen][lmu] ages ago.

I like programming languages, as can be seen in that post where I use 20
different ones to solve the [Advent of Code 2020][aoc2020].

2023 version:

> I'm writing a mix of Java, C++, and Erlang/Elixir in my day job.

In 2018 I wrote:

> I'm not a fan of Go anymore (except for small monitoring checks) and I've been
> doing C++ since December and I'm actually enjoying it. Not as good as Rust,
> but a fun new thing for me.

In 2016 I wrote:

> Now it's 2016 and this paragraph needs to be shorter again, so here
> it goes: less Lua :(, same amount of Python, a lot of Java, no PHP at all,
> learned some Rust, revisited OCaml after 10 years (it rocks now) and still
> haven't had a chance to use a lot of Go. JS/node can still go die in a fire.

In 2014 I wrote:

> These days I'm writing mostly Python and Lua,
> using a lot more Puppet than is healthy for my sanity, only
> occasionally work with PHP, even less with JavaScript (whew) and am not
> actively working on learning new languags, although coming back to Haskell
> once in a while, played with Racket for a few weeks and on my to-do list as of
> summer 2014 are: Go, Rust and Julia, maybe Idris. I actually learned a little
> Ruby in the last year and while not perfect, I see some strengths now.

In 2011 I wrote:

> Nowadays I code PHP for a living, use Java and Python for fun, trying to wrap
> my head around Ruby, C, Lua and Scala, use bash when I need to and write
> Javascript when I'm forced to.


Here are some places I visit and/or post at more or less regularly:

  * [<code class="code">wink&nbsp;&nbsp;</code>@ sup.f5n.org](https://sup.f5n.org/@wink) (Fediverse, English)
  * [<code class="code">wink&nbsp;&nbsp;</code>@ chaos.social](https://chaos.social/@wink) (Fediverse, German)
  * [<code class="code">wink&nbsp;&nbsp;</code>@ codeberg.org](https://codeberg.org/wink) (Code)
  * [<code class="code">winks&nbsp;</code>@ github.com](https://github.com/wink) (More code)
  * [<code class="code">wink&nbsp;&nbsp;</code>@ lobste.rs](https://lobste.rs/u/wink) (Tech)
  * [<code class="code">wink&nbsp;&nbsp;</code>@ hn](https://news.ycombinator.com/user?id=wink) (More tech)
  * [<code class="code">winkz&nbsp;</code>@ reddit](http://www.reddit.com/user/winkz/) (Mostly bikes)
  * [<code class="code">winks&nbsp;</code>@ Pinboard](https://pinboard.in/u:winks/) (Links)
  * [<code class="code">winks&nbsp;</code>@ LibraryThing](https://www.librarything.com/catalog/winks) (Books)
  * [<code class="code">wink&nbsp;&nbsp;</code>@ stackoverflow](http://stackoverflow.com/users/1432620/wink) (Mostly nothing)
  * [<code class="code">???&nbsp;&nbsp;&nbsp;</code>@ kickstarter](https://www.kickstarter.com/profile/1907362337) (More nothing)
  * <code class="code">wink.soup.io</code> - *abandoned even when it worked, because...*
  * [<code class="code">wink's multiplex</code>](http://paranoia.eu.org/) - *I built [my own](https://codeberg.org/wink/multiplex)*

I've closed down my Twitter account in 2023 when all the drama started to heat up and I don't plan to go back.


### About this website

This awe-inspiring website was originally made with [Hyde][] ([code][Hyde2])
and [Vim][] in [2011](/blog/2011/hello-world/).
Both choices were to a small degree inspired by posts by [Steve Losh][sjl],
although I've had read about Hyde before and had used Vim for ages.
But in both cases his excellent articles tipped the point.

In August of 2013 I threw out [Blueprint][] and replaced the CSS with a
responsive layout done in [Foundation][]. That in turn got replaced [in 2022][owncss].

<s>The only JavaScript you'll find
on this website is [Piwik][], although I hardly look at the visits. How useful!</s><br>
No more tracking as of May 2018.

Technically speaking, most static site generators transform [Markdown][] to
HTML and in my case a Makefile does all the plumbing. Not fancy at all.

In January of 2015 I switched over to [hugo][] because of the faster page
generation, the better docs and there being an actual community. I still use
Vim exclusively for updating though and then came some gradual CSS changes.

As of [May 2022][nextgenswitch] this website is powered by my own toy static site generator.
Originally written as a real MVP of the hugo features I use, at some point I made it
work for my basic needs. [Source code is available][nextgenrepo].

Earlier incarnations (of which many never even went public) included [Django][],
[Silex][] and several handcrafted CMS. Didn't we all write those from ca. 2000 to 2005?

For blogs I've used Wordpress, [Serendipity][], and booq, which was my guestbook-turned-blogsoftware
that's been live in version 2.0 as early as 2002. I can only guess 1.0 was some horrible mess.
My guess is that I've looked into 3/4 of all at least semi-popular weblog engines written in PHP, Python,
Ruby and Perl, yet never used them in production.

### Now

So the currently (October 2025) involved technologies are:

  * Sass
  * [nextgen][nextgenrepo]
  * make
  * [Caddy](https://caddyserver.com)
  * [Let's Encrypt](https://letsencrypt.org)

### Privacy

As of now I think the [GDPR][] was mostly a good idea and thus I decided to
kill off any tracking on this Website. No more Piwik/Matomo, no cookies, no
external embeds, and webserver logs are not even written to disk.

Feel free to reach out if you found something helpful or interesting on this site.
Or errors, I bet there are more errors than helpful things.


[lmu]: http://www.ifi.lmu.de
[Hyde]: http://web.archive.org/web/20111222213258/http://ringce.com/hyde
[Hyde2]: https://github.com/hyde/hyde-old
[Vim]: http://www.vim.org
[sjl]: http://stevelosh.com
[Django]: http://djangoproject.com
[Silex]: http://silex.sensiolabs.org/
[Serendipity]: http://s9y.org
[Blueprint]: http://www.blueprintcss.org/
[Foundation]: http://foundation.zurb.com/
[Piwik]: http://piwik.org/
[Markdown]: http://daringfireball.net/projects/markdown/
[hugo]: http://gohugo.io
[GDPR]: https://www.eugdpr.org/
[aoc2020]: https://f5n.org/blog/2020/advent-of-code-2020/
[nextgenswitch]: /blog/2022/switching-to-nextgen/
[nextgenrepo]: https://codeberg.org/wink/nextgen
[owncss]: /blog/2022/theme-v3/
