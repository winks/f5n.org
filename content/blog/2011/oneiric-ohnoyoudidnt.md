+++
draft = false
title = "Oneiric-Oh-no-you-didn't..."
date = 2011-10-17T21:00:00Z
+++



I've never been a great fan of Ubuntu, but I'm using it on two of my laptops  
(that aren't my main workstations) because it used to be low-maintenance.

You could say I was into the whole "it seems to just work[tm]", especially on
 laptops, with suspend and fancy hardware. So last weekend I set out to upgrade
 my eeePC 900A from Natty Narwhal (already had switched to GNOME classic from
 Unity, but I'll ignore that, no hard feelings for Unity, it just wasn't my
 cup of tea) to Oneiric Ocelot.

Booting up, "Do you want to upgrade"-dialog, all fine so far. I remember faintly
 at one point one of the dialogs had been hugely long and on the eeePC's low-res
 screen I had problems clicking on the buttons at the bottom end and this was
 no problem anymore, awesome (part of terminal output could be collapsed).

All went smooth, one reboot after it's done - there's the new login manager
 (LightDM it's called, had to look that one up) - which looks kinda ok on the
 small screen. So I enter my password, Unity loads, and something's wrong.
 Sooo, touchpad not working. Uhm, I just had moved the cursor in LightDM to
 select my user. Ah well, got an USB mouse, plugged it in - touchpad worked.
 Removed the mouse, touchpad still works. Weird, in a funny kind of way.
 Switching back to Unity2D because it's a bit slow on 3D, but whatever.

So I pack up the eeePC this morning and carry it to the office to act as my
 trusty build monitor, displaying Jenkins on Firefox on an external display.
 I arrive at the office, unpack it, plug it in, boot it up, select the other
 user account, login, open up Firefox... No connection.

So, first step, replug cat5 cable, nothing.
 Second step, ifconfig. Aha, eth0 has no ip. Weird. 

    sudo /etc/init.d/network restart

 error: User2 not in sudoers (from memory)  
 Wait, there's this fancy user switcher, let's go.  
 So I login my original User1 (who did the upgrade).  

    ifconfig

 Wait, what? eth0 has an ip? How'd that happen. Nevermind, all fine, right?  
 Switching users again, back to User2.  

    ifconfig

 eth0 has no ip. WTF?  
 Back to User1. Got an IP.  
 Back to User2. No IP.  

 What the hell? Since when would a system service depend on being logged in?
 Wait, there's NetworkMonitor, the bane of people who despise magic.
 So, finally someone gave me the hint that one can "share the config" for
 other users. Turns out, my main user (first one created I suppose?) can tick
 "Allow all users to use this fucking cable connection", yes indeed.

What the hell is wrong with you people? I mean, I could maybe understand
 that you may not want to share your WPA2-WLAN keys to all users of the
 machine, but it's a fucking network cable on a fucking computer running a
 fucking multi-user operating system. How the hell can that be user dependant
 on a user that is not called fucking root?

During all this user switching I noticed the next fuckup.
 User1 switches to User2. What I expect is this:

 - screen turns black
 - password input appears
 - after entering password the other user's desktop appears

What I do not expect:

 - I see the other user's desktop for 5 sec
 - screen turns black
 - password input appears

And what I call a fuckup:

 - I see the other user's desktop indefinitely
 - password dialog appears halfway hidden below other user's windows
 - nothing turns black
 - my face turns red instead

But hey, there's exactly one thing that could be worse
 - other user's windows accept my user input

Hey, at least that one didn't happen.