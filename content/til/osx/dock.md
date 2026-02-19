+++
draft = false
title = "Spacers in the macOS Dock"
date = 2026-01-14T15:21:30Z
tags = ["osx"]
+++

The macOS dock doesn't just let you add spacers, but this can be fixed.

These are a built in way, but not great:

```shell
# Default size:

defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'

# Small size:

defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
```

```
killall Dock
```

Someone posted a debatably better way
[on reddit](https://www.reddit.com/r/MacOS/comments/w7338n/comment/kjy3uyi/):

>

    Create empty text file

    Rename the file extension to .app

    Right click on file and click on Get Info

    On some graphic program - for example Figma. Create Vertical Line - 0.7px width, opacity 80%.
    Color white; Make space on top about 10px and export that to png

    Open that exported line image and click copy image

    In window with Info about our new app -> click on folder icon and paste copied image.

    App will get line icon.

    Move this app to Application / Utils

    Move this app to Dock. You will get separator with vertical line there.

    If you need two separators, then just make copy of this file and insert that again to Dock


