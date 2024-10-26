+++
draft = false
title = "Self-Hosting Update"
date = 2024-10-26T19:49:49Z
+++

I wrote about self-hosting stuff [in 2022](/blog/2022/self-hosting),
since then I've made a few changes:

  * server 1 - a blog
    * Debian 12 with podman (not happy with the rootless setup)
    * Caddy, Tailscale, grafana-agen on the host
    * MySQL in a container
    * PHP + Wordpress in a container
  * server 2 - irc, websites
    * Ubuntu 22.04 + Docker
    * some containers:
      * Caddy for a few static sites
      * quassel-core for IRC
  * server 3 - mail
    * Debian 12 + Docker
    * mailcow
  * server 4 - web & misc
    * Ubuntu + Docker
    * some containers:
      * freshrss (migrated from TT-RSS)
      * dokuwiki
      * linkding (trialing a move from pinboard.in)
      * ktistec (single user fediverse instance)
    * file hosting
    * several tools
    * several websites
  * server 5
    * Debian 12
    * pulling backups from all other server
    * syncthing

So I guess there are a couple of servers that are *important* - that would be
mail & web - then some that are used a lot but not important: irc, and one
that is just for backups and not really actively accessed. And the first one
is important enough to be on backup, but if something happens I'll just redo
it.

The irc server is also the playground if I want to spin up something in a
container, so maybe kind of a staging server.

So I suppose I'd still be very much happy with a setup where I can just push
a container, assign a hostname and boom, no more server troubles. The problem
with that is that it doesn't really work if you have 20 small containers
without a lot of load, kinda expensive everywhere - or at least more expensive
than slapping a couple of them on a 5 EUR Hetzner VPS, which is what I am
mostly doing here.

Still missing one big machine, but everytime I need to reboot it, or something
is up, then all services would be down, this kinda lowers the blast radius for
my non-critical stuff.

Doesn't mean I am *happy* - I suppose if I wanted to spend more money I'd get
2 bare metal servers for 40-50 EUR and host everything on one, and have the
backups on the other one with some kind of manual failover setup so with just
a couple DNS entries I could host everything over there. But that's twice the
price and I don't want to pay that.

Also this had been sitting in the drafts folder since August 2023 and I kinda
had to rewrite half of the list above, because I only went back to Debian
since then, so 3 of the 5 VPS aren't older than about a year.

Also for how they are setup, I have a bootstrap role in Ansible that is the
same for every server I have (switch off passwords, add some users, install
some common packages, etc.pp) and since then I've went back on the whole
"role" thing with DRY as it doesn't make sense for my tiny setup, only the
bootstrap role is common, every host has it's own role named after itself,
and I am not ashamed to freely copy and paste stuff, because if there's some
overlap it's probably tiny.
