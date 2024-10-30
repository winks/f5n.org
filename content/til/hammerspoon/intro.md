+++
draft = false
title = "Intro to Hammerspoon"
date = 2024-10-30T17:41:05Z
tags = ["hammerspoon"]
+++

The feature I was missing most on the mac was window management like I knew it
from i3. I'm not yet sure if I could exactly replicate that (i.e. Win+1-9 for
different workspaces, shared over all screens) but I'll try something else now.

Assigning the main apps I had on those workspaces to keys and just
focusing/launching them, via cmd-shift-[`1-9]
with [Hammerspoon](https://hammerspoon.org).

This is my very minimal config at the moment (`~/.hammerspoon/init.lua`):

```lua
mod = {"cmd", "shift"}

myShortcuts = {
    {"1", "Terminal"},
    {"2", "IntelliJ IDEA"},
    {"3", "Firefox"},
    {"4", "Slack"},
    {"5", "Microsoft Outlook"},

    {"7", "Safari"},
    {"8", "Cog"},
    {"9", "Google Chrome"},

    {"`",  "Google Chrome"},
}

for i,shortcut in ipairs(myShortcuts) do
    hs.hotkey.bind(mod, shortcut[1], function()
        hs.application.launchOrFocus(shortcut[2])
    end)
end

function RunWithArgs(executable, args)
    local t = hs.task.new(executable, 
    nil,
    function() return false end,
    args)
    t:start()
end

-- this opens the hammerspoon config in TextEdit
hs.hotkey.bind(mod, "F12", function()
    RunWithArgs("/usr/bin/open", {"-a", "TextEdit", "init.lua"})
end)
```

Unlike with the AppWindowSwitcher Spoon this works with apps on different
Spaces. Very much inspired by
[this post](https://rakhesh.com/coding/using-hammerspoon-to-switch-apps/).

I'm also using Rectangle right now but maybe I can replace everything
I need with some Hammerspoon stuff.
