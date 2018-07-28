+++
draft = false
title = "Linux and Multimedia"
date = 2018-07-07T19:59:23Z
+++

I've been using Linux on the desktop for quite a few years now, on work machines exclusively since 2010, and casually for a while longer. Also all my private Laptops have run Linux at least in dual boot since 2004 or 05. The one thing I've never been happy about is sound though. It usually works well enough but then again I've never tried to do anything advanced.

Yesterday I had friends visiting and wanted to play some music in the living room (something I don't usually do) and so I grabbed my T460p (running Debian Stretch) and started the first full-blown desktop environment I had installed, which happend to be Cinnamon 3.2.7 instead of my daily driver on this machine, XMonad (running i3 at work, because I'm on 16.04 there).

First there was the problem of getting the MP3s from the NAS mounted. I don't know when they renamed `smbfs` to `cifs-utils` but I don't use this stuff often enough to have remembered, but the name does ring a bell. Surprisingly, Cinnamon's file browser (`nemo`) recognized the network mounts without any user intervention already, but I couldn't drag and drop folders to Rhythmbox for whatever reason, so I did mount the folder via CLI. Still didn't work so I switched to Clementine. (Somehow I don't seem to need a graphical file browser more than twice a year.)

The TV was instantly recognized as an external screen, mirroring worked (not a surprise, I hardly know problems with external monitors) but sound didn't go over HDMI. This could quickly be fixed via Preferences, Sound, Switch from Analog to Digital, though. This seems to be PulseAudio, but unlike `pavucontrol` and friends, it was easy to use.

Annoyingly, the screensaver kept on activating and killing off the sound over HDMI after 10 minutes even though I disabled it. I somehow got it really deactivated after a few tries though.

So, the only takeaway is that while I prefer total control via xmonad or i3, managing external screens manually with scripted xrandr, etc - sometimes it's really nice to have some GUI dialogs for stuff you don't have time to read up on or only use once every few years.

Yes, maybe not surprising to people who haven't stopped using Gnome et al. many, many years ago - I was pleasantly surprised to get everything running in a mere 5 minutes. The only thing Windows 10 does better (depending on how you see it, but for this use case..) is automatically switching sound to the external TV when connecting HDMI.

Despite this nice experience there are indeed a few problems with cinnamon. First, desktop scaling - there are 2 options, **Normal** (which is too small), and **Double** (which is too big). Also all the Preferences are a bit weird to access in the "Start" menu. Sure, might be nice to save click to start the one you need, but more likely it's a fair bit of scrolling and you need to know that "System Settings" is the one with all the preference dialogs in them.

I've had a plan to try out some parts of xfce in addition to xmonad/i3, some of those audio/display preferences might come in handy. Also, one day I will remember the "logout" key bindings for xmonad/i3 and not have to kill X to logout :P
