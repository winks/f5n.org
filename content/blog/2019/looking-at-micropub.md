+++
draft = false
title = "Looking at Micropub"
date = 2019-11-11T23:53:23Z
+++

I'm not new to [IndieWeb](https://indieweb.org/) but apart from implementing
webmentions in clojure [a few years ago](https://github.com/winks/webmenjion)
I never really participated.

This weekend I thought about how I use social media and if I want to preserve
and "own" some of those posts, so I looked into it again. What's interesting
to me is Micropub and maybe being able to import stuff from Foursquare and
Instagram and maybe post some quick notes from my phone or a computer without
having to ssh to this box and write a post with vim and markdown :)

So here's a little braindump on tools and misc.

On a computer I like the token login via OAuth. Github is fine here, but doesn't
work on my phone where I am not logged in and with 2FA it's a real hassle.

  * [Micropub/Client](https://indieweb.org/Micropub/Clients) - "official" client list
    * [Indigenous for Android](https://indieweb.org/Indigenous_for_Android) - unsolved login problems
    * [tt-rss-micropub](https://indieweb.org/tt-rss-micropub) - sounds interesting
    * [OwnYourGram](http://ownyourgram.com/) - grab instagram posts
    * [OwnYourCheckin](https://indieweb.org/OwnYourCheckin) - grab foursquare/swarm posts
    * [Quill](https://indieweb.org/Quill) - web UI, need to test this
  * [Micropub/Server](https://indieweb.org/Micropub/Servers) - "official" server list
    * [nanopub](https://indieweb.org/nanopub) - looked good, didn't work for me
    * [micropub](https://github.com/skpy/micropub) - sounded nearly as good, worked 90%. [Probably not maintened soon](https://skippy.net/bash-blog)
    * [hugo-micropub](https://codeberg.org/jlelse/hugo-micropub) - this posts to git, I think I don't want that
    * [www-api](https://www.jvt.me/posts/2019/08/26/setting-up-micropub/) - this posts to gitlab
    * [mastr-cntrl](https://vincentp.me/articles/2018/11/14/20-00/) - this uses node.js and seems not very general
    * [flask-micropub](https://github.com/kylewm/flask-micropub) - not updated for 2-4 years

TLDR: Nearly everyone who wants micropub support writes their own library,
endpoint, or whole cms or blog engine. Not that this isn't fun, but right now
I'm just looking for a minimum viable product to be able to use micropub.

The PHP micropub project does exactly that, but not sure it's worth forking and
adapting at this point. I didn't look at hugo-micropub yet but maybe I can rip
out the git integration and just let it create markdown files. Finally, there's
nothing written in Rust yet :P

I'll probably first try to hack up php-micropub for quick results and then see
if I need to rewrite it.
