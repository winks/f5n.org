+++
draft = false
title = "FOSDEM and CfgMgmtCamp 2015"
date = 2015-02-04T10:30:00Z
+++


I am glad that my [employer](http://wywy.com) let me go to FOSDEM and Config Management Camp in Belgium again, so here's a quick summary of stuff.

## Saturday

After a weird experience at the Munich airport security (first I accidentally showed last year's email with the ticket, dated Feb 1st 2014 and was let through and they seem to have played with the knobs at the metal detectors because my belt seems to suddenly trigger after many years) the plane had been moved to another gate and was delayed as well... we at least made it there by noon.

The first talk we barely managed to see was
[Diagnosing Performance Issues Using Thermostat](https://fosdem.org/2015/schedule/event/diagnosing_with_thermostat/) about
[Thermostat](http://icedtea.classpath.org/wiki/Thermostat), something that definitely seems worth a look although I'm not sure how it compares to VisualVM.

Then sadly [JSON and PostgreSQL, the State of the Art](https://fosdem.org/2015/schedule/event/json_and_postgresql_the_state_of_the_art/) was full and [High-performance packet filtering with Pflua](https://fosdem.org/2015/schedule/event/packet_filtering_pflua/) had already started.

So I went to [Are distributions really boring and a solved problem?](https://fosdem.org/2015/schedule/event/distributions_boring_solved_problem/) which was a bit too Debian-centric (although I use Debian and kind of expected a few detours by the current DPL) but interesting nevertheless
and then [Puppet Plus Parentheses](https://fosdem.org/2015/schedule/event/puppet_plus_parentheses/) by [@KevinOfCorc](https://twitter.com/KevinOfCorc) which was interesting, but (probably because it was in the Lisp room) focused a bit too much on an intro and what puppet does and why it's done instead of how. Still very interesting and nicely presented.

Next up was [Stretching out for trustworthy reproducible builds](https://fosdem.org/2015/schedule/event/stretching_out_for_trustworthy_reproducible_builds/) which was about an interesting project to get a) all Debian packages to be built in a reproducible way (and that means identical binary blobs at the end, not tests or something) and b) to maybe in the future avoid the problem that if a Debian maintainer builds their package on amd64 and uploads it only the other archs are being built by buildd and amd64 is directly used (built on their machine, boo) - I might try to invest some time there, still many packages to go.

Talks I missed because of lack of reading comprehension in the timetable: [OpenStack and Xen](https://fosdem.org/2015/schedule/event/deployopenstackxen/), [Escaping DSL Hell By Having Parenthesis All The Way Down](https://fosdem.org/2015/schedule/event/escaping_dsl_hell/)

## Sunday

Apparently operating an alarm clock is complicated, thus I missed [Introduction to Using GNU Radio](https://fosdem.org/2015/schedule/event/gnuradio/) and started with a lightning talk on [JMAP](https://fosdem.org/2015/schedule/event/jmap/) which could be really nice, we'll see what the future brings. I've been following fastmail.fm for a few years and their advent calendar blog articles last December were pretty good. I prefer to host my mail myself, but I think I'd try them first if I was to pay someone.
Next up was a Lua BoF session moderated by [@hisham_hm](https://twitter.com/hisham_hm) (creator of [luarocks](http://luarocks.org/)) which gave me a nice deeper insight into the Lua community, apparently I need to read more mailing lists (already subscribed).

Next up was [Surviving the Zombie Apocalypse](https://fosdem.org/2015/schedule/event/zombieapocalypse/) which I didn't like at all. Speaker mostly read everything from his notes, it seemed like a boring presentation of tables and numbers and in general was pretty boring. Which is especially sad as he seemed to be knowledgeable enough and about every time he elaborated on anything that was regarding a question or not on his notes it was interesting stuff. Kind of weird.

Then a talk on [PHP 7](https://fosdem.org/2015/schedule/event/php7/) by [@SaraMG](https://twitter.com/SaraMG) which sadly detoured a lot into Hack (but the rest was quite ok), nothing new in it though if you follow internals and the RFC process, but some HipHop and zval things were indeed interesting.

On to [Ntimed an NTPD replacement](https://fosdem.org/2015/schedule/event/ntimed_ntpd_replacement/) I went where I already knew about a few things because I had followed the news how [@bsdphk](https://twitter.com/bsdphk) had released a version of ntimed, but it was really interesting and I'm really looking forward to it being stable. At the end of the talk I had a quick chat about DNS with a fellow who worked on BIND 10 and that was pretty interesting as well, thank you unnamed fellow :)

Again, stuff I missed: [Matrix](https://fosdem.org/2015/schedule/event/matrix/), [Elvish](https://fosdem.org/2015/schedule/event/elvish/), [XMPP and Android](https://fosdem.org/2015/schedule/event/xmpp_and_android/).

I think I didn't get to talk to as many people at the booths as last yeat, NixOS was great (I really need to try it). MySQL was empty all the time, whereas I met [@MaineC](https://twitter.com/MaineC) at the elasticsearch booth last year, chatted with the Jenkins people, the Jitsi/XMPP people and some Debian people. But this year no one I knew from IRC at any of the booths.


## Summary:

  * too many tracks. Which is not bad in general, but I'd love to see even more stuff and meet more people
  * BoF sessions were always excellent, need more of those. The so-called "devrooms" are only smaller talk venues, imho
  * next year there needs to be a Lua track, as [@justincormack](https://twitter.com/justincormack) noted
  * Thanks FOSDEM organizers, it was a blast!

## Monday

We were on time, yay.

[Beyond Configuration Management](http://lanyrd.com/2015/cfgmgmtcamp/sdhbhk/) by [@mitchellh](https://twitter.com/mitchellh) - a pretty cool keynote without bullshit and namedropping. Up next [BOSH, configuring services, not systems](http://lanyrd.com/2015/cfgmgmtcamp/sdhfgp/) by [@littleidea](https://twitter.com/littleidea) (who from now on I will call the Gruber of DevOps). Talk was good, but BOSH doesn't really interest me I think (need to read up more though) and the name is horrible, but whatever. The following panel wasn't so much my cup of tea, but maybe I don't like panels at all.

Then I wanted to watch *Automate almost anything with Ansible* but apparently the speaker wasn't there (did I hear sick? not sure) (edit: [He](https://twitter.com/_azulinho) sent me a link to [the repo](https://github.com/Azulinho/ansible-jenkins-showcase) so there was a cool intro talk on Ansible that basically mirrored my minor experience and showed me I at least got the basics correct.

[Managing Containers at Scale with CoreOS and Kubernetes](http://lanyrd.com/2015/cfgmgmtcamp/sdhfhb/) by [@kelseyhightower](https://twitter.com/kelseyhightower) and it was a really good talk (I had heard about Kelsey when I watched his [Go for Sysadmins](https://www.youtube.com/watch?v=wyRbHhHFZh8) from Gophercon on YouTube. Too bad I missed him afterwards, would have loved to ask a few questions. Because of this talk I missed [NixOS: Your next favorite server OS](http://lanyrd.com/2015/cfgmgmtcamp/sdhfmf/) - meh.

Up next was [Modern Module Development](http://lanyrd.com/2015/cfgmgmtcamp/sdhgcw/) by [@KnittyNerd](https://twitter.com/KnittyNerd) which was good and interesting, but sadly not many new/advanced things. Quote of the day was ["the nightmare that is the Apache module"](https://twitter.com/felis_rex/status/562265914264289280) though.

The day was concluded with [@liamjbennett](https://twitter.com/liamjbennett)'s [Testing with beaker](http://lanyrd.com/2015/cfgmgmtcamp/sdhgcx/) - very interesting and I need to try it out, although I'm not happy with the state of testing in puppet in general, but that's enough of a rant for another post...

After that drinks at [The Zone](http://www.thezone.be/) in Ghent as usual (their website seems to be down right now) - just that most people left very early, apparently many of them to grab lunch at 8 or 9 and they didn't come back.

## Tuesday

Got up early, went to [Lean Configuration Management](http://lanyrd.com/2015/cfgmgmtcamp/sdhbhm/) by [@jezhumble](https://twitter.com/jezhumble) - this was great, let's hope there's a recording. Next was [The parallel universes of DevOps and cloud developers](http://lanyrd.com/2015/cfgmgmtcamp/sdhpcm/) by [@dberkholz](https://twitter.com/dberkholz) (with whom I also chatted last FOSDEM about containers after his talk (iirc) when suddenly [@gregkh](https://twitter.com/gregkh) joined the discussion when passing by, that's something that only happens at FOSDEM I think) - but I wasn't especially happy with <s>this talk. Sure, interesting metrics about tool usage, but I'm not so sure I can trust them (like stars on Github can be 100% misleading sometimes), but as he measured more stuff it's probably the best data you can get without a huge effort.</s> the findings/methods used here. For example, I don't like stars on Github as an indicator. Any promising new JS projects seem to get hundreds of stars the day they are made public, same for new code by well-known community members (of any community) whereas semi-new stuff in more obscure languages can be the best solution to a problem ever and have a dozen stars. Nevertheless I think his numbers support reality, and the talk was good. Rephrased this for clarity.

We had an early flight so my last talk for the day was [Configuration Management in a Containerized World](http://lanyrd.com/2015/cfgmgmtcamp/sdhfhc/) by [@julian_dunn](https://twitter.com/julian_dunn) which was kind of interesting, but I'm not sure what I got out it.

## Summary:

  * CfgMgmtCamp was awesome, the talks in general were even a bit better than last year (don't be mad, last years' speakers who might read this, you brought me back!)
  * Dear organizers, please let the social event start 1-2h after the talks (like the last 2 years iirc) and not instantly. People need to get to their hotel and maybe grab dinner before drinks. The place was basically abandoned by 9 pm (it had started at 5 pm and was too packed until 6 pm anyway.)
  * I need to book my flights earlier, better to arrive 1 day before FOSDEM or at 8 am at latest and also to catch a flight home later than 7 pm on the last day
  * [thanks all who helped and attended](https://twitter.com/anderiasch/status/562595901223755776)
  * I still don't trust containers (and especially docker), but I'd love to play around more with lxc
  * shoutout to the puppet folks who I've met over the years, all the discussions with you have been insightful and enjoyable, on any kind of topic. That of course shouldn't reflect on the people from the other projects, but I mostly use puppet so of course there's usually more interest at CfgMgmtCamp.


## My todos

 * Look at [Juju](https://juju.ubuntu.com/) again after a few years, apparently it's a lot more useful now
 * Look at [Ansible Tower](http://www.ansible.com/tower)
 * Look at [Rudder](http://www.rudder-project.org/) and do a basic provisioning of a host with it and look at the cfengine stuff
 * Look at slides for a few talks I missed (mostly those mentioned above)
 * Look at some things in the [Prosody](http://prosody.im/) code base
 * Look at Jez Humble's 2 books and "Release It!" by Michael T. Nygard
 * Play around with Kelsey's [Kubernetes Demo](http://go-talks.appspot.com/github.com/kelseyhightower/cfgmgmtcamp-2015/slides/coreos-kubernetes.slide#1) <s>if it's online</s> - [there's a repo](https://github.com/kelseyhightower/cfgmgmtcamp-2015/tree/master/demo) (thanks [@eLobatoss](https://twitter.com/eLobatoss)
 * Find out whether lxc and docker work with multicast. :P
 * Finally put my 2 puppet modules on the forge
 * Look at Mirage, Unikernels, Xen in detail
 * Test NixOS or at least nixpkg

That list is horribly long, I hope I can tick off at least a few items.
