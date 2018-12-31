+++
draft = false
title = "i3 and KDE 5/Plasma"
date = 2018-09-11T10:55:23Z
+++

I've had used [i3](https://i3wm.org) from time to time in the past but I was
still a staunch supporter of [xmonad](https://xmonad.org), so when I got a new
work laptop in late 2017 I of course tried to use xmonad, as I have been since
early 2012. But for some reason it didn't really work on Ubuntu 16.04 (neither
0.12 nor 0.13) so I switched to i3.

There's one feature I was missing though, in multimonitor mode I absolutely
need the screens to switch places. Gladly
[someone wrote](https://github.com/tmfink/i3-wk-switch) a helpful addon, but I
[had to poke around](https://github.com/winks/i3-wk-switch) a bit.

Anyway, now it was time to upgrade my work laptop to Ubuntu 18.04 and after
having a look at the live cd I was very impressed with Kubuntu, so I wanted to
try that. But there's a dilemma: Plasma is no tiling wm.

So I went to look around bit and found some configs, which I had to modify a
little and now it seems to work a bit.
([Source 1](https://github.com/avivace/dotfiles/blob/0394a615573b4cad5dcf717366da530a80fe3b6d/i3/.config/i3/config)
and [Source 2](https://github.com/nightsh/i3-plasma))

The key lines in the i3 `config` file seem to be:

```
exec --no-startup-id wmctrl -c Plasma

for_window [title="Desktop — Plasma"] kill; floating enable


for_window [class="plasmashell"] floating enable
for_window [class="Plasma"] floating enable
for_window [title="plasma-desktop"] floating enable
for_window [class="Plasmoidviewer"] floating enable

# Float by type
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [window_type="dialog"] floating enable
for_window [window_type="menu"] floating enable


#focus_follows_mouse yes

no_focus [class="plasmashell"]
no_focus [window_role="pop-up"]
no_focus [window_type="notification"]

focus_on_window_activation none
```

To get xmonad's screen switching behaviour I had to comment thse lines:

```
#bindsym Mod4+1 workspace 1
```

and replace them with these:

```
set $x_switch exec --no-startup-id ~/.config/i3/i3-wk-switch/i3-wk-switch.py
bindsym Mod4+1 $x_switch 1
bindsym Mod4+2 $x_switch 2
bindsym Mod4+3 $x_switch 3
bindsym Mod4+4 $x_switch 4
bindsym Mod4+5 $x_switch 5
bindsym Mod4+6 $x_switch 6
bindsym Mod4+7 $x_switch 7
bindsym Mod4+8 $x_switch 8
bindsym Mod4+9 $x_switch 9
bindsym Mod4+0 $x_switch 10
```


Here's my [current config](https://github.com/winks/dotfiles/blob/ce0ffc653007efa8b2aad16368b92cb6542bc3a8/i3/config)
without the above modifications at the time of writing.
