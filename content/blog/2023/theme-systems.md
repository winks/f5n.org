+++
draft = false
title = "Theme Systems"
date = 2023-10-07T17:20:01Z
+++

#### Maybe skip this intro

Back in the day I used to be very much into customizing and theming my Windows installation
(probably around the turn of the century), mostly before I started running Linux on half of
my machines with graphical interfaces. This has mostly faded, I don't really tweak a lot
these days (in any OS), I'm basically fine if I can set a wallpaper I like, even if I don't
see it very often. Then I'm not changing it very often either - for work machines it often
gets set in week one and then not replaced until I get a new machine years later.

Anyway, there are still some apps where I usually want a theme. At home I'm usually running
two instances of Firefox at the same time, Normal and Developer. Not even sure if the dev
version comes with this dark theme by default or if I set it, but it's dark blue and for
the normal version I've been using [this theme][kanagawa] for years.

Editors? Some of them. For **IDEA** at work, it's usually their Darcula theme.
For **VS Code** at home (I'm not a heavy user) I've been using
[August City Lights][aug] for a while.

For **Notepad++** it's just the plain white default theme, but for
**TextAdept** I'm using something
in light grey.

**Quassel** has been on my own tweaked version of [DarkMonokai][darkm] for ages.

### Theme Systems

As you can see, there's no real uniformity, so why am I talking about "Theme Systems"?

What does that even mean?

You might have heard about:

  - [Solarized][sol] (Light/Dark)
  - [Dracula][drac]
  - [Nord][nord]

And maybe also about (thanks #lobsters):

  - [Base16][base16] / [Tinted Theming][tint]
  - [gruvbox][gruv]
  - [ayu][ayu]
  - [Tokyo Night][tok]

So **basically one color scheme**, in a theme for an application, and hopefully ready to roll
**for all the apps** you could be using that have theme support.

I really love the idea, even if my stuff is a big random mix. It's this "I know I like Dracula,
so if I need a dark theme for application X, I can use it".

Unfortunately there don't seem to be too many of them, or only for some apps.

Also the amount of applications being themed varies greatly, and sometimes it's organized
in one org, or as a collab, and sometimes it's just completely unrelated ports. So it's
probably worth doing some research for some or all of the above mentioned.

### Why now?

Now why did I even start this research out of the blue?

So I have this three screen setup at home, 2 27" (middle and left) and an older 24" in portrait
mode on the right, and on that one I use a 50:50 split with IRC in the top half and
Thunderbird and Signal in the bottom half.

Unfortunately the viewing angle of the 24" is not great (and maybe becoming worse) and
so I noticed I have real problems with a dark theme in IRC on that screen (also I'm apparently
getting old) and so I went looking for a nice light theme and thought about Solarized and
Dracula and started looking. I switched Quassel to use [Solarized Light][solq] yesterday but I'm not
a huge fan of the yellowish tone, that's why I'd never used Solarized Light before.
Also Quassel is of course nowhere near VS Code in user numbers, so I guess I need to make my own theme.

### More?

I've not put a huge amount of work into researching this, but if you know of more "Theme Systems"
projects, or just some popular themes with several (i.e. maybe more than 3) ports, feel free to
hit me up so I can add them.

### The concrete problem


So I'm still looking for a nice light **Quassel** theme and unfortunately the best (or only?)
[resource for themes][qtheme] is not great.

I've not started writing one,
but right now I'm looking at these color schemes:

  * [PaperColor](https://github.com/NLKNguyen/papercolor-theme)
  * [Tomorrow](https://github.com/chriskempson/tomorrow-theme) (found it in tinted as well)
  * [Alabaster](https://github.com/tonsky/vscode-theme-alabaster)
  * [tinted](https://tinted-theming.github.io/base16-gallery/) (like, any of those light ones)

I've not fully grasped how tinted/base16 works but I'll go dig deeper and see if I can do this
for Quassel in a reasonable time.


[kanagawa]: https://addons.mozilla.org/en-US/firefox/addon/japan-style-kanagawa-gr-232767/
[aug]: https://marketplace.visualstudio.com/items?itemName=inci-august.august-themes
[darkm]: https://gist.github.com/Zren/2779042
[sol]: https://ethanschoonover.com/solarized/
[drac]: https://draculatheme.com/
[nord]: https://www.nordtheme.com/
[tint]: https://github.com/tinted-theming/home
[base16]: https://github.com/chriskempson/base16
[gruv]: https://github.com/gruvbox-community/gruvbox-contrib
[ayu]: https://github.com/ayu-theme
[tok]: https://github.com/enkia/tokyo-night-vscode-theme
[solq]: https://github.com/alexwilson/SolarizedQuassel
[qtheme]: https://bugs.quassel-irc.org/projects/quassel-irc/wiki/Stylesheet_Gallery