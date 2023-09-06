+++
draft = false
title = "Trying out some hosting options"
date = 2022-06-14T10:30:47Z
+++


In a mood of looking into not self-hosting every small tool I wanted to try out a few of the options that are around now.
Not that self-hosting is bad per se, for some of these things I thought it would be nice to get them into some sort of
shape to be able to host them somewhere else, especially if they're stateless and don't have any external dependencies.

### TypeScript + Deno Deploy

While I've never been a fan of nodejs, I am drawn a lot more to [deno][deno] and so I set out to rewrite a 
very small and very old project I'd cobbled together and had been using for 9 years.

The project is hosted at [ip.f5n.de](https://ip.f5n.de) and [i.f5n.de](https://i.f5n.de) and simply displays the IP address you're connecting from, and some HTTP headers plus your IP, respectively.

[Here's][ipphp] the PHP source code, it has gained a few more small features over the years,
for example showing the ASCII table,
converting unix timestamps to dates and back, converting from decimal to hex and binary.

And [here's][ipts] the rewrite in TypeScript, which I then put on [Deno Deploy][denodeploy] on their free tier.
This is just connecting the repo to their Github App an now every push does a deploy.
If you configure the DNS TXT records correctly, then you also get SSL on your own subdomain via Let's Encrypt - nice.

Everything has been completely smooth here and I didn't run into any problems.

I did the same thing for another small project, but it's 100% the same setup, so I won't elaborate.
Roughly the same age, ~150 lines of PHP code (nothing wrong with the code, it's kinda trivial as well),
and I also rewrote it in TypeScript, cleaned it up, and moved it to Deno Deploy, also keeping the old
code running on my server under a different URL.


### Clojure + Fly.io

This project is also over 10 years old and is written in Clojure, and the way I have used it so far is a bit of a
convoluted mess. Cron runs a shell script, which runs commands via Make in a container.
On top of that the Clojure app itself was only running via `lein run TASK`, but speed isn't really important.

On the other side the offering by [Fly.io](https://fly.io), running a container for free with 256MB RAM, sounded quite interesting,
and I wanted to try them out anyway so I saw a possibility to make this work.

Of course (at least to me) running something like a cronjob in a hosted container doesn't really match, so I bit
the bullet and wrapped my CLI tool (with some library functions) into being exposed as a web service, which I could
then host there and call via cron again - which is no problem.

I don't want to go into too much detail here regarding the refactoring and adding features, but focus on the deployment.

My first try was using the `clojure:openjdk-8-lein-slim-bullseye` docker base image I'd been using so far,
but while I did get the app to run on Fly.io I had it crashing by going OOM a lot, despite experimenting quite a bit
with the `-XmxAAAm -XmsAAAm` flags. The app itself is not actually doing a lot, it exposes a web server and then
it fetches 2-20 smallish JSON files, extracts a few values, and writes them to HTML report.
This simply should not use up a lot of memory, as it's always just 2 JSON files at the same time, the other pairs
are fetched and processed sequentially.

There wasn't a real change with the jdk11 image, but to my surprise using the `clojure:temurin-17-lein-alpine` with
`-Xmx192m -Xms192m` seems to have done the trick. While I did know you can't just assume 256 MB for the heap if all
you have is 256 MB, I don't have a lot of experience with these numbers, but I found the 'allow around 25% of leeway'
in a blog post and yes, it seems to work just fine.

Overall the experience with Fly.io wasn't as great as with Deno Deploy I have to admit, but it wasn't exactly bad.

First of all you need to enter your credit card details, even if you simply want to try the free plan.
I understand their angle but I don't have to like it.

Then their docs aren't too great, but maybe only for this 'run your own Dockerfile' use case I looked at.
[The docs][flydocker] kinda tell you what to do, but not detailed enough.

They tell you to run `flyctl deploy` but for some reason insist on building the image from your Dockerfile
themselves (but on your local machine) instead of maybe using the image you just built 5 minutes ago for testing.
Again, not the end of the world, but if they only would at least tag them so you'd see which ones those are when
running `docker images`, but they're all "unknown" and you need to clean up carefully. Should be really easy to
tag them with some fly-deploy-timestamp string.

Once you managed to have your image deployed you might wonder why it's not reachable via the provided url.
Their `fly launch` tool (why are half the commands `fly` and half of them `flyctl` btw?) has helpfully generated
the `fly.toml` config file for you, but it was populated by some values you absolutely need to change but they're
not documented in the file and the docs on the website could be better.

**Caveat 1:** The port. If the tool analyses your `Dockerfile` and creates a config, I would have expected it would
default to the `EXPOSE` port or mention that on the website. Nope, you only find that in the [troubleshooting guide][flytrouble].

**Caveat 2:** I still don't know exactly what these numbers mean, but under `[services.concurrency]` there's a default
hard limit of 25 connections, which I ran into when requesting 20 JSON files and then accessing my deployed container.
I don't want to blame them here really, because I've simply not understood if the http client I was using in my code
still had dangling connections, or what happens when I request a web page with 25 images. So far I have changed my
code to use a connection manager to reuse the connections, and also upped this limit to 50 and I've seen no further errors.
The problem here is that I don't know how to find out what they count as "concurrent connections", especially when
serving web pages.

**Caveat 3**: There are some health checks by default, e.g. 'the port you gave is available via tcp after N sec' but
again it's there as a default with no explanation so I had to find the [fly.toml docs][flytoml] and find out where
this failing health check that I didn't ask for is coming from.

While you deploy you can see the logs for this container on the web page, this is pretty nice, but it repeatedly
stopped working with the helpful "this page has stopped responding" popup in Firefox.

Apart from those little annoyances (and the only WTF one being the port) it was a good experience.
Still a little worried I might overstep the free tier but we'll see.

They really need to improve their "First steps with a Dockerfile" document, otherwise it was fine, you just need to
find the docs and actually read a lot. Maybe I'm a bit unfair here but this is a very basic container with a very
basic web app. If it's booted up it will serve a plain html page at /. No database, no external systems.
If you ignore my starting problems with the RAM (which I don't blame them for), this part should've been easy from
a given Dockerfile.

I want to try out some other runtime and maybe also connect to a database (I have another project of mine on my mind),
but for JVM stuff the 256MB seems a little on the low end. No complaints towards fly.io here, just an observation, more
of a blame of the JVM :P


### Conclusion

I've always been a fan of the Heroku idea, easy deployments and then not having to care about stuff, but the only time
I actually tried Heroku I wasn't amazed by the performance.

But now I found not one, but two offerings that 100% fit my needs, and that's serving some very basic small apps
(disclaimer: my Clojure container is actually huge, but I swear that it's not my fault, sorry fly.io) for free.

There have been a lot more sites where you could deploy static sites (I have one small project on netlify and it also
just works) but this is what I need, not so much JS frontend, but actual server side code. I mean, to be fair, you
could probably rewrite the two aforementioned TypeScript projects to be client-side only, I haven't tried it.

So far I fully recommend trying out Deno Deploy and fly.io - but I can't yet say if their paid plans are worth it over
self-hosting on a VPS. For someone like me who enjouys the tinkering.. probably not. You can put a LOT of low-traffic,
low-CPU projects on a 3 EUR cloud VPS instance.


[deno]: https://deno.land/
[ipphp]: https://github.com/winks/art-core/blob/668320e0de751d3192e781620441b73abd4d0143/i/index.php
[ipts]: https://github.com/winks/ip-tools
[denodeploy]: https://deno.com/deploy

[flydocker]: https://fly.io/docs/getting-started/dockerfile/
[flytrouble]: https://fly.io/docs/getting-started/troubleshooting/
[flytoml]: https://fly.io/docs/reference/configuration/
