+++
draft = false
title = "A Podcast Tracker"
date = 2025-09-26T12:00:31Z
+++

Usually I post all my code experiments and tools publicly (usually on Github,
but that may change) but for some reason I never published this, but after
a couple changes I might.

I don't always listen to a lot of podcasts, but for some stretches of time in
the last couple years I listened to a few, and unlike most people (or so
I heard) I usually did that on my Windows PC, while doing other things, and not
on a mobile phone, so all the "common" podcast player apps were out.

The mp3s are downloaded or streamed (no huge preference) in foobar2000, but
keeping track of where I was (episode-wise, not in the episode) proved
difficult.

For a couple years I had used [Juice](https://juicereceiver.sourceforge.net)
- but it was last updated in 2006 and at some point it could not connect to
  modern TLS hosts anymore. I quickly looked into just patching it, but that
proved difficult. It's a python app, and then an ancient SSL version and...
well, in the end I decided on rewriting it.

So I ended up with a GUI app in C++/Qt and a backend (I have a PHP version and
a Golang version).

It looks like this:

![Jerssey the GUI Podcast tracker](/media/blog/2025/jerssey.png)

It has its flaws (like being single-threaded and stalling while it downloads
something) but it was purely an MVP that got a few more features.

It really only tracks a list of podcasts, then a list of episodes per podcast,
gives me a download link, a link to the episode post, some timestamps, and
I can set a status to New/In Progress/Done. That's it. Having it local only
would have been fine, but of course I had to add an API.

![Jerssey the Web interface](/media/blog/2025/jerssey2.png)

I've not used it in a couple months, but it's there when I go back to listening
to podcasts. And it also tells me where to continue if I want to.

When I use it again I will probably also fix the two things that I am not happy
with: Finish the Golang rewrite so I have one less PHP app to update, and move
to SQLite for easier backups (it's using Postgres right now).

But now I have access to a Mac I kinda also want to get it to build there.

Not that I see myself working on it in the immediate future, but it's a rare
case of building something just for myself I'd been using daily for a while.
