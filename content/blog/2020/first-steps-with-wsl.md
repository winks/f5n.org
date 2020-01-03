+++
draft = false
title = "First steps with WSL"
date = 2020-01-03T21:40:00Z
+++

It is January and I decided to bite the bullet and finally try out the Windows
Subsystem for Linux, despite my bias against development on Windows.
I have a Rust app I want to have a look at again and I
don't want to install Git on Windows, for starters. And always editing code
with vim grows old, if you're only doing it because your code sits on a box
without a GUI, not because you love vim and want to use it all the time.

OK, installing it is easy enough, PowerShell as Admin, one command, reboot.
Adding Ubuntu 18.04 as well, download one file, one command, find it in the
start menu, wait a little, done.

First problem arises. Since I installed this I don't have the keyboard layout
chooser anymore, and right now I have a US Intl. keyboard connected. This is
really painful already. Why does this happen?

  * Settings -> Time and Language -> Language
  * English -> Options -> Keyboards
  * Add a keyboard -> US-Intl

Now I have a different keyboard selection icon in the taskbar, but fine.
Digging deeper in the settings this seems to be the 'Language Bar' that is
acting in a weird way. If I set it to float it's gone, but by changing stuff
in 'Advanced keyboard settings' I can make it reappear. Aaanyway.

`apt-get update && apt-get upgrade` works, good.
Installing tmux and git, creating a new SSH key, cloning, fine.

OK, now I need rust. I want to build for Windows, so can I do this in WSL or do
I still need it in Windows? No idea, let's use the Windows `rustup-init.exe`.

Addendum: Trying to install rustup inside WSL, I do get a default host triple of
`x86_64-unknown-linux-gnu`, as expected, so it was the right choice.

It's really been a while since I installed Rust on Windows, but did you always
need the 4.5 GB C++ Visual Studio support files? This is weird, but ok.

Next problem, running `cargo build` in `\\wsl$\Ubuntu-18.04\` is really, really
slow and errors out after 30%. Twice. OK, this doesn't seem to work. After
reading some posts and articles I should be glad to be able to have write
access at all, it seems.

Good, copying over my 30kb of project files to a Windows dir, rerunning, this
works fine. I'm using VS Code right now for Rust.

A day later I'm minding my own business and suddenly Windows Defender pops up
and says there's a trojan in my `/bin/su` file of the Ubuntu WSL thing.
A Windows trojan, nonetheless. I wouldn't say I panicked, but I was a little
concerned indeed. It's supposed to be a normal Ubuntu 18.04.3 - so I connect to
a real server I have and start comparing stuff. Same version of the package,
which files are in the package, what are their md5sums... It's 2:30 am already
and I'm a little tired and wanted to to go to bed just before this, so I miss
checking the "infected" executable properly. Turns out if it's overwritten with
only zeroes the checksum might indeed be different... Restoring didn't work, so
I fired up FileZilla and copied the Ubuntu 18.04.3 `su` binary to one of my
Windows partitions and boom, quuarantined again. This time restore worked though
and I was calmed down enough to let it rest.
Filed a false positive report (at least that went quick without an account) and
went to bed. When I got up 8h later it was already accepted, at least this
worked fine.

Still. I know why I hate Windows as a development platform, but the WSL seems
to be good enough for certain things.

  * have a full Linux system available instantly
  * not having to bother to install most development tools on Windows
  * there is some amount of cross-access so I can use e.g. grep on files easily
  * `ip a` didn't work yesterday but today it does?
  * the terminal has a few oddities, putty is better

Starting services on WSL when Windows starts seems to be a bit of a hassle,
but I wouldn't want them running all the time anyway, I guess

I need to play around with it a little more. It's definitely better than a
full-blown VM, and some things are kinda seamless, but there have been a few
awfully sharp edges for a good first experience.
