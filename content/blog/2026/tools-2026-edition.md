+++
draft = false
title = "Tools: 2026 edition"
date = 2026-01-13T00:30:45Z
+++


I wrote about tools on Windows [in 2019](/blog/2019/tools-windows-2019) and I wanted to write an
update to that post for a while already. Now with extra content!

## Windows

  * Browsers
    * `Firefox` as the default, with several multi-account containers
      * Pinned browser tabs for Matrix, Slack, WhatsApp, Mail
    * `Vivaldi` for some stuff instead of a container
  * E-Mail
    * kinda got into the habit of using webmail and have not set up `Thunderbird`
  * IRC
    * `Quassel`, as usual
  * Audio/Video
    * I just set up `mpd`, currently I am using `Cantata` as my client
    * `nomacs` instead of IrfanView, although it's worse
  * Editors
    * `Notepad++`
  * Voice
    * `Discord`
    * Trialing `Ferdium` here for chat, only starting the Discord client for voice
  * Passwords
    * `KeePassXC`
  * Network stuff
    * `PuTTY`
    * `FileZillaPortable`
    * `Remote Desktop Connection` or whatever the offical name for the Win11 RDP client is
    * `Syncthing`
  * Misc
    * `SharpKeys`
    * `WinSplit Revolution` 11.04
    * `7ZipPortable`
    * `Flow-Launcher` instead of `Launchy` now
    * `Sysinternals`
      * mosty `Autoruns` and `procexp`, sometimes `tcpview`

    Quite pared down, but as I hate working on it I've moved everything I can to Linux.
    My traditional `C:\Apps\bin` looks downright barren compared to years ago. (This is where I
    put shortcuts to everything, and give the dir to the launcher instead of letting it go wild
    everywhere and potentially finding useless stuff.)


## Linux

As I am currently writing this on my [NUC](/blog/2025/new-dev-environment/) via RDP and it's a
pretty new setup (and I'm not using Linux for work at the moment), this will be shorter.

  * Browser
    * `Firefox`
  * Editors
    * `neovim` - tried out [CyberNvim](https://github.com/pgosar/CyberNvim) and it stuck for now
    * `TextAdept` for notes
  * Window managers/DEs
    * `xfce4` on the NUC because using the super key via RDP is meh
    * `KDE Plasma` on my main laptop because it's a casual couch device now
    * `i3` on my old "work" laptop and this or sway would be my #1 choice for work again
  * Misc
    * `rofi` because the xfce launcher is not great
    * `zenity`

The funny thing is that while this would be the easiest OS to customize, it's the one I have to
do the least because I can choose my WM and configure stuff. And a lot of times I just don't
ever actively think about a tool because I have a proper shell open anyway (somewhat true for the
mac as well, but definitely not for Windows). E.g using `bc` instead of a GUI calculator. Or just
quickly starting a Python repl, or just using some stuff in /bin or something from my
[dotfiles](https://github.com/winks/dotfiles).


## mac OS

  * Browser
    * `Firefox` for most tasks
    * `LibreWolf` for "personal stuff", e.g. logged into my own Github account, Webmail, etc
    * `Safari` only for the SAP portal where I file my vacation requests
    * `Chrome` installed as a Backup, only used for LinkedIn, useless
  * E-Mail
    * `Outlook Web`, 90% of the time
    * `Outlook` (the app), when I need to access our shared team inbox
  * Audio/Video
    * `Cog` plays mp3s
    * recently `Cantata` to control `mpd` at home
  * Editors
    * `IntelliJ` as my main IDE
    * `Neovim`
    * `TextAdept` for notes
  * Passwords
    * `KeePassXC`
  * Network stuff
    * `Windows App`, Microsoft's better RDP client
    * `Syncthing`
  * Terminals
    * `Ghostty` after some time with `WezTerm`
  * Window Management etc
    * `Hammerspoon`
    * `Rectangle`
  * Misc
    * `Podman Desktop` works surprisingly well for what I need, not using the GUI much though, but
      it provided me with a working podman setup


## Plugins

Firefox: All three very important and I've not missed anything else.

  * Consent-O-Matic
  * Firefox Multi-Account Containers
  * uBlock Origin
  * (rarely installed) FoxyProxy


## Fonts

Might as well put these here. What I use is changing over time, but there are a few choices that
I don't change around much.

  * Terminals
    * Usually `Iosevka`
  * IRC
    * `Fantasque Sans Mono` for the last few years, Iosevka in the past
  * Text editor (Non-IDE)
    * `Consolas` or `Iosevka` on Windows
  * IDE
    * I kinda like `JetBrains Mono` and never changed it since they introduced it, but for some
      reason I also never switched all my IDEs on other machines.

## Themes and colors

I have this seemingly odd idea of wanting to read what is written on my tabs, so I've been using
[this Firefox theme](https://addons.mozilla.org/en-US/firefox/addon/japan-style-kanagawa-gr-232767/)
for the last 10 years.
[Honorable mention](https://addons.mozilla.org/en-US/firefox/addon/shades-of-firefox/).

I've not themed and styled all my apps in the same colorscheme, although I
[wrote about it](/blog/2023/theme-systems/) - but I'm still using a mix of Dracula, Solarized Dark,
Monokai, Nord, and other things, usually to not have it uniform, but quicker to distinguish between
them :D.


