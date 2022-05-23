+++
draft = false
title = "Self-Hosting"
date = 2022-05-05T11:37:38Z
+++

Recently I've thought a lot about self-hosting, maybe triggered by the whole fediverse hype and how decentralization is actually desirable for many projects.

Not that I usually don't think about self-hosting at all, after all I do that a lot. So what am I actually hosting?

  * a production mail server for 4 users, and some static websites behind nginx
  * a WordPress blog on another VPS, using Caddy and MySQL
  * Quassel (+Postgres) for IRC on a third, this also functions as a test bed for running some other temporary apps
  * a web server for all my random projects and some other stuff, the local dependencies are mysql + postgres
    * RSS reader
    * personal wiki
    * image hosting (a pic dump)
    * my tumblelog
    * syncthing for not-really-important files
    * podcast episode tracker (because I'm bad at remembering done/todo) [&1](#1-jerssey)
    * lately: [ktistec][ktistec] for the fediverse [&2](#2-ktistec)
    * an IRC bot
    * some fediverse and discord bots
    * a dozen cronjobs that fetch data and reformat it for consumption
   
Stuff I hosted in the past, but have stopped:

  * TeamSpeak - everyone uses Discord now
  * Mumble - same
  * Matrix - enjoying my stay on a friend's homeserver [&3](#3-matrix)
  * Jitsi Meet - replacement for Teams in my former team at work [&4](#4-jitsi-meet)

So on the one hand it's nice to have your stuff and also to play around with things that are 'live', even if it only has one user - you still have to think about backups, updates, dependencies, deployment, data, and more. Not that I'd say updating things is a great use of your time, but it's mostly worth it. On the other hand more services have sprung up that promise to let you run things there, no strings attached. Of course that that also sounds nice.

I started by rewriting my small 'what is my ip' tool in TS and deployed it to deno.dev. [Original][ipf5nde] - [Clone][i2f5nde]. I didn't go for 100% feature parity, but it's good enough as a test. There's also [fly.io][flyio], [render.com][render] and some contenders. Sure, you don't have to care for your application  anymore and if you're running an old (vulnerable) version of something, it's not your problem anymore - at least when there's no data to be leaked or if the data is public anyway. But the thing is that you'd kinda have to eliminate everything you're running in order to pare down your attack vectors and get rid of the chores. If I have a docker container with PHP I don't really care if it's serving one 'website' or five of them.

Maybe self-hosting has several use cases and the people vehemently arguing in favor of it are muddling them up a little. Point one is to own your data, but sometimes having your own domain and migrating from one email provider to the next is good enough. No vendor lock-in, so to speak, just a temporary home for your thing. Then there's "not running anything on anyone else's server", which is an angle I don't really have, it's just a lot more convenient for me to have stuff on my own server, if it's something without a standardized way of deployment or if 'run it via cronjob' is the perfect fit. And then there seem to be the people who don't want to have chores but still not be at the mercy of any SaaS, so I guess that's where you run managed k8s on a bigger scale or Heroku/render/fly/etc. on a smaller scale.

## Conclusion

Is there one? Maybe I'm a little weird but for me keeping track of 10 things I have deployed at 10 different service platforms is nearly as bad as hosting them myself, somehow `APP.example.org` seems to stick better if `example.org` is my own domain. My main concern is outdated dependencies, so maybe this problem is not easily solvable. And is it really helpful to have several different deployment pipelines to several different services, who all could change something at some point, whereas on my own infra I choose when I make the jump to a newer (maybe incompatible) major version, otherwise it's mostly chugging along happily on a security-bugfix-only LTS version.

I can see the draw of Go here. The aforementioned REST-backend for my podcast tracker was 750 LOC in PHP (using the Slim framework, a logging library, and a RSS library) and the Go rewrite which is only missing the HTML functionality is 450 LOC and a single dependency, the Postgres bindings. They have a pretty good track record of backwards compatibility, so I am confident that I could just recompile it with future Go versions and it won't break. But I'm surely not advocating to rewrite all your stuff in Go and stop using dependencies, but in this case it kinda made sense.

I still have some concerns about hosting stuff with databases somewhere else, or anything stateful really. If it's just analyzing HTTP requests or has some content in HTML files I can see myself using deno.dev and Netlify more.

## Next steps

I'm not sure I found out some actionable advice here. I'll definitely be looking at fly.io and render and see what I could use them for (hosting a docker container would be awesome, but need to check the price first - it's always the price. I can run 20 small things on a 5€ VPS, why would I pay 20 times 5€ for an app I use a couple times per month?) Also maybe I should be looking into managed k8s, that might be this single interface deployment I am looking for... Also the things that are the easiest to hand off to e.g. Netlify are also the ones that are the easiest to host. A docker container for nginx and provide SSL for it, done.

## Pseudo Footnotes

### &1 - Jerssey

I wrote the backend of my Podcast Episode Tracker Jerssey in PHP ([Slim][slim]) originally, for nostalgia reasons and to see if I can still do it after not having used it for over 5 years, but at the moment I am rewriting it in Go because I don't agree how many dependencies (direct and transitive( I am using for an actually tiny amount of functionality in a REST api. The client is a Qt desktop app that I use on Windows, but it also works on Linux. I have not open-sourced any of these three components, maybe I will.

### &2 - ktistec

I have nothing against Mastodon per se, but I think it's complete overkill to run a Mastodon instance for a single user, so I was searching for alternatives. I looked at [honk][honk] but I think it's more performance art than a usable piece of software (at least to me), I tried [GoToSocial][gotosocial] but I was not enthusiastic about it, especially as it lacks a frontend of its own and it also didn't seem to do what I told it to do, but I'm not ruling out an error on my part. Then there's [epicyon][epicyon] which I haven't tried to run yet and finally [ktistec][ktistec], which advertises itself as a lightweight single-user application and it just worked.

### &3 - Matrix

First of all, I love Matrix. Maybe I'm biased because it reunited me with some folks who had left our IRC channel one by one, and now we can talk again - and it works perfectly fine for this use case, even on mobile. Unlike in the fediverse I think it's very ok to tag along on someone's instance, at least how I use it. I am in a channel with a nick I choose. I could replace my 'connection' anytime, the 'hostname' doesn't matter, just like on IRC.

### &4 - Jitsi Meet

Yep, the experience for a team of six was better on a jitsi instance on a 5€ VPS than the Microsoft Enterprise[tm] solution. I wouldn't want to host (and scale) this productively (it could work, but I didn't poke deep), but it was good and we could of course fall back to teams. Also I wasn't comfortable having work meetings on a random instance, in this case I could make sure nothing was recorded and leak, so it was fine.


[gotosocial]: https://github.com/superseriousbusiness/gotosocial
[honk]: https://humungus.tedunangst.com/r/honk
[epicyon]: https://gitlab.com/bashrc2/epicyon
[ktistec]: https://github.com/toddsundsted/ktistec
[ipf5nde]: https://ip.f5n.de
[i2f5nde]: https://ip-tools.deno.dev
[flyio]: https://fly.io
[render]: https://render.com
