+++
draft = false
title = "Something like ldd on Windows"
date = 2026-01-10T17:07:27Z
tags = ["windows"]
+++

**Windows** does not have `ldd` it seems, but if you have Visual Studio installed,
(in my case 2022) then you can do:

```
dumpbin /dependents filename.dll/exe
```

And of course it's not on the PATH, but it works inside VS' terminal.

The **macOS** version I regularly forget is:

```
otool -L /path/to/binary
```

Maybe now.
