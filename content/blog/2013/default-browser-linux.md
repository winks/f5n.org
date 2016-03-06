+++
draft = false
title = "Setting a default browser on Linux"
date = 2013-08-29T10:00:00Z
+++



So I had a little problem recently with a "default browser" in Linux. I am
using `terminator` with `zsh` as my terminal and I could click links so that they
were opened in my default browser, `chromium`, until I had installed `midori`,
another webkit-based browser. Since then all links in terminator were opened in
`midori` instead of `chromium`. In `icedove` as well, actually.

As I stated elsewhere, I'm running Debian wheezy with xmonad instead of a
proper desktop environment (like GNOME/KDE/XFCE/LXDE) which is hilarious at
times like when I actually forgot how the file manager was called because I
hadn't used it in months. I only remembered the ones I didn't have installed
(`mc`, `thunar`, `dolphin`) and only a day later stumbled over `nautilus`. Ah well.

Now, as it turns out, the task of setting your default browser in Linux is less
than userfriendly or even practical or sane.

The best overview you find after a little searching is this
[forum thread](http://crunchbang.org/forums/viewtopic.php?id=2501) which shows us

  * `update-alternatives --config x-www-browser`
  * `update-alternatives --config gnome-www-browser` (both on Debian-based distros)
  * `exo-preferred-applications` (XFCE)
  * `xdg-open 'http://f5n.org'` and its config stuff:
    * `xdg-settings --list`
    * `xdg-settings set default-web-browser chromium.desktop` (yeah sure, I
      don't have a desktop, but `/usr/share/applications` is full of
      `*.desktop` files)
  * `gconf`
  * the `$BROWSER` environment variable

Actually I lied, and the last two I learned about elsewhere, but whatever.
There's also `xdg-mime` which I still couldn't persuade to produce any
meaningful output.

Yet none of those worked and after about an hour of fiddling I still had made
no progress.

In this [bug report](https://bugs.launchpad.net/terminator/+bug/863866/comments/2) I
had finally found the solution, but see the update note below.

    You have to add something like this to your
    ~/.local/share/applications/mimeapps.list

    [Default Applications]
    x-scheme-handler/http=chrome.desktop
    x-scheme-handler/https=chrome.desktop
    x-scheme-handler/ftp=chrome.desktop


(I added the last two lines myself, but they were easy enough to guess.)

**Update 2014-02-05:** At FOSDEM I just learned that it is now `mimeapps.list`
 instead of `defaults.list` in the same folder. Syntax seems to be the same.
Detailed infos [on ArchWiki](https://wiki.archlinux.org/index.php/Default_Applications#Using_MIME_types_and_desktop_entries).
Thanks, [Jerome](https://github.com/Adys) - and you should totally [watch his talk](https://fosdem.org/2014/schedule/event/lxqt_introducing_intents/).

**Update 2016-01-28:** Apparently emacs also is a special snowflake and doesn't apply any of the above settings.
There is `browse-url` which defaulted to Firefox for me until I did run `M-x customize-option -> browse-url-browser-function`
and set it to `browse-url-chromium` (with a dropdown, `setq` seems to be the way for real emacs users).
Here some [more info on the topic](http://www.emacswiki.org/emacs/BrowseUrl).

**End of Updates**

Yeah, simple as that. Paste some arcane stuff in a file you don't even have and
it magically works. I'm not often hating on Linux desktop stuff because I am
actually pretty happy and productive, but this is a little insane.
