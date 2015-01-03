+++
draft = false
title = "A boring list of tools for Linux Desktops"
date = 2014-07-18T10:00:00Z
+++



Another draft I had almost forgotten about, updated some things and now publishing it before I forget about it again.


Both linux laptops I use most frequently are configured in a similar way.
One (my laptop) runs Debian stable (wheezy), the other (work laptop) runs Debian testing (jessie) since May 2014, wheezy before that.
Both run `xmonad`, `xmobar` and `trayer` (and `xdm`) with the same config.
I have 9 virtual desktops, aptly? named:

  * *sh* for shells
  * *code* for my IDE
  * *www* for my main browser
  * *im* for irc and jabber
  * @ for email
  * ☹ for nothing specific, usually shells
  * ♨ you guessed it, shells
  * ♫ for music and more shells
  * ♥ for my second and third browser

on startup a few commands are run:

  * `xmodmap` (for a [custom keymap](https://github.com/winks/dotfiles/blob/master/.us-intl-german.xmodmap) to be able to type äöüß€λµ…–·→←)
  * `feh` (for the [background image](http://www.reddit.com/r/funny/comments/1plsfp/you_guys_got_windoge_8/) that I hardly see)

so on to the programs that are usually running at any time:

  * `parcellite` (to keep my clipboard history)
  * `xscreensaver` (to lock the laptop)
  * `xfce4-power-manager` (to avoid unnoticed instant shutdown)
  * [BitTorrent Sync](www.bittorrent.com/sync)
  * *sh*: `terminator` with `zsh`, sometimes `tmux`
  * *code*: IntelliJ Ultimate 11.1 (why upgrade?) or `vim`/`gedit`/`LightTable` or all of them
  * *www*: `chromium`
  * *im*: `quasselclient` and `gajim`
  * @: `thunderbird`, actually earlybird
  * ☹: a root shell with `openvpn`, boo me
  * ♨: shells
  * ♫: `rhythmbox` or `banshee`
  * ♥: `firefox` nightly
    * one with default profile for private stuff
    * one with extra profile, just for facebook

then the stuff that gets used occasionally:

  * `wpa_gui` (despite a semi-automated setup of `dhcpcd` + `wpa_supplicant`)
  * `pinta` for image editing - *damn, I forget this name all the time*
  * `evince` for PDFs is good enough for me
  * `vagrant` + `VirtualBox` (would prefer `lxc`, but as I am the only Linux user, it's not worth duplicating all of the work when ~8 others use Mac+VirtualBox)
  * `xbacklight`
  * `audacity` and `vlc` because we sometimes do audio stuff at work

programming language runtimes used most often (roughly in order):

  * `python` (no `ipython` yet, might try)
  * `lua` (I use [lua.org](http://www.lua.org/cgi-bin/demo), need to find a repl)
  * `bash` :(
  * `ruby` (`irb` is fine for me)
  * `clojure` (`lein repl` is fine)
  * `php` (`php -r` is sufficient)

some history grepping and sorting shows nothing unusual:

    1119 git
     693 ag [1]
     671 vi
     496 ls
     443 cd
     398 ssh
     376 mv
     350 curl
     322 rm
     283 scp

[[1]](https://github.com/ggreer/the_silver_searcher)

The work laptop was originally fully puppetized with masterless local `puppet`, until they broke <s>some</s>everything and I had no time to fix all my stuff.

Meanwhile I migrated the automatic setup of one box from `puppet` to `ansible` because it seems a lot easier for casual use, we'll see if there's less breakage as well.

And I should probably mention that I am pretty happy with this.
Very rarely I wish I had a Mac available, but that usually lasts for a single task of 15m to 2h, for example when I must connect to a VPN with PPTP or want to play a game in my lunch break.