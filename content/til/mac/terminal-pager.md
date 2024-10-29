+++
draft = false
title = "Terminal.app includes a pager"
date = 2024-10-22T23:23:23Z
+++

**Cmd-UpArrow in Terminal.app lets you jump to the last time you pressed enter.**

Maybe there's a better official definition but it inserts a grey `[` in front
of your prompt and that's the mark where you can jump back to.

```
[user@host $ seq 1 100 # START
1
2
3
...
98
99
100
user@host $  # press cmd-UpArrow here to jump to START
```

  * cmd-k will delete screen + scrollback
  * cmd-l will delete screen and not the scrollback
  * there's a "Hard Reset" in the (searchable) help menu

Source: IRC, thanks jelly