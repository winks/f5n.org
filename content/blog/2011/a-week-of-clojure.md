+++
draft = false
title = "A week of clojure"
date = 2011-10-06T17:00:00Z
+++



The basics
----------

Having started playing around a bit with [Clojure][] in late July after reading a post named 
[Clojure on Heroku with Noir and Mongo in 10 minutes][CHNM10m], a holiday week 
gave me a bit more time to dig deeper and continue my project.

At times I felt like a complete newbie, never having touched any LISP dialect and only dipped 
my toes into some functional programming (OCaml and SML at university, despising the former and being at 
peace with the latter, some hours trying to decrypt Haskell, which seems ok but is not really my cup of 
tea, and to a degree JavaScript, for which I've not got a single positive thing to say).

The [official Clojure docs][clojure-doc] are somewhat helpful, I've been pointed at [ClojureDocs][] for an experience 
more akin to the excellent [PHP manual][php-doc], with fancy code samples and stuff, but I've not yet had to use 
it very much. Then again there are [several][ociweb] [entry-level][moxley] articles I've read over and over which proved to 
match my approach to language-learning a bit better.

I'm somewhat familiar with Java, so Clojure running on the JVM was a big bonus point, I thought.
So far I've been doing stuff basic enough that I hardly needed to call any Java APIs, still I found it 
somewhat helpful that this ecosystem isn't a complete stranger.

The project
-----------

This time around, I just took a piece of [software][battlenet-py] implementing an [API][blizzard-api] 
and ported, err, rewrote it in a new language: Clojure.

For all of you not familiar with World of Warcraft, it's an online game where you kill internet dragons 
together with friends and acquantainces. This aforementioned API lets you pull machine-readable data 
about your avatar, your guild, the server you play on, etc.pp. and do fancy stuff with it.

If you're more interested in the code, it's [on github][github-winks-battlenet].


Project setup
-------------

Whatever you plan to do, get [leiningen][] first. Yes, it's that good. It basically gets you running with 
a clojure project faster than you can read your introductory tutorial, but still not being a beginner-only 
tool (or so it seems). Doesn't get in the way, does everything you expect it to do - just awesome.

As an IDE I'd started with [vim][] and [vim-clojure][] in July, but decided to try [counterclockwise][ccw] on 
[eclipse][] this thime. Apart from missing autocomplete the colorized parentheses alone was worth it. Plus, 
if you know eclipse already, you've got your standard set of tools and shortcuts. In short, it works fine.
See [this post][ccw-lein] for instructions to integrate leiningen into ccw.

For testing purposes, as I wanted to start as small as possible, I've just used [clojure.test][] for unit and 
integration tests. A call for some coverage tool yielded [radagast][], which is easy enough to use and does its 
job, although I couldn't get the ignore-feature to work. PEBCAK probably.

Apart from that, I'm developing on Windows 7 (mock me if you like), and 2-3 open cmd.exe and also GIT bash (which 
seems to be my standard windows shell lately) and it works.

Progress
--------

I think I've accomplished most of the goals I've set myself, translating most API endpoints into something accessible, 
without the need to think about any json. Yes, you still need to know the internal setup, but I'm not sure just how many 
of these helper functions make sense:

    (defn get-name
      [input]
      (:name input))

When I was mostly finished with my API wrapper, I decided to make a frontend. Or maybe that was the plan all along.
Enter [Noir][], the web framework already mentioned in the article I linked in the first paragraph.

Again I might sound easily excited but after using a ton of frameworks in various languages I claim the right to 
suggest you have a look at it, it's tremendously fun to use and, for my limited understanding of clojure, makes a lot 
of sense. Plus it's built on top of some libraries that seem like the de facto standard in clojure web development, 
always a huge plus.

The noir project is [also on github][github-winks-battleweb]. Right now I'm using a file-based [h2][] database which 
also seems to be the culprit of low performance when doing DB stuff. My bad, but didn't feel like getting a mysql on 
my workstation and forget redis or mongo on windows. Tough luck. Clojure+Noir alone, without DB access, seems blazingly 
fast, or at least decent, my performance tests aren't even worth publishing.


Problems
--------

When you're coming from an object-oriented background (hey, at least I didn't say procedural) it sometimes is 
very hard to leave your tried-and-true practices behind and try to write code that seems to fit. I don't think 
I'm anywhere near writing decent or pretty clojure code, but I hope the people aren't bursting out in tears either.
One example was my seemingly good idea to convert the data model into plenty of defrecords when in the end the map 
that read-json yields is perfectly well suited to do the job.

One thing I'm not really accepting as "solved" is that of deployment. I've found several blog posts and SO answers, 
but for my testing needs I'm still at "lein run" in a screen behind nginx, no luck deploying an uberjar or building 
a WAR file. Probably PEPCAK again, but not easy as pie either.

Getting help
------------

For simple problems, the aforementioned websites answered most of my questions, but still the most positive experience 
has been the irc channel [#clojure][] on [Freenode][]. I tried to ask concise and not-completely-stupid questions and 
was still quite surprised about the fast, detailed and enlightening answers. I know from experience what complete nuts 
you can experience on various channels, so this was a bit unexpected - and very helpful.

When I had completed some major parts I even asked if anyone got a spare minute to look over the whole code of the two 
projects and while the general feedback was surprisingly positive, and I spent a few hours fixing my mistakes. That is 
to say it was that much feedback, not that the code was that bad, of course ;)

The future
----------

It's been a fun week and I'll definitely try to learn more about clojure and maybe even get something useful live out 
of my project. Not useful to most people, but the [battleweb][github-winks-battleweb] project is something I've written 
twice already in PHP and once in Python+Django, because there are some features I use :)

One of my key interests is always the development of tools for developers (like my eclipse plugin [Cinder][]) so maybe 
the tool chain of a clojure developer is worth a deeper look and something's missing that other language's users are 
using.

[Clojure]: http://clojure.org
[CHNM10m]: http://thecomputersarewinning.com/post/clojure-heroku-noir-mongo
[ccw-lein]: http://sexp.posterous.com/poor-mans-integrating-leiningen-into-counterc
[clojure-doc]: http://clojure.github.com/clojure/clojure.core-api.html
[php-doc]: http://php.net/manual/en/
[h2]: http://h2database.com
[Cinder]: https://github.com/winks/cinder
[github-winks-battlenet]: https://github.com/winks/battlenet
[github-winks-battleweb]: https://github.com/winks/battleweb
[#clojure]: irc://irc.freenode.net/clojure
[Freenode]: http://www.freenode.net
[Noir]: http://webnoir.org
[ociweb]: http://java.ociweb.com/mark/clojure/article.html
[moxley]: http://www.moxleystratton.com/article/clojure/for-non-lisp-programmers
[battlenet-py]: https://github.com/vishnevskiy/battlenet/
[blizzard-api]: http://us.battle.net/wow/en/forum/2626217/
[leiningen]: https://github.com/technomancy/leiningen
[vim]: http://www.vim.org
[vim-clojure]: http://www.vim.org/scripts/script.php?script_id=2501
[radagast]: https://github.com/technomancy/radagast
[clojure.test]: http://clojure.github.com/clojure/clojure.test-api.html
[eclipse]: http://eclipse.org
[ccw]: http://code.google.com/p/counterclockwise/
[ClojureDocs]: http://www.clojuredocs.org