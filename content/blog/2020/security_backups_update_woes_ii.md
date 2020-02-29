+++
draft = false
title = "Security, Backups, and Update Woes Part 2"
date = 2020-02-29T20:21:10Z
+++

First of all, the [Nexus 5 is really dead][UW1]. I think it made it to ~19h and
then it was stuck in the boot loop again. I got it to boot up from time to time
but I mostly lost confidence, even when it was working for a few hours.

So on Thursday I pulled the trigger and ordered a Motorola moto 4X for 190 EUR,
and it arrived yesterday. Feels good, looks good, a few grams heavier but
otherwise nearly the same size as the Nexus 5X. The only odd thing was the
patching. It shipped with Android 8.0 and I had to click "contine, reboot,
search for updates" like 10 or more times until I arrived at 9.0 now.

But that wasn't the actual thing I wanted to write about, but this is what
triggered it. I've been less annoyed by the loss of my favorite phone or the
need to buy a new one (had it long enough and the new one was cheap) but it
will shock you what happened next...

So I tried to buy something online with a credit card and to do that (and for
other reasons of course) I have two at 2 different German banks.

Using number one popped up this 3D secure thing where I need a special app by
my bank, of course *this* part hadn't been backupped and restored - so now I
needed to order a new letter via snail mail, if there's even another way of
recovery they're doing a terrible job of telling it to the user.

So at bank number two I couldn't even login to the online banking without a
special TAN app (again this is not for banking per se, just authentication).

At least they offer an SMS-based workflow to pair a new device with your
account, the problem is that it doesn't work. In this case you should log in
to online banking, be in a kind of locked down state, but can trigger an SMS
with a special link. I got the link but tapping on it I just got "TAN app not
installed" so I called the hotline. First this also didn't really work, but
after a few tries I could copy the entire SMS and paste it in the app and it
parsed out the magic part of the URL and now my new phone is paired. Yay.

So half of this drama is over I guess. Still it would be so easy if they
supported my Yubikeys...

On to the Google Authenticator 2FA stuff. First of all, I've never had a
problem with Google Authenticator itself. I use it for basically all websites
that support it. Not that many, in my case, this is the sad thing.

[twofactorauth.org][2FAO] has a big list but I don't use many.

## Github

I think Github takes the #1 spot without any real contenders. Also it has the
potential for massive damage if someone would commit something nasty.

  * authenticator app
  * multiple Yubikeys
  * one-time codes
  * no forced SMS auth, but as a fallback comm. channel

## Google/Gmail

Seems close to Github, but I don't really care about this account.
It has my calendar and I bought apps for < 20 EUR in 10 years. It's not my
primary email and not used as a recovery email address afaik.

  * authenticator app
  * multiple Yubikeys
  * one-time codes
  * haven't tried to remove SMS auth

## Namecheap

Bought a domain here, so far everything went perfect.

  * multiple Yubikeys
  * OR authenticator app - that's a little weird
  * one-time codes

### DigitalOcean

Spun up some droplets in the past, currently not actively using it.

  * authenticator app
  * one-time codes

### Scaleway

Got 1 VM here right now.

  * authenticator app
  * one-time codes

### Amazon

Don't have to explain this one I guess.

  * multiple authenticator apps, but can't remove old ones, wtf

### Blizzard Games, formerly World of Warcraft only

Pretty good for a game.

  * keyfob OTP generator
  * own authenticator app

### Star Wars - The Old Republic

  * keyfob OTP generator
  * own authenticator app

### EVE Online

Didn't try this myself.

  * authenticator app

### Final Fantasy XIV

Didn't try this myself.

  * keyfob OTP generator
  * authenticator app

## What does that mean?

So yes, you read that correctly. Of all the hundred or so of online accounts
I have only 4 have 2FA enabled, but of course I didn't check *all* of them,
but I don't think I'll find a lot who do support it. Compare this to like
every major MMO I've played in the last 10 years, they all support it - and
as I don't have a gaming laptop it would be even easier to have this somehow
temporarily bound to a certain computer, in a sense of alerting of logins from
different machines, whereas you can bet I will login to several websites from
a laptop or phone from a different subnet multiple times per day.

Also still very disappointed by both of my banks, if I didn't make myself
clear already how much I love my Yubikey.

Stuff I'm using that should support 2FA, but I don't use it:

  * Discord, app
  * Slack, app

Also, famously no support:

  * Strato, a hoster I use
  * Booking.com - ok, not sure the hardware key would be useful for me

### TLDR

  * authenticator app without one-time codes is annoying or stupid
  * many workflows of "I have a new phone" converge to "just click on 'I lost
    my phone' - why can't I act proactively?
  * I know restoring the authenticator from an Android backup might be
    insecure, but not being to use my CC sucks. A lot.
  * I want more Yubikey support, dammit


[UW1]: /blog/2020/update-woes/
[2FAO]: https://twofactorauth.org/
