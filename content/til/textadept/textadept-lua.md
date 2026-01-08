+++
draft = false
title = "Textadept's Lua integration"
date = 2026-01-08T21:59:13Z
tags = ["textadept"]
+++


What happens if you don't read the manual properly?

So I've been using [TextAdept][ta] as sort of "not as an IDE/Code Editor per
se, but a good Text Editor that can also do code" for years (because it's
excellent) but I've always been missing VS Code's "Open folder".

So of course I started looking into implementing that but I really couldn't
be bothered to dig into the C/C++ code and maybe keep my own fork.

But there's a `~/.textadept/init.lua` and I knew could do a few nice things
with its Lua API.

So what I ended up having working:

Run `fd $(dirname of current buffer) | rofi -dmenu -sort -sorting-method fzf && open that file`, but partially in Lua.

But then I discovered "Projects" and also "Quick Open" which kinda does the
same as my hacky solution, so I now just have a couple lines of code for a
function that does `dirname(current buffer's file)`, provide that as editable
text in a popup dialog (so I can go up a folder), and on submit opens the
Quick Open (which has fuzzy search) with that dir as an argument.

It looks like this:

```
-- ~/.textadept/init.lua

local splitter = function(s)
  return s and string.match(s, "(.-)([^\\/]-%.?([^%.\\/]*))$") or "", "", ""
end

local quick_open = function()
 local dir, _, _ = splitter(buffer.filename)
 local txt = ui.dialogs.input{title = 'Quick open dir:', text = dir}
 io.quick_open(txt)
end

keys['ctrl+L'] = quick_open
```

And then a shell script to wrap my `find | rofi | textadept` thing for out-of-editor use:

```
#!/bin/sh
[ "$1" != "" ] && fd $1 | rofi -theme Monokai -dmenu -sort -sorting-method fzf | xargs ta
```

And 90% of it was in [the manual][tam]. Doh.

[ta]: https://orbitalquark.github.io/textadept
[tam]: https://orbitalquark.github.io/textadept/manual.html
