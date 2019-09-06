+++
draft = false
title = "Switching to Regolith"
date = 2019-09-06T06:30:23Z
+++

The only thing I've been writing about seem to be
[desktop environments](/blog/2019/desktop-environments/) lately, especially
[i3 and kde](/blog/2018/i3-kde5-plasma/).

Some time ago I found [Regolith Linux](https://regolith-linux.org) which is an
Ubuntu derivate on the one hand, and a ppa with a set of packages on the other
hand. I guess most smaller Ubuntu derivates work like this, but that is not
the point.

Quoting from their website:

> Regolith Linux is a distro for people that prefer a spartan interface with
> polished and consistent system management. It brings together a trifecta of
> Ubuntu’s ubiquity, i3-wm’s efficient and productive interface, and Gnome’s
> system configuration features.

So in short it seems to be i3, with a set of preconfigured defaults, and the
one thing I was missing when not running a full desktop environment, but just
a standalone window manager - the system settings stuff.

So I tried it out by installing the packages from the ppa and nearly
everything worked out of the box, with a few small things I had to tweak.

  * reintegrate dmenu over rofi, but maybe rofi could be fixed for me
  * copy parts of my old i3 config, carefully merging it to theirs
  * fixing the workspace names for i3-wk-switch to work again, not 100% there
  * this was a hard one: uninstalling ibus, because it claims ctrl-shift-u
    without any means to undo that (in the version in 18.04) and I absolutely
    need that shortcut daily in Qt Creator (as this is my work laptop)

Also some config things I merged or I'm using both versions because I am still
undecided what I like best:

  * `win-p` starts `rofi` in default mode, using `.desktop` files
  * `win-shift-p` starts `dmenu` in my old config, also having `~/bin/*`
  * `win-enter` starts `st`, regolith's default terminal
  * `win-shift-enter` starts `terminator`, my default terminal

RAM usage so far seems to be a tiny bit better, but I've not measured it,
objectively or otherwise.

But overall, I'm 99% happy with Regolith so far and while I still have a few
tweaks to do - none of them pressing issues, actually most of it is my stuff
ignoring their color scheme, so a lot of black over bluish, and I don't care -
I really like it and it fixed all
the weird small problems I had with the unorthodox i3+plasma setup.
